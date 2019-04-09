import 'package:test/test.dart';
import 'package:value_t_generator/src/extractGetterBody.dart';

/*TODO:
+ put space at end of file
*/

void main() {
  var unit1 =
      """import 'package:value_t_annotation/value_t_annotation.dart'; part 'Marking_ValueT_params.g.dart'; abstract class Marking {List<String> get infoMessages => List<String>();} abstract class IsCorrect {} abstract class HasWord {String get word;} @ValueT() abstract class MarkingCorrectNoWord implements Marking, IsCorrect {} @ValueT() abstract class MarkingCorrect implements Marking, HasWord, IsCorrect {} @ValueT() abstract class MarkingIncorrect implements Marking, HasWord {String get answer => "default";} main() {var a = MarkingIncorrect("my answer", <String>["blah", "blah"], "fullWord"); var b = MarkingCorrect("fullWord"); print("a is MarkingState:" + (a is Marking).toString()); print("a is MarkingState:" + (a is MarkingIncorrect).toString()); typeInferenceChecks(a); typeInferenceChecks(b); var d = a.copyWith(answer: "blah"); print(d.answer);} void typeInferenceChecks(Marking marking) {if (marking is MarkingIncorrect) {print("answer:" + marking.answer);} if (marking is MarkingCorrect) {print("answer:no answer on this object");}}""";

  group("extractGetterBody", () {
    void exp_extractGetterBody(
        String getterName, String getterType, String unit, String expected) {
      var result = extractGetterBody(getterName, getterType, unit);
      expect(result, expected);
    }

    test(
        "1",
        () => exp_extractGetterBody(
            "answer", "String", unit1, """ "default" """));

    test("2 didn't find anything",
        () => exp_extractGetterBody("Idontexist", "String", unit1, null));
  });
}
