import 'package:meta_types/meta_types.dart';

// part 'Marking_MetaTypes.g.dart';

abstract class MarkingState {
  String get fullWord;
}

abstract class MarkingAnswered extends MarkingState {}

// @DataClass()
abstract class MarkingUnanswered extends MarkingState {
  String get fullWord;
}

// @DataClass()
abstract class MarkingCorrect extends MarkingAnswered {
  String get fullWord;
}

// @DataClass()
abstract class MarkingIncorrect extends MarkingAnswered {
  String get fullWord;
  String get answer;
  List<String> get infoMessages;
}
