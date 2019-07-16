import 'package:analyzer/dart/element/element.dart';
import 'package:value_t_generator/src/ElementForValueT.dart';
import 'package:value_t_generator/src/genValueT/distinctFields.dart';
import 'package:value_t_generator/src/genValueT/getPropertiesOneLevel.dart';

///Combines all the properties from the ElementSuperType into one
/// the properties from the main element and the various hierarchies
/// of the interfaces too
List<Property> combineProperties(ElementSuperType element) {
  var list = List<Property>();

  list.addAll(element.properties);
  list.addAll(getInterfaceProperties(element));

  return list;
}

///Recursive looping through all the levels of the ElementSuperType
List<Property> getInterfaceProperties(ElementSuperType superType) {
  var list = List<Property>();

  for (var item in superType.interfaces) {
    list.addAll(item.properties);
  }

  if (superType.elementSuperType != null) {
    list.addAll(getInterfaceProperties(superType.elementSuperType));
  }

  return list;
}

String removeDollarFromString(String type) => type.replaceAll("\$", "");

///main function that takes our ElementSuperType and creates an output
String genValueT(bool isAbstract, ElementSuperType element, String extendsClass,
    [List<String> generics]) {
  var fields = distinctFields(element);
  var sb = StringBuffer();
  var superTypeName = element.name?.substring(1);
  var interfaceNames =
      element?.interfaces?.map((x) => removeDollarFromString(x.name))?.toList();
  var properties = combineProperties(element);
  // sb.writeln("//" + (superTypeName ?? "null"));
  // sb.writeln("//" + (interfaceNames?.toString() ?? "null"));
  // sb.writeln("//" + (properties.toString()));
  // sb.writeln("//" + (element.properties.toString()));
  // sb.writeln("//" + (getInterfaceProperties(element).toString()));

  if (extendsClass[0] != "\$") throw Exception('classes must start with \$');
  var className = extendsClass.substring(1);

  List.unmodifiable(() sync* {
    // yield () => "//" + element.properties.map((x) => x.name.toString()).toList().toString(); //keep me
    // yield () => "//" + element.elementAccessors.map((x) => x.name.toString()).toList().toString(); //keep me
    // yield () => "//" + element.interfaces.map((x) => x.name.toString()).toList().toString(); //keep me

    // yield () => "//" + fields.map((x) => x.extra).join("|");
    // yield () => "/*";
    yield () => classDefinition(isAbstract, className, generics);
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
        yield () => toString(fields);
      }
    } else {
      yield () => constructorNoFields(className);
    }
    yield () => closeClass();
    // yield () => "*/";
  }())
      .forEach((x) => sb.writeln(x()));

  return sb.toString();
}

String imports() => "import 'package:meta/meta.dart';";

String classDefinition(
    bool isAbstract, String className, List<String> generics) {
  var result = (isAbstract ? "abstract " : "") + "class ${className}";

  if (generics.length == 0) return result;

  return result +
      " " +
      generics.toString().replaceAll("[", "<").replaceAll("]", ">");
}

String extendsAndInterfaces(
    String className, String superTypeName, List<String> interfaceNames) {
  var extend = superTypeName == null
      ? " extends \$${className} "
      : " extends ${superTypeName} ";

  var implement = interfaceNames.length > 0
      ? " implements " + interfaceNames.join(",") + " "
      : "";
  return extend + implement;
}

String finalFields(bool isAbstract, List<ElementAccessor> fields) {
  var result = fields.fold(
      "",
      (v, k) => isAbstract
          ? "${v}\n${formatField(k.type)} get ${k.name};"
          : "${v}\nfinal ${formatField(k.type)} ${k.name};");
  return result;
}

String formatField(String field) {
  if (!field.contains("→")) return field;

  var function = field.split("→");
  return "${function[1]} Function${function[0]}".trim();
}

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

String copyWithCreate(String className) => " => ";

String copyWithLines(String className, List<Property> properties) {
  var properties1 = getPropertiesOneLevel(properties);
  var sb = StringBuffer();

  sb.writeln("$className(");
  for (var item in properties1) {
    if (item.properties != null && item.properties.length > 0) {
      sb.write("${item.name}: ${item.name} == null");
      for (var subProp in item.properties) {
        sb.write(" && ${subProp.nameHierarchy} == null");
      }

      sb.write("\n? this.${item.name}");
      sb.write("\n: this.${item.name}.copyWith(");

      for (var subProp in item.properties) {
        sb.write("${subProp.name}: ${subProp.nameHierarchy}, ");
      }
      sb.write("),");
    } else {
      sb.writeln(
          "${item.name}: ${item.name} == null ? this.${item.name} : ${item.name},");
    }
  }
  sb.write("\n);");

  return sb.toString();
}

String toString(List<ElementAccessor> fields) {
  var toString = fields.fold("@override String toString() => ",
      (v, k) => """${v} "|${k.name}:" + ${k.name}.toString() +""");

  return toString.substring(0, toString.length - 1) + ";";
}

String closeClass() => "}";
