import 'package:meta/meta.dart';
import 'package:value_t_annotation/value_t_annotation.dart';

part 'ValueT_SubTypes.g.dart';

@ValueT(false, ["pet"])
abstract class $Person {
  String get name;
  $Pet get pet;

  const $Person();
}

@ValueT(false, ["collar"])
abstract class $Pet {
  String get type;
  String get colour;
  $Collar get collar;

  const $Pet();
}

@ValueT(true)
abstract class $Accessory{
  String get id;

  const $Accessory();
}

@ValueT(false)
abstract class $Collar implements $Accessory {
  String get size;

  const $Collar();
}