import 'package:meta/meta.dart';
import 'package:value_t_annotation/value_t_annotation.dart';

part 'Marking_ValueT_params.g.dart';

List<String> blah() => List<String>();

@ValueT(true)
abstract class $Marking {
  List<String> get infoMessages;
  const $Marking();
}

@ValueT(true)
abstract class $IsCorrect {
  const $IsCorrect();
}

@ValueT(true)
abstract class $HasWord {
  String get word;
  const $HasWord();
}

@ValueT()
abstract class $MarkingCorrectNoWord implements $Marking, $IsCorrect {
  const $MarkingCorrectNoWord();
}

@ValueT()
abstract class $MarkingCorrect implements $Marking, $HasWord, $IsCorrect {
  const $MarkingCorrect();
}

@ValueT()
abstract class $MarkingIncorrect implements $Marking, $HasWord {
  String get answer => "";
  const $MarkingIncorrect();
}

main() {
  var a = MarkingIncorrect(
      answer: "my answer",
      infoMessages: <String>["blah", "blah"],
      word: "fullWord");
  var b = MarkingCorrect(word: "fullWord", infoMessages: []);

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
