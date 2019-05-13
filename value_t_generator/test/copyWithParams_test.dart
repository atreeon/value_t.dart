import 'package:test/test.dart';
import 'package:value_t_generator/src/ElementForValueT.dart';
import 'package:value_t_generator/src/genValueT/genValueT.dart';

void main() {
  group("copyWithParams", () {
    void exp_copyWithParams(List<Property> properties, String expected) {
      var result = copyWithParams(properties);
      expect(result, expected);
    }

    test("1", () {
      exp_copyWithParams([
        Property("id", "int", hasSub: false),
        Property("name", "String", hasSub: false),
      ], """int id,
String name,
""");
    });

    test("2", () {
      exp_copyWithParams([
        Property("name", "String", hasSub: false),
        Property("pet", "Pet", hasSub: true, properties: [
          Property("type", "String", hasSub: false),
          Property("colour", "String", hasSub: false),
        ]),
      ], """String name,
Pet pet,
String pet_type,
String pet_colour,
""");
    });

    test("3", () {
      exp_copyWithParams([
        Property("name", "String", hasSub: false),
        Property("pet", "Pet", hasSub: true, properties: [
          Property("type", "String", hasSub: false),
          Property("colour", "String", hasSub: false),
          Property("collar", "Collar", hasSub: true, properties: [
            Property("id", "int", hasSub: false),
            Property("size", "String", hasSub: false),
          ]),
        ]),
      ], """String name,
Pet pet,
String pet_type,
String pet_colour,
Collar pet_collar,
int pet_collar_id,
String pet_collar_size,
""");
    });
  });
}
