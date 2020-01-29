import 'dart:async';

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:value_t_annotation/value_t_annotation.dart';
import 'package:value_t_generator/src/ElementForValueT.dart';
import 'package:value_t_generator/src/extractGetterBody.dart';
import 'package:value_t_generator/src/genValueT/genValueT.dart';

///Unit is the full text of the function / class and this returns the unit
/// from the accessor that was passed in.
Future<CompilationUnit> getUnit(Element accessor) => accessor.session
        .getResolvedLibraryByElement(accessor.library)
        .then((resolvedLibrary) {
      var declaration = resolvedLibrary.getElementDeclaration(accessor);
      return declaration.resolvedUnit.unit;
    });

///Where we have a Pet object inside a Person object.  This will retrieve all the
/// accessors from inside the Pet object so we can use them in the CopyWith object
List<Property> createSubListProperties(List<ElementAnnotation> metadata,
    List<PropertyAccessorElement> accessors, List<Property> properties) {
  accessors.where((x) => x.isGetter).forEach((x) {
    if (x.returnType.element is TypeParameterElement) {
      if (x.returnType != "Object") {
        properties.add(Property(
            x.name, x.returnType.toString().replaceFirst("\$", ""),
            hasSub: false));
      }
    } else if (x.returnType.element is ClassElement) {
      var element = x.returnType.element as ClassElement;

      if (metadata != null &&
          metadata.length > 0 &&
          metadata.first.toSource().indexOf(x.name) > 0) {
        var accessorsForProperty = element.accessors.toList();

        element.allSupertypes.where((x) => x.name != "Object").forEach((y) {
          accessorsForProperty.addAll(y.accessors);
        });

        properties.add(Property(
            x.name, x.returnType.toString().replaceFirst("\$", ""),
            hasSub: true,
            properties: createSubListProperties(
                element.metadata, accessorsForProperty, List<Property>())));
      } else {
        if (x.returnType != "Object") {
          properties.add(Property(
              x.name, x.returnType.toString().replaceFirst("\$", ""),
              hasSub: false));
        }
      }
    }
  });

  return properties;
}

Future<List<ElementAccessor>> createAccessors(
    List<PropertyAccessorElement> accessors) async {
  var elementAccessors = accessors.where((x) => x.isGetter).map((x) async {
    var unit = await getUnit(x);

    return ElementAccessor(x.name, x.returnType.toString(),
        defaultValue:
            extractGetterBody(x.name, x.returnType.toString(), unit.toString()),
        extra: x.returnType.element is ClassElement
            ? "//" +
                ((x.returnType.element as ClassElement).metadata.length > 0
                    ? (x.returnType.element as ClassElement)
                        .metadata
                        .first
                        .toSource()
                    : "")
            : "//${x.name} - NOT a");
  }).toList();

  return Future.wait(elementAccessors);
}

Future<ElementSuperType> createElementSuperType(
    ClassElement classElement) async {
  if (classElement.supertype.name == "Object") {
    return ElementSuperType(
        null,
        await createAccessors(classElement.accessors.toList()),
        await Future.wait(
          classElement.interfaces
              .map((x) async => await createInterface(x))
              .toList(),
        ),
        createSubListProperties(classElement.metadata,
            classElement.accessors.toList(), List<Property>()),
        null);
  }

  var thisClassesAccessors = classElement.allSupertypes
      .where((a2) => a2.name != "Object")
      .expand((a2) => a2.accessors)
      .toList();

  return ElementSuperType(
      await createElementSuperType(classElement.supertype.element),
      await createAccessors(classElement.accessors),
      await Future.wait(
        classElement.interfaces
            .map((x) async => await createInterface(x))
            .toList(),
      ),
      createSubListProperties(classElement.metadata,
          classElement.accessors.toList() + thisClassesAccessors, List<Property>()),
      classElement.supertype?.name ?? "");
}

Future<Interface> createInterface(InterfaceType interfaceType) async {
  if (interfaceType.superclass.name == "Object") {
    return Interface(
        null,
        await createAccessors(interfaceType.accessors.toList()),
        await Future.wait(
          interfaceType.interfaces
              .map((x) async => await createInterface(x))
              .toList(),
        ),
        createSubListProperties(
            null, interfaceType.accessors.toList(), List<Property>()),
        interfaceType.typeParameters.map((x) => x.toString()).toList(),
        interfaceType.name);
  }

  var accessors2 = interfaceType.interfaces
      .where((a2) => a2.name != "Object")
      .expand((a2) => a2.accessors)
      .toList();

  return Interface(
      await createElementSuperType(interfaceType.superclass.element),
      await createAccessors(interfaceType.accessors.toList()),
      await Future.wait(
        interfaceType.interfaces
            .map((x) async => await createInterface(x))
            .toList(),
      ),
      createSubListProperties(null,
          interfaceType.accessors.toList() + accessors2, List<Property>()),
      interfaceType.typeParameters.map((x) => x.toString()).toList(),
      interfaceType.name);
}

class ValueTGenerator extends GeneratorForAnnotation<ValueT> {
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    var sb = StringBuffer();
    if (element is ClassElement) {
      bool isAbstract = annotation.read('isAbstract')?.boolValue ?? false;
      List<String> generics =
          element.typeParameters.map((x) => x.toString()).toList();

      sb.writeln(genValueT(isAbstract, await createElementSuperType(element),
          element.displayName, generics));
    }

    return sb.toString();
  }
}
