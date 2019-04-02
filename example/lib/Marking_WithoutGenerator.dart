abstract class MarkingState {
  String get fullWord;
}

abstract class MarkingAnswered extends MarkingState {}

class MarkingUnanswered extends MarkingState {
  final String fullWord;
  MarkingUnanswered(this.fullWord);
}

class MarkingCorrect extends MarkingAnswered {
  final String fullWord;
  MarkingCorrect(this.fullWord);
}

class MarkingIncorrect extends MarkingAnswered {
  final String fullWord;
  final String answer;
  final List<String> infoMessages;

  MarkingIncorrect(this.fullWord, this.answer, this.infoMessages);
}
