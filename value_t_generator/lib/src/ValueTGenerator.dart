import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:value_t/ValueT.dart';
import 'package:value_t_generator/src/ElementForValueT.dart';
import 'package:value_t_generator/src/genValueT.dart';

String addSpaces(int number) {
  var str = "";
  for (var i = 0; i < number; i++) {
    str = str + " ";
  }
  return str;
}

StringBuffer toStringElementSuperType(
    ElementSuperType superType, int level, StringBuffer sb) {
  for (var accessor in superType.elementAccessors) {
    sb.writeln("//" +
        addSpaces(level) +
        level.toString() +
        accessor.name +
        "|" +
        accessor.type);
  }

  if (superType.elementSuperType == null) return sb;

  return toStringElementSuperType(superType.elementSuperType, level + 1, sb);
}

List<ElementAccessor> createAccessors(
        List<PropertyAccessorElement> accessors) =>
    accessors
        .where((x) => x.isGetter)
        .map((x) => ElementAccessor(x.name, x.returnType.toString()))
        .toList();

ElementSuperType createElementSuperType(ClassElement classElement) {
  if (classElement.supertype.name == "Object") {
    return ElementSuperType(
        null, createAccessors(classElement.accessors.toList()));
  }

  return ElementSuperType(
      createElementSuperType(classElement.supertype.element),
      createAccessors(classElement.accessors));
}

class ValueTGenerator extends GeneratorForAnnotation<ValueT> {
  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    var sb = StringBuffer();
    if (element is ClassElement) {
      sb.writeln(
          genValueT(createElementSuperType(element), element.displayName));
    }

    return sb.toString();
  }
}
