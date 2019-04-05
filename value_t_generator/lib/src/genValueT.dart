import 'package:value_t_generator/src/ElementForValueT.dart';

String genValueT(ElementSuperType element, String extendsClass) {
  var fields = distinctFields(element);
  var sb = StringBuffer();

  if (extendsClass[0] != "\$") throw Exception('classes must start with \$');
  var className = extendsClass.substring(1);

  List.unmodifiable(() sync* {
    yield () => classDefinition(className, extendsClass);
    if (fields.length == 0) return;

    yield () => finalFields(fields);
    yield () => constructor(className, fields);
    yield () => constructorAssertions(fields);
    yield () => copyWithSignature(className);
    yield () => copyWithParams(fields);
    yield () => copyWithCreate(className);
    yield () => copyWithLines(fields);
    yield () => closing();
  }())
      .forEach((x) => sb.writeln(x()));

  return sb.toString();
}

String classDefinition(String className, String classExtends) =>
    "class ${className} implements ${classExtends} {";

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
