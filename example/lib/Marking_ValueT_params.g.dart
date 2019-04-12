// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Marking_ValueT_params.dart';

// **************************************************************************
// ValueTGenerator
// **************************************************************************

abstract class Marking extends $Marking {
  List<String> get infoMessages;
  const Marking();
  Marking copyWith({
    List<String> infoMessages,
  });
}

abstract class IsCorrect extends $IsCorrect {
  const IsCorrect();
}

abstract class HasWord extends $HasWord {
  String get word;
  const HasWord();
  HasWord copyWith({
    String word,
  });
}

class MarkingCorrectNoWord extends $MarkingCorrectNoWord
    implements Marking, IsCorrect {
  final List<String> infoMessages;
  const MarkingCorrectNoWord({
    @required this.infoMessages,
  }) : assert(infoMessages != null);
  MarkingCorrectNoWord copyWith({
    List<String> infoMessages,
  }) =>
      MarkingCorrectNoWord(
        infoMessages: infoMessages == null ? this.infoMessages : infoMessages,
      );
  String toString() => "|infoMessages:" + infoMessages.toString();
}

class MarkingCorrect extends $MarkingCorrect
    implements Marking, HasWord, IsCorrect {
  final List<String> infoMessages;
  final String word;
  const MarkingCorrect({
    @required this.infoMessages,
    @required this.word,
  })  : assert(infoMessages != null),
        assert(word != null);
  MarkingCorrect copyWith({
    List<String> infoMessages,
    String word,
  }) =>
      MarkingCorrect(
        infoMessages: infoMessages == null ? this.infoMessages : infoMessages,
        word: word == null ? this.word : word,
      );
  String toString() =>
      "|infoMessages:" + infoMessages.toString() + "|word:" + word.toString();
}

class MarkingIncorrect extends $MarkingIncorrect implements Marking, HasWord {
  final String answer;
  final List<String> infoMessages;
  final String word;
  const MarkingIncorrect({
    this.answer = "",
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
  String toString() =>
      "|answer:" +
      answer.toString() +
      "|infoMessages:" +
      infoMessages.toString() +
      "|word:" +
      word.toString();
}
