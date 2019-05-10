import 'package:value_t_generator/src/ElementForValueT.dart';
import 'package:value_t_generator/src/distinctFields.dart';

StringBuffer combine(List<Property> properties) {
  var sb = StringBuffer();
  sb.write("__");
  for (var item in properties) {
    if (item.properties != null) {
      sb.write(item.name +
          ":" +
          item.hasSub.toString() +
          "," +
          combine(item.properties).toString());
    } else {
      sb.write(item.name + ":" + item.hasSub.toString() + ",");
    }
  }
  return sb;
}

List<Property> combineProperties(ElementSuperType element) {
  var list = List<Property>();

  list.addAll(element.properties);
  list.addAll(getInterfaces(element));
  return list;
}

List<Property> getInterfaces(ElementSuperType superType) {
  var list = List<Property>();

  for (var item in superType.interfaces) {
    list.addAll(item.properties);
  }

  if (superType.elementSuperType != null) {
    list.addAll(getInterfaces(superType.elementSuperType));
  }

  return list;
}

String genValueT(
    bool isAbstract, ElementSuperType element, String extendsClass) {
  var fields = distinctFields(element);
  var sb = StringBuffer();
  var superTypeName = element.name?.substring(1);
  var interfaceNames =
      element?.interfaces?.map((x) => x.name?.substring(1))?.toList();
  var properties = combineProperties(element);
  sb.writeln("//" + (superTypeName ?? "null"));
  sb.writeln("//" + (interfaceNames?.toString() ?? "null"));
  sb.writeln("//" + (properties.toString()));

  if (extendsClass[0] != "\$") throw Exception('classes must start with \$');
  var className = extendsClass.substring(1);

  List.unmodifiable(() sync* {
    yield () => "//" + combine(element.properties).toString(); //keep me
    // yield () => "//" + fields.map((x) => x.extra).join("|");
    yield () => classDefinition(isAbstract, className, extendsClass);
    yield () => extendsAndInterfaces(className, superTypeName, interfaceNames);
    yield () => "{";
    if (fields.isNotEmpty) {
      yield () => finalFields(isAbstract, fields);
      if (!isAbstract) {
        yield () => constructor(className, fields);
        yield () => constructorAssertions(fields);
      } else {
        yield () => constructorNoFields(className);
      }
      yield () => copyWithSignature(className);
      yield () => copyWithParams(properties);
      yield () => "})";
      if (isAbstract) {
        yield () => ";";
      } else {
        yield () => copyWithCreate(className);
        yield () => copyWithLines(className, properties);
        // yield () => toString(fields);
      }
    } else {
      yield () => constructorNoFields(className);
    }
    yield () => closeClass();
  }())
      .forEach((x) => sb.writeln(x()));

  return sb.toString();
}

String imports() => "import 'package:meta/meta.dart';";

String classDefinition(
        bool isAbstract, String className, String classExtends) =>
    (isAbstract ? "abstract " : "") +
    "class ${className}"; // implements ${classExtends} {";

String extendsAndInterfaces(
    String className, String superTypeName, List<String> interfaceNames) {
  var extend = superTypeName == null
      ? " extends \$${className} "
      : " extends ${superTypeName} ";

  var implement = interfaceNames.length > 0
      ? "implements " + interfaceNames.join(",") + " "
      : "";
  return extend + implement;
}

String finalFields(bool isAbstract, List<ElementAccessor> fields) =>
    fields.fold(
        "",
        (v, k) => isAbstract
            ? "${v}\n${k.type} get ${k.name};"
            : "${v}\nfinal ${k.type} ${k.name};");

String constructorNoFields(String className) => "const ${className}();";

String constructor(String className, List<ElementAccessor> fields) =>
    "" +
    "const ${className}({" +
    fields.fold(
        "",
        (v, k) => k.defaultValue == null
            ? "${v}@required this.${k.name},\n"
            : "${v}this.${k.name} = ${k.defaultValue.trim()},\n") +
    "}):";

String constructorAssertions(List<ElementAccessor> fields) {
  var assertions =
      fields.fold("", (v, k) => "${v}\nassert(${k.name} != null),");
  return assertions.substring(0, assertions.length - 1) + ";";
}

String copyWithSignature(String className) => "${className} copyWith({";

String copyWithParams(List<Property> properties) {
  var properties1Level = getPropertiesOneLevel(properties);

  var l1 = properties1Level.toList();
  var l2 = properties1Level
      .where((x) => x.properties != null)
      .expand((i) => i.properties)
      .toList();

  return (l1 + l2).fold("", (v, k) => "${v}${k.type} ${k.nameHierarchy},\n");
}

/*TODO
 - create test for main create part
 - move some types outside of this file
*/

String copyWithCreate(String className) => " => ";

List<Property> getPropertiesOneLevel(List<Property> properties) {
  var properties1Level = List<Property>();

  for (var item in properties) {
    if (item.hasSub) {
      properties1Level.add(Property(item.name, item.type,
          nameHierarchy: item.name,
          properties: addProperties([item.name], item.properties, 0)));
    } else {
      properties1Level
          .add(Property(item.name, item.type, nameHierarchy: item.name));
    }
  }

  return properties1Level;
}

List<Property> addProperties(
    List<String> propertyName, List<Property> properties, int level) {
  var propertiesNew = List<Property>();
  for (var item in properties) {
    propertiesNew.add(Property(
      level == 0 ? item.name : "${propertyName.skip(1).join("_")}_${item.name}",
      item.type,
      nameHierarchy: "${propertyName.join("_")}_${item.name}",
    ));

    if (item.hasSub) {
      propertiesNew.addAll(addProperties(
          propertyName + [item.name], item.properties, level + 1));
    }
  }

  return propertiesNew;
}

String copyWithLines(String className, List<Property> properties) {
  var properties1 = getPropertiesOneLevel(properties);
  var sb = StringBuffer();

  sb.writeln("$className(");
  //TODO: collar_size not size
  for (var item in properties1) {
    if (item.properties != null && item.properties.length > 0) {
      sb.write("${item.name}: ${item.name} == null");
      for (var subProp in item.properties) {
        sb.write(" && ${subProp.nameHierarchy} == null");
      }

      sb.write("\n? this.${item.name}");
      sb.write("\n: ${item.name}.copyWith(");

      for (var subProp in item.properties) {
        sb.write("${subProp.name}: ${subProp.nameHierarchy}, ");
      }
      sb.write(")");
    } else {
      sb.writeln(
          "${item.name}: ${item.name} == null ? this.${item.name} : ${item.name},");
    }
  }
  sb.write("\n);");

  return sb.toString();
}

// String copyWithLines(List<ElementAccessor> fields) => fields.fold(
//     "",
//     (v, k) =>
//         "${v}\n${k.name}: ${k.name} == null ? this.${k.name} : ${k.name},");

// String closeCopyWith() => ");";

String toString(List<ElementAccessor> fields) {
  var toString = fields.fold("@override String toString() => ",
      (v, k) => """${v} "|${k.name}:" + ${k.name}.toString() +""");

  return toString.substring(0, toString.length - 1) + ";";
}

String closeClass() => "}";
