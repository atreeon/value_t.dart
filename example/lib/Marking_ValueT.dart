import 'package:value_t/ValueT.dart';

part 'Marking_ValueT.g.dart';

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
  var a = MarkingIncorrect("answer", "fullWord", <String>["blah", "blah"]);
  var b = MarkingCorrect("fullWord");
  var c = MarkingUnanswered("fullWord");

  var d = a.copyWith(answer: "blah");
}
