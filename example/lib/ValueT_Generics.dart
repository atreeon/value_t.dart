import 'package:meta/meta.dart';
import 'package:value_t_annotation/value_t_annotation.dart';

part 'ValueT_Generics.g.dart';

@ValueT()
abstract class $PetShop {
  //Generated classes as generics do not work!  Unsure how to overcome this.
  $PetDepartment<$Dog, String> get dogs;
  List<$Dog> get otherDogs;

  const $PetShop();
}

@ValueT()
abstract class $PetDepartment<T1 extends $Pet, T2> {
  List<T2> get pets;
  T1 get somethingElse;
  List<T2> Function(List<dynamic>) get loadFn;

  const $PetDepartment();
}

@ValueT()
abstract class $CatOwner {
  $Cat get cat;

  const $CatOwner();
}

@ValueT()
abstract class $Pet {
  String get name;

  const $Pet();
}

@ValueT()
abstract class $Cat extends $Pet {
  String noise() => "meow";
  const $Cat();
}

@ValueT()
abstract class $Dog extends $Pet {
  String noise() => "meow";
}
