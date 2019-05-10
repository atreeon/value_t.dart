import 'package:example/ValueT_Pets.dart';
import 'package:meta/meta.dart';
import 'package:value_t_annotation/value_t_annotation.dart';

part 'ValueT_CopyWithHierarchy.g.dart';

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
  const $Employee();
}

@ValueT(false)
abstract class $WindowCleaner extends $Employee implements $OftenWet {
  String get windowMaxSize => "big";
  $Pet get pet;
  const $WindowCleaner();
}

@ValueT()
abstract class $Manager extends $Person {
  String get bosses;
}

main() {
  Person a = WindowCleaner(
      pet: Pet(type: "cat"), name: "Bob", employeeId: 5, wetness: "wet");

  if (a is Employee) {
    print('I am an employee');
    print(a.employeeId);
  }

  if (a is Person) {
    print('I am a Person');
    print(a.name);
  }

  var b = a.copyWith(name: "bobby");
  print(b.name);

  if (b is OftenWet) {
    print("windowCleaners are OftenWet");
  }
}
