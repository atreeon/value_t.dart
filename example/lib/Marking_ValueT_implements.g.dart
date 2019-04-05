// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Marking_ValueT_implements.dart';

// **************************************************************************
// ValueTGenerator
// **************************************************************************

class MarkingCorrectNoWord implements $MarkingCorrectNoWord {}

class MarkingCorrect implements $MarkingCorrect {
  final String word;
  MarkingCorrect(
    this.word,
  ) {
    assert(this.word != null);
  }
  MarkingCorrect copyWith({
    String word,
  }) =>
      MarkingCorrect(
        word == null ? this.word : word,
      );
}

class MarkingIncorrect implements $MarkingIncorrect {
  final String answer;
  final List<String> infoMessages;
  final String word;
  MarkingIncorrect(
    this.answer,
    this.infoMessages,
    this.word,
  ) {
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
        answer == null ? this.answer : answer,
        infoMessages == null ? this.infoMessages : infoMessages,
        word == null ? this.word : word,
      );
}
