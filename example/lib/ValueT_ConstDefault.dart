import 'package:example/ValueT_Pets.dart';
import 'package:meta/meta.dart';
import 'package:value_t_annotation/value_t_annotation.dart';

part 'ValueT_ConstDefault.g.dart';

@ValueT(true)
abstract class $Person {
  String get name;
  const $Person();
}

@ValueT(true)
abstract class $OftenWet {
  String get wetness;
  const $OftenWet();
}

@ValueT(true)
abstract class $Employee extends $Person {
  int get employeeId;
}

@ValueT()
abstract class $WindowCleaner extends $Employee implements $OftenWet {
  String get windowMaxSize => "big";
  $Pet get pet => const Pet(type: "cat");
}

@ValueT()
abstract class $Manager extends $Person {
  String get bosses;
}

main() {
  var a = WindowCleaner(
      employeeId: 5, name: "bob", wetness: "very wet", pet: Pet(type: "dog"));
  print(a.toString());
}
