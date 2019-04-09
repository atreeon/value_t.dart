// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Marking_ValueT_implements.dart';

// **************************************************************************
// ValueTGenerator
// **************************************************************************

class MarkingCorrectNoWord implements $MarkingCorrectNoWord {}

class MarkingCorrect implements $MarkingCorrect {
  final String word;
  MarkingCorrect({
    @required this.word,
  }) {
    assert(this.word != null);
  }
  MarkingCorrect copyWith({
    String word,
  }) =>
      MarkingCorrect(
        word: word == null ? this.word : word,
      );
}

class MarkingIncorrect implements $MarkingIncorrect {
  final String answer;
  final List<String> infoMessages;
  final String word;
  MarkingIncorrect({
    @required this.answer,
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
