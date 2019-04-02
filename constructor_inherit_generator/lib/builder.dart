import 'package:build/build.dart';
import 'package:constructor_inherit_generator/src/ConstructorInheritGenerator.dart';
import 'package:source_gen/source_gen.dart';

Builder constructorInheritBuilder(BuilderOptions options) =>
    SharedPartBuilder([ConstructorInheritGenerator()], 'constructor_inherit');
