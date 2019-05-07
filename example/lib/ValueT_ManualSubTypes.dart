import 'package:meta/meta.dart';

// @ValueT(false)
abstract class $Person {
  String get name;
  $Pet get pet;

  const $Person();
}

abstract class $Pet {
  String get type;
  String get colour;
  $Collar get collar;
  const $Pet();
}

abstract class $Accessory {
  String get id;
  const $Accessory();
}

abstract class $Collar {
  String get size;
  const $Collar();
}

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
              : pet.copyWith(
                  colour: pet_colour,
                  type: pet_type,
                  collar: pet_collar,
                  collar_size: pet_collar_size,
                  collar_id: pet_collar_id,
                ));
}

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
    String colour,
    String type,
    Collar collar,
    String collar_size,
    String collar_id,
  }) =>
      Pet(
          colour: colour == null ? this.colour : colour,
          type: type == null ? this.type : type,
          collar: collar == null && collar_size == null && collar_id == null
              ? this.collar
              : collar.copyWith(size: collar_size, id: collar_id));
}

abstract class Accessory extends $Accessory {
  String get id;
  const Accessory();
}

class Collar extends $Collar implements Accessory {
  final String id;
  final String size;
  const Collar({
    @required this.id,
    @required this.size,
  })  : assert(id != null),
        assert(size != null);
  Collar copyWith({
    String id,
    String size,
  }) =>
      Collar(
        id: id == null ? this.id : id,
        size: size == null ? this.size : size,
      );
}
