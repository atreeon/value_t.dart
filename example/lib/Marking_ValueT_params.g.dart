// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Marking_ValueT_params.dart';

// **************************************************************************
// ValueTGenerator
// **************************************************************************

class MarkingCorrectNoWord implements $MarkingCorrectNoWord {
  final List<String> infoMessages;
  MarkingCorrectNoWord({
    @required this.infoMessages,
  }) {
    assert(this.infoMessages != null);
  }
  MarkingCorrectNoWord copyWith({
    List<String> infoMessages,
  }) =>
      MarkingCorrectNoWord(
        infoMessages: infoMessages == null ? this.infoMessages : infoMessages,
      );
}

class MarkingCorrect implements $MarkingCorrect {
  final List<String> infoMessages;
  final String word;
  MarkingCorrect({
    @required this.infoMessages,
    @required this.word,
  }) {
    assert(this.infoMessages != null);
    assert(this.word != null);
  }
  MarkingCorrect copyWith({
    List<String> infoMessages,
    String word,
  }) =>
      MarkingCorrect(
        infoMessages: infoMessages == null ? this.infoMessages : infoMessages,
        word: word == null ? this.word : word,
      );
}

class MarkingIncorrect implements $MarkingIncorrect {
  final String answer;
  final List<String> infoMessages;
  final String word;
  MarkingIncorrect({
    this.answer = "",
    @required this.infoMessages,
    @required this.word,
  }) {
    assert(this.answer != null);
    assert(this.infoMessages != null);
    assert(this.word != null);
  }
  MarkingIncorrect copyWith({
    String answer,
    List<String> infoMessages,
    String word,
  }) =>
      MarkingIncorrect(
        answer: answer == null ? this.answer : answer,
        infoMessages: infoMessages == null ? this.infoMessages : infoMessages,
        word: word == null ? this.word : word,
      );
}
