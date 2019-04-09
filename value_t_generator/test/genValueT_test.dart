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
        () => exp_constructor(
            "MyClass",
            [ElementAccessor("word", "String", null)],
            "MyClass({@required this.word,\n}){"));

    test(
        "2 with default value",
        () => exp_constructor(
            "MyClass",
            [ElementAccessor("word", "String", """ "default" """)],
            """MyClass({this.word = "default",\n}){"""));
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
MyClass({@required this.fullWord,
}){

assert(this.fullWord != null);}
MyClass copyWith({
String fullWord,
})
 => MyClass(

fullWord: fullWord == null ? this.fullWord : fullWord,
);
}
"""));

    test("2", () => exp_genValueT(false, exampleDuplicates, //
        """class MyClass
 extends \$MyClass 
{

final String answer;
final String fullWord;
final List<String> infoMessages;
MyClass({@required this.answer,
@required this.fullWord,
@required this.infoMessages,
}){

assert(this.answer != null);
assert(this.fullWord != null);
assert(this.infoMessages != null);}
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
}
"""));

    test("3", () => exp_genValueT(false, exampleNoFields, //
        """class MyClass
 extends \$MyClass 
{
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
MyClass({@required this.A,
@required this.B,
@required this.C,
@required this.fullWord,
@required this.infoMessages,
}){

assert(this.A != null);
assert(this.B != null);
assert(this.C != null);
assert(this.fullWord != null);
assert(this.infoMessages != null);}
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
}
"""));

    test("5 abstract", () => exp_genValueT(true, exampleDuplicates, //
        """abstract class MyClass
 extends \$MyClass 
{

String get answer;
String get fullWord;
List<String> get infoMessages;
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
