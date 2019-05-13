// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Marking_ValueT_implements.dart';

// **************************************************************************
// ValueTGenerator
// **************************************************************************

class MarkingCorrectNoWord extends $MarkingCorrectNoWord
    implements Marking, IsCorrect {
  const MarkingCorrectNoWord();
}

class MarkingCorrect extends $MarkingCorrect
    implements Marking, HasWord, IsCorrect {
  final String word;
  const MarkingCorrect({
    @required this.word,
  }) : assert(word != null);
  MarkingCorrect copyWith({
    String word,
  }) =>
      MarkingCorrect(
        word: word == null ? this.word : word,
      );
  @override
  String toString() => "|word:" + word.toString();
}

class MarkingIncorrect extends $MarkingIncorrect implements Marking, HasWord {
  final String answer;
  final List<String> infoMessages;
  final String word;
  const MarkingIncorrect({
    @required this.answer,
    @required this.infoMessages,
    @required this.word,
  })  : assert(answer != null),
        assert(infoMessages != null),
        assert(word != null);
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
  @override
  String toString() =>
      "|answer:" +
      answer.toString() +
      "|infoMessages:" +
      infoMessages.toString() +
      "|word:" +
      word.toString();
}