import 'package:constructor_inherit_generator/src/ElementForConstructorInherit.dart';

String createFactory(ElementSuperType element, String className) {
  var fields = distinctFields(element);
  var sb = StringBuffer();

  sb.writeln(
      "${className} ${className[0].toLowerCase()}${className.substring(1)}(");
  sb.writeln(parameterList(fields));
  sb.writeln("){");
  sb.writeln("var r = ${className}();");
  sb.writeln(getSetFields(fields));
  sb.write("return r;}");

  return sb.toString();
}

String getSetFields(Map<String, String> fields) {
  if (fields.length == 0) return "";

  var r = fields.keys.fold("", (v, k) => "${v}\nr.${k}= ${k};");

  return r;
}

String parameterList(Map<String, String> fields) {
  if (fields.length == 0) return "";

  var r = fields.keys.fold("", (v, k) => "${v} ${fields[k]} ${k},");

  return r.substring(1, r.length - 1);
}

Map<String, String> distinctFields(ElementSuperType element) {
  var fields = Map<String, String>();
  fields = getAccessors(fields, element);

  return fields;
}

Map<String, String> getAccessors(
    Map<String, String> fields, ElementSuperType element) {
  fields.addAll(Map.fromIterable(element.elementAccessors,
      key: (x) => x.name, value: (x) => x.type));

  if (element.elementSuperType == null) return fields;

  return getAccessors(fields, element.elementSuperType);
}
