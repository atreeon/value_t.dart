import 'package:constructor_inherit/constructor_inherit.dart';

part 'testClasses.g.dart';

abstract class MarkingState {
  String fullWord;
}

abstract class MarkingAnswered extends MarkingState {}

@creeConst()
class MarkingUnanswered extends MarkingState {}

@creeConst()
class MarkingCorrect extends MarkingAnswered {}

@creeConst()
class MarkingIncorrect extends MarkingAnswered {
  String answer;
  List<String> infoMessages = List<String>();
}

main() {
  var a = markingIncorrect("answer", <String>["blah", "blah"], "fullWord");
  var b = markingCorrect("fullWord");
  var c = markingUnanswered("fullWord");
}
