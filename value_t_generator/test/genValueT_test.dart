import "package:test/test.dart";
import 'package:value_t_generator/src/ElementForValueT.dart';
import 'package:value_t_generator/src/genValueT.dart';

import 'testData.dart';

void main() {
  group("constructor", () {
    void exp_constructor(
        String className, List<ElementAccessor> fields, String expected) {
      var result = constructor(className, fields);
      expect(result, expected);
    }

    test(
        "1",
        () => exp_constructor("MyClass", [ElementAccessor("word", "String")],
            "const MyClass({@required this.word,\n}):"));

    test(
        "2 with default value",
        () => exp_constructor("MyClass", [
              ElementAccessor("word", "String", defaultValue: """ "default" """)
            ], """const MyClass({this.word = "default",\n}):"""));
  });

  group("toString", () {
    void exp_toString(List<ElementAccessor> fields, String expected) {
      var result = toString(fields);
      expect(result, expected);
    }

    test(
        "1",
        () => exp_toString(
            [ElementAccessor("age", "int"), ElementAccessor("word", "String")],
            """@override String toString() =>  "|age:" + age.toString() + "|word:" + word.toString() ;"""));
  });

  group("genValueT", () {
    void exp_genValueT(
        bool isAbstract, ElementSuperType element, String expected) {
      var result = genValueT(isAbstract, element, "\$MyClass");
      expect(result, expected);
    }

    test("1", () => exp_genValueT(false, example1, //
        """class MyClass
 extends \$MyClass 
{

final String fullWord;
const MyClass({@required this.fullWord,
}):

assert(fullWord != null);
MyClass copyWith({
String fullWord,
})
 => MyClass(

fullWord: fullWord == null ? this.fullWord : fullWord,
);
@override String toString() =>  "|fullWord:" + fullWord.toString() ;
}
"""));

    test("2", () => exp_genValueT(false, exampleDuplicates, //
        """class MyClass
 extends \$MyClass 
{

final String answer;
final String fullWord;
final List<String> infoMessages;
const MyClass({@required this.answer,
@required this.fullWord,
@required this.infoMessages,
}):

assert(answer != null),
assert(fullWord != null),
assert(infoMessages != null);
MyClass copyWith({
String answer,
String fullWord,
List<String> infoMessages,
})
 => MyClass(

answer: answer == null ? this.answer : answer,
fullWord: fullWord == null ? this.fullWord : fullWord,
infoMessages: infoMessages == null ? this.infoMessages : infoMessages,
);
@override String toString() =>  "|answer:" + answer.toString() + "|fullWord:" + fullWord.toString() + "|infoMessages:" + infoMessages.toString() ;
}
"""));

    test("3", () => exp_genValueT(false, exampleNoFields, //
        """class MyClass
 extends \$MyClass 
{
const MyClass();
}
"""));

    test("4 exampleWithInterfacesSimple",
        () => exp_genValueT(false, exampleWithInterfacesSimple, //
            """class MyClass
 extends \$MyClass 
{

final int A;
final int B;
final int C;
final String fullWord;
final List<String> infoMessages;
const MyClass({@required this.A,
@required this.B,
@required this.C,
@required this.fullWord,
@required this.infoMessages,
}):

assert(A != null),
assert(B != null),
assert(C != null),
assert(fullWord != null),
assert(infoMessages != null);
MyClass copyWith({
int A,
int B,
int C,
String fullWord,
List<String> infoMessages,
})
 => MyClass(

A: A == null ? this.A : A,
B: B == null ? this.B : B,
C: C == null ? this.C : C,
fullWord: fullWord == null ? this.fullWord : fullWord,
infoMessages: infoMessages == null ? this.infoMessages : infoMessages,
);
@override String toString() =>  "|A:" + A.toString() + "|B:" + B.toString() + "|C:" + C.toString() + "|fullWord:" + fullWord.toString() + "|infoMessages:" + infoMessages.toString() ;
}
"""));

    test("5 abstract", () => exp_genValueT(true, exampleDuplicates, //
        """abstract class MyClass
 extends \$MyClass 
{

String get answer;
String get fullWord;
List<String> get infoMessages;
const MyClass();
MyClass copyWith({
String answer,
String fullWord,
List<String> infoMessages,
})
;
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
