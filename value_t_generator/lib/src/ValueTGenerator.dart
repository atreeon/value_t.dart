import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:value_t/ValueT.dart';
import 'package:value_t_generator/src/ElementForValueT.dart';
import 'package:value_t_generator/src/genValueT.dart';

List<ElementAccessor> createAccessors(
        List<PropertyAccessorElement> accessors) =>
    accessors
        .where((x) => x.isGetter)
        .map((x) => ElementAccessor(x.name, x.returnType.toString()))
        .toList();

ElementSuperType createElementSuperType(ClassElement classElement) {
  if (classElement.supertype.name == "Object") {
    return ElementSuperType(
      null,
      createAccessors(classElement.accessors.toList()),
      classElement.interfaces.map((x) => createInterface(x)).toList(),
    );
  }

  return ElementSuperType(
    createElementSuperType(classElement.supertype.element),
    createAccessors(classElement.accessors),
    classElement.interfaces.map((x) => createInterface(x)).toList(),
  );
}

Interface createInterface(InterfaceType interfaceType) {
  if (interfaceType.superclass.name == "Object") {
    return Interface(
      null,
      createAccessors(interfaceType.accessors.toList()),
      interfaceType.interfaces.map((x) => createInterface(x)).toList(),
    );
  }

  return Interface(
    createElementSuperType(interfaceType.superclass.element),
    createAccessors(interfaceType.accessors.toList()),
    interfaceType.interfaces.map((x) => createInterface(x)).toList(),
  );
}

class ValueTGenerator extends GeneratorForAnnotation<ValueT> {
  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    var sb = StringBuffer();
    if (element is ClassElement) {
      // createElementSuperType(element);
      sb.writeln(
          genValueT(createElementSuperType(element), element.displayName));
    }

    return sb.toString();
  }
}
