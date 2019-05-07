import 'package:value_t_generator/src/ElementForValueT.dart';
import 'package:value_t_generator/src/distinctFields.dart';

StringBuffer combine(List<Property> properties) {
  var sb = StringBuffer();
  sb.write("__");
  for (var item in properties) {
    if (item.properties != null) {
      sb.write(item.name +
          ":" +
          item.includeSubList.toString() +
          "," +
          combine(item.properties).toString());
    } else {
      sb.write(item.name + ":" + item.includeSubList.toString() + ",");
    }
  }
  return sb;
}

String genValueT(
    bool isAbstract, ElementSuperType element, String extendsClass) {
  var fields = distinctFields(element);
  var sb = StringBuffer();
  var superTypeName = element.name?.substring(1);
  var interfaceNames =
      element?.interfaces?.map((x) => x.name?.substring(1))?.toList();

  if (extendsClass[0] != "\$") throw Exception('classes must start with \$');
  var className = extendsClass.substring(1);

  List.unmodifiable(() sync* {
    yield () => "//" + combine(element.properties).toString();
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
      yield () => "//" + copyWithSignature(className);
      yield () => "/*" + copyWithParams(fields, element.properties) + "*/";
      // yield () => "})";
      if (isAbstract) {
        // yield () => ";";
      } else {
        //why is collar_id there twice???
        yield () => "/*" + copyWithCreate(className) + "*/";
        // yield () => copyWithLines(fields);
        yield () => "//" + closeCopyWith();
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

/*
HOUSTON

*/

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

// String copyWithParams(List<ElementAccessor> fields) =>
//     fields.fold("", (v, k) => "${v}${k.type} ${k.name},\n");

String copyWithParams(List<ElementAccessor> fields, List<Property> properties) {
  var blah = fields.fold("", (v, k) => "${v}${k.type} ${k.name},\n");

  for (var item in properties) {
    if (item.includeSubList) {
      blah = addProperties(blah, item.name, item.properties);
    }
  }

  return blah;
}

String addProperties(
    String blah, String propertyName, List<Property> properties) {
  for (var item in properties) {
    blah = blah + "${item.type} ${propertyName}_${item.name},\n";

    if (item.includeSubList) {
      blah =
          addProperties(blah, propertyName + "_" + item.name, item.properties);
    }
  }

  return blah;
}

String copyWithCreate(String className) => " => ${className}(";

class PropertyName {
  final String name;
  final List<String> subProperties;

  PropertyName(this.name, this.subProperties);
}

List<String> getPropertyNames(List<Property> properties,
    [String levelName = "", List<String> propertyNames]) {
  if (propertyNames == null) propertyNames = List<String>(); //default value

  var newPropertyNames = <String>[];
  for (var p in properties) {
    if (levelName != "") newPropertyNames.add(levelName + p.name);
    if (p.includeSubList) {
      newPropertyNames.addAll(getPropertyNames(
          p.properties, levelName + p.name + "_", propertyNames));
    }
  }

  return []..addAll(propertyNames)..addAll(newPropertyNames);
}

String copyWithLines(List<ElementAccessor> fields, List<Property> properties) {
  var sb = StringBuffer();

  for (var p in properties) {
    if (p.includeSubList) {
      //need to down to every level in the properties
      sb.writeln("${p.name}: ${p.name} == null");
      p.properties.forEach((x) => sb.write(" && ${x.name} == null"));
      sb.writeln("? ${p.name}");
      sb.writeln(": ${p.name}.copyWith");
    } else {
      sb.writeln("${p.name}: ${p.name} == null ? this.${p.name} : ${p.name},");
    }
  }

  return sb.toString();
}

// String copyWithLines(List<ElementAccessor> fields) => fields.fold(
//     "",
//     (v, k) =>
//         "${v}\n${k.name}: ${k.name} == null ? this.${k.name} : ${k.name},");

String closeCopyWith() => ");";

String toString(List<ElementAccessor> fields) {
  var toString = fields.fold("@override String toString() => ",
      (v, k) => """${v} "|${k.name}:" + ${k.name}.toString() +""");

  return toString.substring(0, toString.length - 1) + ";";
}

String closeClass() => "}";
