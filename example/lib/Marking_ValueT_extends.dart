import 'package:meta/meta.dart';
import 'package:value_t_annotation/value_t_annotation.dart';

part 'Marking_ValueT_extends.g.dart';

abstract class MarkingState {
  String get fullWord;
}

abstract class MarkingAnswered extends MarkingState {}

@ValueT()
abstract class $MarkingUnanswered extends MarkingState {}

@ValueT()
abstract class $MarkingCorrect extends MarkingAnswered {}

@ValueT()
abstract class $MarkingIncorrect extends MarkingAnswered {
  String get answer;
  List<String> get infoMessages;
}

main() {
  // valueT()
  var a = MarkingIncorrect(
      answer: "my answer",
      fullWord: "fullWord",
      infoMessages: <String>["blah", "blah"]);
  var b = MarkingCorrect(fullWord: "fullWord");
  var c = MarkingUnanswered(fullWord: "fullWord");

  print("a is MarkingState:" + (a is MarkingState).toString());
  print("a is MarkingState:" + (a is MarkingAnswered).toString());
  print("c is MarkingUnanswered:" + (c is MarkingUnanswered).toString());

  typeInferenceChecks(a);
  typeInferenceChecks(b);

  var d = a.copyWith(answer: "blah");
  print(d.answer);
}

void typeInferenceChecks(MarkingState markingState) {
  if (markingState is MarkingIncorrect) {
    print("answer:" + markingState.answer);
  }

  if (markingState is MarkingCorrect) {
    // print("answer:" + markingState.answer);
    print("answer:no answer on this object");
  }
}
