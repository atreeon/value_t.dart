import 'package:test/test.dart';
import 'package:value_t_generator/src/ElementForValueT.dart';
import 'package:value_t_generator/src/genValueT.dart';

void main() {
  group("getPropertyNames", () {
    void exp_getPropertyNames(
        List<Property> properties, List<String> expected) {
      var result = getPropertyNames(properties);
      expect(result.toString(), expected.toString());
    }

    test("1", () {
      exp_getPropertyNames([
        Property("name", "String", false),
        Property("pet", "Pet", true, [
          Property("type", "String", false),
          Property("colour", "String", false),
        ])
      ], [
        "pet_type",
        "pet_colour"
      ]);
    });

    test("2", () {
      exp_getPropertyNames([
        Property("name", "String", false),
        Property("pet", "Pet", true, [
          Property("type", "String", false),
          Property("colour", "String", false),
          Property("collar", "Collar", true, [
            Property("id", "int", false),
            Property("size", "String", false),
          ])
        ]),
        Property("friend", "Friend", true, [
          Property("name", "String", false),
          Property("height", "String", false),
        ])
      ], [
        "pet_type",
        "pet_colour",
        "pet_collar",
        "pet_collar_id",
        "pet_collar_size",
        "friend",
        "friend_name",
        "friend_height",
      ]);
    });
  });
}
// , """id: id == null ? this.id : id,
// name: name == null ? this.name : name,""");
//     });

//     test("2", () {
//       exp_copyWithLines([
//         ElementAccessor("name", "String"),
//         ElementAccessor("pet", "Pet"),
//       ], [
//         Property("name", "String", false),
//         Property("pet", "Pet", true, [
//           Property("type", "String", false),
//           Property("colour", "String", false),
//         ]),
//       ], """
// colour: colour == null ? this.colour : colour,
//     type: type == null ? this.type : type,
//     collar: collar == null && collar_size == null && collar_id == null
//         ? this.collar
//         : collar.copyWith(size: collar_size, id: collar_id)""");
//     });

/*
name: name == null ? this.name : name,
          pet: pet == null
              ? pet_type == null && pet_colour == null
                  ? pet = this.pet
                  : pet.copyWith(type: pet_type, colour: pet_colour)
              : pet = pet)
*/
//     test("3", () {
//       exp_copyWithParams([
//         ElementAccessor("name", "String"),
//         ElementAccessor("pet", "Pet"),
//       ], [
//         Property("name", "String", false),
//         Property("pet", "Pet", true, [
//           Property("type", "String", false),
//           Property("colour", "String", false),
//           Property("collar", "Collar", true, [
//             Property("id", "int", false),
//             Property("size", "String", false),
//           ]),
//         ]),
//       ], """String name,
// Pet pet,
// String pet_type,
// String pet_colour,
// Collar pet_collar,
// int pet_collar_id,
// String pet_collar_size,
// """);
//     });
