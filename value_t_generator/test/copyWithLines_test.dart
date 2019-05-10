import 'package:test/test.dart';
import 'package:value_t_generator/src/ElementForValueT.dart';
import 'package:value_t_generator/src/genValueT.dart';

void main() {
  group("copyWithLines", () {
    void exp_copyWithLines(
        String className, List<Property> properties, String expected) {
      var result = copyWithLines(className, properties);
      expect(result.trim(), expected.trim());
    }

    test("1", () {
      exp_copyWithLines("Collar", [
        Property("id", "int", hasSub: false),
        Property("size", "String", hasSub: false),
      ], """
Collar(
id: id == null ? this.id : id,
size: size == null ? this.size : size,

);
""");
    });

    test("2", () {
      exp_copyWithLines("Pet", [
        Property("colour", "String", hasSub: false),
        Property("type", "String", hasSub: false),
        Property("collar", "Collar", hasSub: true, properties: [
          Property("size", "String", hasSub: false),
          Property("id", "int", hasSub: false),
        ]),
      ], """
Pet(
colour: colour == null ? this.colour : colour,
type: type == null ? this.type : type,
collar: collar == null && collar_size == null && collar_id == null
? this.collar
: collar.copyWith(size: collar_size, id: collar_id, )
);
""");
    });

    test("3", () {
      exp_copyWithLines("Person", [
        Property("name", "String", hasSub: false),
        Property("pet", "Pet", hasSub: true, properties: [
          Property("type", "String", hasSub: false),
          Property("colour", "String", hasSub: false),
          Property("collar", "Collar", hasSub: true, properties: [
            Property("size", "String", hasSub: false),
            Property("id", "int", hasSub: false),
          ]),
        ]),
      ], """
Person(
name: name == null ? this.name : name,
pet: pet == null && pet_type == null && pet_colour == null && pet_collar == null && pet_collar_size == null && pet_collar_id == null
? this.pet
: pet.copyWith(type: pet_type, colour: pet_colour, collar: pet_collar, collar_size: pet_collar_size, collar_id: pet_collar_id, )
);
""");
    });
  });
}
