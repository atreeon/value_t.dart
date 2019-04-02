import 'package:constructor_inherit/constructor_inherit.dart';

part 'Marking_CreeConst.g.dart';

abstract class MarkingState {
  String fullWord;
}

abstract class MarkingAnswered extends MarkingState {}

@CreeConst()
class MarkingUnanswered extends MarkingState {}

@CreeConst()
class MarkingCorrect extends MarkingAnswered {}

@CreeConst()
class MarkingIncorrect extends MarkingAnswered {
  String answer;
  List<String> infoMessages = List<String>();
}

main() {
  // var a = markingIncorrect("answer", <String>["blah", "blah"], "fullWord");
  // var b = markingCorrect("fullWord");
  // var c = markingUnanswered("fullWord");
}
