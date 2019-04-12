import 'package:meta/meta.dart';
import 'package:value_t_annotation/value_t_annotation.dart';

part 'ValueT_Pets.g.dart';

@ValueT()
abstract class $Pet {
  String get type;

  const $Pet();
}

main() {
  var a = Pet(type: "cat");
  var b = Pet(type: "cat");
  print(a == b); //false
}
