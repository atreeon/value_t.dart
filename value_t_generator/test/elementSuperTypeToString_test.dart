import 'package:test/test.dart';
import 'package:value_t_generator/src/ElementForValueT.dart';
import 'package:value_t_generator/src/elementSuperTypeToString.dart';

import 'testData.dart';

void main() {
  group("elementSuperTypeToString", () {
    void exp_elementSuperTypeToString(
        ElementSuperType element, String expected) {
      var result = elementSuperTypeToString(element, 0, StringBuffer());
      expect(result.toString(), expected);
    }

    test("1", () => exp_elementSuperTypeToString(example1, //
        """// 1fullWord|String
"""));

//     test("2", () => exp_elementSuperTypeToString(exampleWithInterfacesSimple, //
//         """//0infoMessages|List<String>
// // 1fullWord|String
// """));
  });
}
