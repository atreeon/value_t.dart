import 'package:test/test.dart';
import 'package:value_t_generator/src/ElementForValueT.dart';
import 'package:value_t_generator/src/genValueT.dart';

void main() {
  group("combineProperties", () {
    void exp_combineProperties(
        ElementSuperType element, List<Property> expected) {
      var result = combineProperties(element);
      expect(result.toString(), expected.toString());
    }

    test("1", () {
      exp_combineProperties(
          ElementSuperType(
            ElementSuperType(
              null,
              [ElementAccessor("fullWord", "String")],
              [
                Interface(
                  ElementSuperType(
                    null,
                    [
                      ElementAccessor("A", "int"),
                      ElementAccessor("B", "int"),
                    ],
                    [],
                    [],
                    null,
                  ),
                  [ElementAccessor("C", "int")],
                  [],
                  [
                    Property("A", "int"),
                    Property("B", "int"),
                    Property("C", "int"),
                  ],
                  null,
                )
              ],
              [],
              null,
            ),
            [
              ElementAccessor("infoMessages", "List<String>"),
            ],
            [],
            [
              Property("fullWord", "String"),
              Property("infoMessages", "List<String>"),
            ],
            null,
          ),
          [
            Property("fullWord", "String"),
            Property("infoMessages", "List<String>"),
            Property("A", "int"),
            Property("B", "int"),
            Property("C", "int"),
          ]);
    });
  });
}
