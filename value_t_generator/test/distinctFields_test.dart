import 'package:collection/collection.dart';
import 'package:test/test.dart';
import 'package:value_t_generator/src/ElementForValueT.dart';
import 'package:value_t_generator/src/distinctFields.dart';

import 'testData.dart';

void main() {
  Function deepEq = const DeepCollectionEquality.unordered().equals;

  group("distinctFields", () {
    void exp_distinctFields(
        ElementSuperType element, List<ElementAccessor> expected) {
      var result = distinctFields(element).toList();
      expect(deepEq(result, expected), true);
    }

    test(
        "1",
        () => exp_distinctFields(example1, [
              ElementAccessor(
                "fullWord",
                "String",
              )
            ]));

    test(
        "2",
        () => exp_distinctFields(
            example2, [ElementAccessor("fullWord", "String")]));

    test(
        "3",
        () => exp_distinctFields(example3, [
              ElementAccessor("fullWord", "String"),
              ElementAccessor("answer", "String"),
              ElementAccessor("infoMessages", "List<String>"),
            ]));

    test(
        "4 exampleDuplicates",
        () => exp_distinctFields(exampleDuplicates, [
              ElementAccessor("fullWord", "String"),
              ElementAccessor("answer", "String"),
              ElementAccessor("infoMessages", "List<String>"),
            ]));

    test(
        "5 WithInterfaces",
        () => exp_distinctFields(exampleWithInterfacesSimple, [
              ElementAccessor("A", "int"),
              ElementAccessor("B", "int"),
              ElementAccessor("C", "int"),
              ElementAccessor(
                "fullWord",
                "String",
              ),
              ElementAccessor("infoMessages", "List<String>"),
            ]));
  });
}
