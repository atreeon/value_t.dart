// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ValueT_SubTypes.dart';

// **************************************************************************
// ValueTGenerator
// **************************************************************************

//6 points: abstract all classes | implements not extends | empty constant constructor | Generated classes as generics do not work | functions not included in copywith | fields should be getters
class Person extends $Person {
  final String name;
  final Pet pet;
  const Person({
    @required this.name,
    @required this.pet,
  })  : assert(name != null),
        assert(pet != null);
  Person copyWith({
    String name,
    Pet pet,
    String pet_type,
    String pet_colour,
    Collar pet_collar,
    String pet_collar_size,
    String pet_collar_id,
  }) =>
      Person(
        name: name == null ? this.name : name,
        pet: pet == null &&
                pet_type == null &&
                pet_colour == null &&
                pet_collar == null &&
                pet_collar_size == null &&
                pet_collar_id == null
            ? this.pet
            : this.pet.copyWith(
                  type: pet_type,
                  colour: pet_colour,
                  collar: pet_collar,
                  collar_size: pet_collar_size,
                  collar_id: pet_collar_id,
                ),
      );
  @override
  String toString() => "|name:" + name.toString() + "|pet:" + pet.toString();
}

//6 points: abstract all classes | implements not extends | empty constant constructor | Generated classes as generics do not work | functions not included in copywith | fields should be getters
class Pet extends $Pet {
  final Collar collar;
  final String colour;
  final String type;
  const Pet({
    @required this.collar,
    @required this.colour,
    @required this.type,
  })  : assert(collar != null),
        assert(colour != null),
        assert(type != null);
  Pet copyWith({
    String type,
    String colour,
    Collar collar,
    String collar_size,
    String collar_id,
  }) =>
      Pet(
        type: type == null ? this.type : type,
        colour: colour == null ? this.colour : colour,
        collar: collar == null && collar_size == null && collar_id == null
            ? this.collar
            : this.collar.copyWith(
                  size: collar_size,
                  id: collar_id,
                ),
      );
  @override
  String toString() =>
      "|collar:" +
      collar.toString() +
      "|colour:" +
      colour.toString() +
      "|type:" +
      type.toString();
}

//6 points: abstract all classes | implements not extends | empty constant constructor | Generated classes as generics do not work | functions not included in copywith | fields should be getters
abstract class Accessory extends $Accessory {
  String get id;
  const Accessory();
  Accessory copyWith({
    String id,
  });
}

//6 points: abstract all classes | implements not extends | empty constant constructor | Generated classes as generics do not work | functions not included in copywith | fields should be getters
class Collar extends $Collar implements Accessory {
  final String id;
  final String size;
  const Collar({
    @required this.id,
    @required this.size,
  })  : assert(id != null),
        assert(size != null);
  Collar copyWith({
    String size,
    String id,
  }) =>
      Collar(
        size: size == null ? this.size : size,
        id: id == null ? this.id : id,
      );
  @override
  String toString() => "|id:" + id.toString() + "|size:" + size.toString();
}
