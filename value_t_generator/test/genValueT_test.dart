import "package:test/test.dart";
import 'package:value_t_generator/src/ElementForValueT.dart';
import 'package:value_t_generator/src/genValueT.dart';

import 'testData.dart';

void main() {
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

    test("4 exampleWithInterfacesSimple",
        () => exp_genValueT(exampleWithInterfacesSimple, //
            """class MyClass implements \$MyClass {

final int A;
final int B;
final int C;
final String fullWord;
final List<String> infoMessages;
MyClass(this.A,
this.B,
this.C,
this.fullWord,
this.infoMessages,
){

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
}) =>
MyClass(

A == null ? this.A : A,
B == null ? this.B : B,
C == null ? this.C : C,
fullWord == null ? this.fullWord : fullWord,
infoMessages == null ? this.infoMessages : infoMessages,
);
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
