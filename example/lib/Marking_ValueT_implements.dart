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

main() {
  // valueT()
  var a = MarkingIncorrect("my answer", <String>["blah", "blah"], "fullWord");
  var b = MarkingCorrect("fullWord");

  print("a is MarkingState:" + (a is Marking).toString());
  print("a is MarkingState:" + (a is MarkingIncorrect).toString());

  typeInferenceChecks(a);
  typeInferenceChecks(b);

  var d = a.copyWith(answer: "blah");
  print(d.answer);
}

void typeInferenceChecks(Marking marking) {
  if (marking is MarkingIncorrect) {
    print("answer:" + marking.answer);
  }

  if (marking is MarkingCorrect) {
    // print("answer:" + markingState.answer);
    print("answer:no answer on this object");
  }
}
