import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:value_t_generator/src/ValueTGenerator.dart';

Builder valueTBuilder(BuilderOptions options) =>
    SharedPartBuilder([ValueTGenerator()], 'value_t');
