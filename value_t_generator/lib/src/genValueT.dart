import 'package:value_t_generator/src/ElementForValueT.dart';
import 'package:value_t_generator/src/distinctFields.dart';

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
    // yield () => "//" + fields.map((x) => x.extra).join("|");
    yield () => classDefinition(isAbstract, className, extendsClass);
    yield () => extendsAndInterfaces(className, superTypeName, interfaceNames);
    yield () => "{";
    if (fields.isNotEmpty) {
      yield () => finalFields(isAbstract, fields);
      if (!isAbstract) {
        yield () => constructor(className, fields);
        yield () => constructorAssertions(fields);
      }
      yield () => copyWithSignature(className);
      yield () => copyWithParams(fields);
      if (isAbstract) {
        yield () => ";";
      } else {
        yield () => copyWithCreate(className);
        yield () => copyWithLines(fields);
        yield () => closeCopyWith();
      }
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

String constructor(String className, List<ElementAccessor> fields) =>
    "" +
    "${className}({" +
    fields.fold(
        "",
        (v, k) => k.defaultValue == null
            ? "${v}@required this.${k.name},\n"
            : "${v}this.${k.name} = ${k.defaultValue.trim()},\n") +
    "}){";

String constructorAssertions(List<ElementAccessor> fields) =>
    fields.fold("", (v, k) => "${v}\nassert(this.${k.name} != null);") + "}";

String copyWithSignature(String className) => "${className} copyWith({";

String copyWithParams(List<ElementAccessor> fields) =>
    fields.fold("", (v, k) => "${v}${k.type} ${k.name},\n") + "})";

String copyWithCreate(String className) => " => ${className}(";

String copyWithLines(List<ElementAccessor> fields) => fields.fold(
    "",
    (v, k) =>
        "${v}\n${k.name}: ${k.name} == null ? this.${k.name} : ${k.name},");

String closeCopyWith() => ");";

String closeClass() => "}";
