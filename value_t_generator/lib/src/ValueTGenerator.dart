import 'dart:async';

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:value_t_annotation/value_t_annotation.dart';
import 'package:value_t_generator/src/ElementForValueT.dart';
import 'package:value_t_generator/src/genValueT.dart';

Future<CompilationUnit> getUnit(Element accessor) => accessor.session
        .getResolvedLibraryByElement(accessor.library)
        .then((resolvedLibrary) {
      var declaration = resolvedLibrary.getElementDeclaration(accessor);
      return declaration.resolvedUnit.unit;
    });

Future<List<ElementAccessor>> createAccessors(
    List<PropertyAccessorElement> accessors) async {
  var blah = accessors.where((x) => x.isGetter).map((x) async {
    //not really sure how to get that code line
    var unit = await getUnit(x);

    return ElementAccessor(
        x.name, x.returnType.toString(), "//" + unit.toString() ?? "");
  }).toList();

  return Future.wait(blah);
}

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
