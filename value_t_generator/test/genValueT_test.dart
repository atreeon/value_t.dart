import 'package:collection/collection.dart';
import 'package:value_t_generator/src/ElementForValueT.dart';
import 'package:value_t_generator/src/genValueT.dart';
import "package:test/test.dart";

void main() {
  Function deepEq = const DeepCollectionEquality.unordered().equals;

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

  var exampleNoFields = ElementSuperType(
    ElementSuperType(
      ElementSuperType(
        null,
        [],
      ),
      [],
    ),
    [],
  );

  //get className
  //

  group("distinctFields", () {
    void exp_distinctFields(
        ElementSuperType element, List<ElementAccessor> expected) {
      var result = distinctFields(element).toList();
      expect(deepEq(result, expected), true);
    }

    test(
        "1",
        () => exp_distinctFields(
            example1, [ElementAccessor("fullWord", "String")]));

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
        "4",
        () => exp_distinctFields(exampleDuplicates, [
              ElementAccessor("fullWord", "String"),
              ElementAccessor("answer", "String"),
              ElementAccessor("infoMessages", "List<String>"),
            ]));
  });

//   group("parameterList", () {
//     void exp_parameterList(Map<String, String> fields, String expected) {
//       var result = parameterList(fields);
//       expect(result, expected);
//     }

//     test("1",
//         () => exp_parameterList({"fullWord": "String"}, "String fullWord"));

//     test(
//         "2",
//         () => exp_parameterList({"fullWord": "String", "answer": "String"},
//             "String fullWord, String answer"));

//     test("3", () => exp_parameterList({}, ""));
//   });

  group("genValueT", () {
    void exp_genValueT(ElementSuperType element, String expected) {
      var result = genValueT(element, "\$MyClass");
      expect(result, expected);
    }

    test("1", () => exp_genValueT(example1, //
        """class MyClass implements \$MyClass {

final String fullWord;
MyClass(this.fullWord,
){

assert(this.fullWord != null);}
MyClass copyWith({
String fullWord,
}) =>
MyClass(

fullWord == null ? this.fullWord : fullWord,
);
}
"""));

    test("2", () => exp_genValueT(exampleDuplicates, //
        """class MyClass implements \$MyClass {

final String answer;
final String fullWord;
final List<String> infoMessages;
MyClass(this.answer,
this.fullWord,
this.infoMessages,
){

assert(this.answer != null);
assert(this.fullWord != null);
assert(this.infoMessages != null);}
MyClass copyWith({
String answer,
String fullWord,
List<String> infoMessages,
}) =>
MyClass(

answer == null ? this.answer : answer,
fullWord == null ? this.fullWord : fullWord,
infoMessages == null ? this.infoMessages : infoMessages,
);
}
"""));

    test("3", () => exp_genValueT(exampleNoFields, //
        """class MyClass implements \$MyClass {
}
"""));
  });
}

//     test("2", () => exp_genValueT(example2, """MyClass myClass(
// String fullWord
// ){
// var r = MyClass();

// r.fullWord= fullWord;
// return r;}"""));

//     test("3", () => exp_genValueT(example3, """MyClass myClass(
// String answer, List<String> infoMessages, String fullWord
// ){
// var r = MyClass();

// r.answer= answer;
// r.infoMessages= infoMessages;
// r.fullWord= fullWord;
// return r;}"""));

//     test("4", () => exp_genValueT(exampleDuplicates, """MyClass myClass(
// String answer, List<String> infoMessages, String fullWord
// ){
// var r = MyClass();

// r.answer= answer;
// r.infoMessages= infoMessages;
// r.fullWord= fullWord;
// return r;}"""));
//   });
// }
