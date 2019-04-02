import 'package:collection/collection.dart';
import 'package:constructor_inherit_generator/src/ElementForConstructorInherit.dart';
import 'package:constructor_inherit_generator/src/createFactory.dart';
import "package:test/test.dart";

void main() {
  Function deepEq = const DeepCollectionEquality().equals;

  var example1 = ElementSuperType(
      ElementSuperType(
        null,
        [ElementAccessor("fullWord", "String")],
      ),
      []);

  var example2 = ElementSuperType(
      ElementSuperType(
        ElementSuperType(
          null,
          [ElementAccessor("fullWord", "String")],
        ),
        [],
      ),
      []);

  var example3 = ElementSuperType(
    ElementSuperType(
      ElementSuperType(
        null,
        [ElementAccessor("fullWord", "String")],
      ),
      [],
    ),
    [
      ElementAccessor("answer", "String"),
      ElementAccessor("infoMessages", "List<String>"),
    ],
  );

  var exampleDuplicates = ElementSuperType(
    ElementSuperType(
      ElementSuperType(
        null,
        [ElementAccessor("fullWord", "String")],
      ),
      [ElementAccessor("fullWord", "String")],
    ),
    [
      ElementAccessor("answer", "String"),
      ElementAccessor("infoMessages", "List<String>"),
    ],
  );

  //get className
  //

  group("distinctFields", () {
    void exp_distinctFields(
        ElementSuperType element, Map<String, String> expected) {
      var result = distinctFields(element);
      expect(deepEq(result, expected), true);
    }

    test("1", () => exp_distinctFields(example1, {"fullWord": "String"}));

    test("2", () => exp_distinctFields(example2, {"fullWord": "String"}));

    test(
        "3",
        () => exp_distinctFields(example3, {
              "fullWord": "String",
              "answer": "String",
              "infoMessages": "List<String>"
            }));

    test(
        "4",
        () => exp_distinctFields(exampleDuplicates, {
              "fullWord": "String",
              "answer": "String",
              "infoMessages": "List<String>"
            }));
  });

  group("parameterList", () {
    void exp_parameterList(Map<String, String> fields, String expected) {
      var result = parameterList(fields);
      expect(result, expected);
    }

    test("1",
        () => exp_parameterList({"fullWord": "String"}, "String fullWord"));

    test(
        "2",
        () => exp_parameterList({"fullWord": "String", "answer": "String"},
            "String fullWord, String answer"));

    test("3", () => exp_parameterList({}, ""));
  });

  group("createFactory", () {
    void exp_createFactory(ElementSuperType element, String expected) {
      var result = createFactory(element, "MyClass");
      expect(result, expected);
    }

    test("1", () => exp_createFactory(example1, """MyClass myClass(
String fullWord
){
var r = MyClass();

r.fullWord= fullWord;
return r;}"""));

    test("2", () => exp_createFactory(example2, """MyClass myClass(
String fullWord
){
var r = MyClass();

r.fullWord= fullWord;
return r;}"""));

    test("3", () => exp_createFactory(example3, """MyClass myClass(
String answer, List<String> infoMessages, String fullWord
){
var r = MyClass();

r.answer= answer;
r.infoMessages= infoMessages;
r.fullWord= fullWord;
return r;}"""));

    test("4", () => exp_createFactory(exampleDuplicates, """MyClass myClass(
String answer, List<String> infoMessages, String fullWord
){
var r = MyClass();

r.answer= answer;
r.infoMessages= infoMessages;
r.fullWord= fullWord;
return r;}"""));
  });
}
