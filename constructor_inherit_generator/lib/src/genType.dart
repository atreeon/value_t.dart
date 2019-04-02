import 'package:constructor_inherit_generator/src/ElementForConstructorInherit.dart';

String genType(ElementSuperType element, String className) {
  var fields = distinctFields(element);
  var sb = StringBuffer();

  // var classDef = "class _${className} implements ${className} {";
  // var fieldList = sb.writeln(parameterList(fields));
  // sb.writeln("){");
  // sb.writeln("var r = ${className}();");
  // sb.writeln(getSetFields(fields));
  // sb.write("return r;}");

  return sb.toString();
}

// String getFinalFields(Set<ElementAccessor> fields) {
//   if (fields.length == 0) return "";

//   var r =
//       fields.keys.fold("", (v, k) => "${v}\nfinal ${fields[k]} r.${k}= ${k};");

//   return r;
// }

String getSetFields(Map<String, String> fields) {
  if (fields.length == 0) return "";

  var r =
      fields.keys.fold("", (v, k) => "${v}\nfinal ${fields[k]} r.${k}= ${k};");

  return r;
}

String parameterList(Map<String, String> fields) {
  if (fields.length == 0) return "";

  var r = fields.keys.fold("", (v, k) => "${v} ${fields[k]} ${k},");

  return r.substring(1, r.length - 1);
}

Set<ElementAccessor> distinctFields(ElementSuperType element) {
  var fields = Set<ElementAccessor>();
  fields = getAccessors(fields, element);

  return fields;
}

Set<ElementAccessor> getAccessors(
    Set<ElementAccessor> fields, ElementSuperType element) {
  fields.addAll(element.elementAccessors);

  if (element.elementSuperType == null) return fields;

  return getAccessors(fields, element.elementSuperType);
}
