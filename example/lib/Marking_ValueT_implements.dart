import 'package:value_t/ValueT.dart';

part 'Marking_ValueT_implements.g.dart';

abstract class Marking {}

abstract class IsCorrect {}

abstract class HasWord {
  String get word;
}

@ValueT()
abstract class $MarkingCorrectNoWord implements Marking, IsCorrect {}

@ValueT()
abstract class $MarkingCorrect implements Marking, HasWord, IsCorrect {}

@ValueT()
abstract class $MarkingIncorrect implements Marking, HasWord {
  String get answer;
  List<String> get infoMessages;
}

// main() {
//   // valueT()
//   var a = MarkingIncorrect("my answer", "fullWord", <String>["blah", "blah"]);
//   var b = MarkingCorrect("fullWord");
//   var c = MarkingUnanswered("fullWord");

//   print("a is MarkingState:" + (a is MarkingState).toString());
//   print("a is MarkingState:" + (a is MarkingAnswered).toString());

//   typeInferenceChecks(a);
//   typeInferenceChecks(b);

//   var d = a.copyWith(answer: "blah");
// }

// void typeInferenceChecks(MarkingState markingState) {
//   if (markingState is MarkingIncorrect) {
//     print("answer:" + markingState.answer);
//   }

//   if (markingState is MarkingCorrect) {
//     // print("answer:" + markingState.answer);
//     print("answer:no answer on this object");
//   }
// }
