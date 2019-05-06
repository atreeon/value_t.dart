import 'package:meta/meta.dart';
import 'package:value_t_annotation/value_t_annotation.dart';

part 'ValueT_SubTypes.g.dart';

@ValueT(true)
abstract class $Person {
  String get name;
  $Pet get pet;

  const $Person();
}

@ValueT(true)
abstract class $Pet {
  String get type;
  String get colour;
  $Collar get collar;
}

@ValueT(false)
abstract class $Collar {
  String get size;
}