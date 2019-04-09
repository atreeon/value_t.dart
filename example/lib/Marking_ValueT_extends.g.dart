// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Marking_ValueT_extends.dart';

// **************************************************************************
// ValueTGenerator
// **************************************************************************

class MarkingUnanswered extends arkingState {
  final String fullWord;
  MarkingUnanswered({
    @required this.fullWord,
  }) {
    assert(this.fullWord != null);
  }
  MarkingUnanswered copyWith({
    String fullWord,
  }) =>
      MarkingUnanswered(
        fullWord: fullWord == null ? this.fullWord : fullWord,
      );
}

class MarkingCorrect extends arkingAnswered {
  final String fullWord;
  MarkingCorrect({
    @required this.fullWord,
  }) {
    assert(this.fullWord != null);
  }
  MarkingCorrect copyWith({
    String fullWord,
  }) =>
      MarkingCorrect(
        fullWord: fullWord == null ? this.fullWord : fullWord,
      );
}

class MarkingIncorrect extends arkingAnswered {
  final String answer;
  final String fullWord;
  final List<String> infoMessages;
  MarkingIncorrect({
    @required this.answer,
    @required this.fullWord,
    @required this.infoMessages,
  }) {
    assert(this.answer != null);
    assert(this.fullWord != null);
    assert(this.infoMessages != null);
  }
  MarkingIncorrect copyWith({
    String answer,
    String fullWord,
    List<String> infoMessages,
  }) =>
      MarkingIncorrect(
        answer: answer == null ? this.answer : answer,
        fullWord: fullWord == null ? this.fullWord : fullWord,
        infoMessages: infoMessages == null ? this.infoMessages : infoMessages,
      );
}
