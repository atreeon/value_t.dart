// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ValueT_Generics.dart';

// **************************************************************************
// ValueTGenerator
// **************************************************************************

//5 points: abstract all classes | implements not extends | empty constant constructor | functions not included in copywith | fields should be getters
class PetShop extends $PetShop {
  final PetDepartment<Dog, String> dogs;
  final List<Dog> otherDogs;
  const PetShop({
    @required this.dogs,
    @required this.otherDogs,
  })  : assert(dogs != null),
        assert(otherDogs != null);
  PetShop copyWith({
    PetDepartment<$Dog, String> dogs,
    List<Dog> otherDogs,
  }) =>
      PetShop(
        dogs: dogs == null ? this.dogs : dogs,
        otherDogs: otherDogs == null ? this.otherDogs : otherDogs,
      );
  @override
  String toString() =>
      "|dogs:" + dogs.toString() + "|otherDogs:" + otherDogs.toString();
}

//5 points: abstract all classes | implements not extends | empty constant constructor | functions not included in copywith | fields should be getters
class PetDepartment<T1 extends $Pet, T2> extends $PetDepartment<T1, T2> {
  final List<T2> Function(List<dynamic>) loadFn;
  final List<T2> pets;
  final T1 somethingElse;
  const PetDepartment({
    @required this.loadFn,
    @required this.pets,
    @required this.somethingElse,
  })  : assert(loadFn != null),
        assert(pets != null),
        assert(somethingElse != null);
  PetDepartment copyWith({
    List<T2> pets,
    T1 somethingElse,
  }) =>
      PetDepartment(
        pets: pets == null ? this.pets : pets,
        somethingElse:
            somethingElse == null ? this.somethingElse : somethingElse,
      );
  @override
  String toString() =>
      "|loadFn:" +
      loadFn.toString() +
      "|pets:" +
      pets.toString() +
      "|somethingElse:" +
      somethingElse.toString();
}

//5 points: abstract all classes | implements not extends | empty constant constructor | functions not included in copywith | fields should be getters
class CatOwner extends $CatOwner {
  final Cat cat;
  const CatOwner({
    @required this.cat,
  }) : assert(cat != null);
  CatOwner copyWith({
    Cat cat,
  }) =>
      CatOwner(
        cat: cat == null ? this.cat : cat,
      );
  @override
  String toString() => "|cat:" + cat.toString();
}

//5 points: abstract all classes | implements not extends | empty constant constructor | functions not included in copywith | fields should be getters
class Pet extends $Pet {
  final String name;
  const Pet({
    @required this.name,
  }) : assert(name != null);
  Pet copyWith({
    String name,
  }) =>
      Pet(
        name: name == null ? this.name : name,
      );
  @override
  String toString() => "|name:" + name.toString();
}

//5 points: abstract all classes | implements not extends | empty constant constructor | functions not included in copywith | fields should be getters
class Cat extends $Cat implements Pet {
  final String name;
  const Cat({
    @required this.name,
  }) : assert(name != null);
  Cat copyWith({
    String name,
  }) =>
      Cat(
        name: name == null ? this.name : name,
      );
  @override
  String toString() => "|name:" + name.toString();
}

//5 points: abstract all classes | implements not extends | empty constant constructor | functions not included in copywith | fields should be getters
class Dog extends $Dog implements Pet {
  final String name;
  const Dog({
    @required this.name,
  }) : assert(name != null);
  Dog copyWith({
    String name,
  }) =>
      Dog(
        name: name == null ? this.name : name,
      );
  @override
  String toString() => "|name:" + name.toString();
}
