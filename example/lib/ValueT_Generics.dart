import 'package:meta/meta.dart';
import 'package:value_t_annotation/value_t_annotation.dart';

part 'ValueT_Generics.g.dart';

@ValueT()
abstract class $PetDepartment<T extends Pet> {
  List<T> get pets;

  const $PetDepartment();
}

// main() {
//   var a = PetDepartment<Cat>();

// }

abstract class Pet {
  final String name;
  Pet(this.name);

  String noise();
}

class Cat extends Pet {
  Cat(String name) : super(name);
  String noise() => "meow";
}

class Dog extends Pet {
  Dog(String name) : super(name);
  String noise() => "woof";
}
