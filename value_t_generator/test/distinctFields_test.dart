import 'package:collection/collection.dart';
import 'package:test/test.dart';
import 'package:value_t_generator/src/ElementForValueT.dart';
import 'package:value_t_generator/src/genValueT/distinctFields.dart';
import 'package:value_t_generator/src/genValueT/genValueT.dart';

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

    test(
        "6",
        () => exp_distinctFields(exampleWithDollar, [
              ElementAccessor("pet", "Pet"),
              ElementAccessor("answer", "String"),
              ElementAccessor("infoMessages", "List<String>"),
            ]));
  });

  group("removeDollarFromType", () {
    void exp_removeDollarFromType(String type, String expected) {
      var result = removeDollarFromString(type);
      expect(result, expected);
    }

    test("1", () => exp_removeDollarFromType("\$Foreign", "Foreign"));

    test("2 in generic type",
        () => exp_removeDollarFromType("List<\$Foreign>", "List<Foreign>"));

    test(
        "3 in multiple levels down type",
        () => exp_removeDollarFromType(
            "List<List<List<\$Foreign>>>", "List<List<List<Foreign>>>"));
  });
}
