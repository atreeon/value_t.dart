import 'package:meta/meta.dart';

// @ValueT(false)
abstract class $Person {
  String get name;

  const $Person();
}

// @ValueT(true)
abstract class $Pet {
  String get type;
  String get colour;
}

//*****generated code********//
class Person extends $Person {
  final String name;
  final Pet pet;

  Person({this.name, this.pet});

  Person copyWith({
    String name,
    Pet pet,
    String pet_type,
    String pet_colour,
  }) =>
      Person(
          name: name == null ? this.name : name,
          pet: pet == null
              ? pet_type == null && pet_colour == null
                  ? pet = this.pet
                  : pet.copyWith(type: pet_type, colour: pet_colour)
              : pet = pet);
  // pet: pet == null ?

  //if pet is null
  //  if pet_type is null && pet_colour is null
  //    pet = this.pet
  //  else
  //    pet = pet.copyWith(colour: pet.colour, type: type.colour)
  //else
  //  pet = pet

}

class Pet extends $Pet {
  final String type;
  final String colour;
  final Bag bag;

  Pet({this.type, this.colour});

  Pet copyWith({String type, String colour}) => Pet(
      type: type == null ? this.type : type,
      colour: colour == null ? this.colour : colour);
}
