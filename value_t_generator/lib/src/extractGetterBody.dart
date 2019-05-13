///getterName: age, getterType: String, unit: import 'package:value_t_annotation/value_t_annotation.dart'; part 'Marking_ValueT_params.g.dart'; abstract class Marking {List<String> get infoMessages => List<String>();} abstract class IsCorrect {} abstract class HasWord {String get word;} @ValueT() abstract class MarkingCorrectNoWord implements Marking, IsCorrect {} @ValueT() abstract class MarkingCorrect implements Marking, HasWord, IsCorrect {} @ValueT() abstract class MarkingIncorrect implements Marking, HasWord {String get answer => "default";} main() {var a = MarkingIncorrect("my answer", <String>["blah", "blah"], "fullWord"); var b = MarkingCorrect("fullWord"); print("a is MarkingState:" + (a is Marking).toString()); print("a is MarkingState:" + (a is MarkingIncorrect).toString()); typeInferenceChecks(a); typeInferenceChecks(b); var d = a.copyWith(answer: "blah"); print(d.answer);} void typeInferenceChecks(Marking marking) {if (marking is MarkingIncorrect) {print("answer:" + marking.answer);} if (marking is MarkingCorrect) {print("answer:no answer on this object");}}
///result: myDefaultDefaultAge
String extractGetterBody(String getterName, String getterType, String unit) {
  var startToken = "${getterType} get ${getterName} => ";
  var endToken = ";";

  if (unit.indexOf(startToken) == -1) return null;

  var start = unit.substring(unit.indexOf(startToken) + startToken.length);
  var body = start.substring(0, start.indexOf(endToken));

  return " ${body} ";
}
