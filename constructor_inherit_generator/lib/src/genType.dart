import 'package:constructor_inherit_generator/src/ElementForConstructorInherit.dart';

String genType(ElementSuperType element, String className) {
  var fields = distinctFields(element);
  var sb = StringBuffer();

  // if (className[0] != "\$") throw Exception('classes must start with \$');

  className = className.substring(1);

  [
    () => classDefinition(className),
    () => finalFields(fields),
    () => constructor(className, fields),
    () => constructorAssertions(fields),
    () => copyWithSignature(className),
    () => copyWithParams(fields),
    () => copyWithCreate(className),
    () => copyWithLines(fields),
    () => closing(),
  ].forEach((x) => sb.writeln(x()));

  return sb.toString();
}

String classDefinition(String className) =>
    "class ${className} implements \$${className} {";

String finalFields(List<ElementAccessor> fields) =>
    fields.fold("", (v, k) => "${v}\nfinal ${k.type} ${k.name};");

String constructor(String className, List<ElementAccessor> fields) =>
    "${className}(" + fields.fold("", (v, k) => "${v}this.${k.name},\n") + "){";

String constructorAssertions(List<ElementAccessor> fields) =>
    fields.fold("", (v, k) => "${v}\nassert(this.${k.name} != null);") + "}";

String copyWithSignature(String className) => "${className} copyWith({";

String copyWithParams(List<ElementAccessor> fields) =>
    fields.fold("", (v, k) => "${v}${k.type} ${k.name},\n") + "}) =>";

String copyWithCreate(String className) => "${className}(";

String copyWithLines(List<ElementAccessor> fields) => fields.fold(
    "", (v, k) => "${v}\n${k.name} == null ? this.${k.name} : ${k.name},");

String closing() => ");}";

//reusable
List<ElementAccessor> distinctFields(ElementSuperType element) {
  var fields = Set<ElementAccessor>();
  var r = getAccessors(fields, element).toList();
  r.sort((a, b) => a.name.compareTo(b.name));
  return r;
}

Set<ElementAccessor> getAccessors(
    Set<ElementAccessor> fields, ElementSuperType element) {
  fields.addAll(element.elementAccessors);

  if (element.elementSuperType == null) return fields;

  return getAccessors(fields, element.elementSuperType);
}
