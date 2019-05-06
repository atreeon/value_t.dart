// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Marking_ValueT_extends.dart';

// **************************************************************************
// ValueTGenerator
// **************************************************************************

//__fullWord:false,
abstract class MarkingState extends $MarkingState {
  String get fullWord;
  const MarkingState();
  MarkingState copyWith({
    String fullWord,
  });
}

//__
abstract class MarkingAnswered extends MarkingState {
  String get fullWord;
  const MarkingAnswered();
  MarkingAnswered copyWith({
    String fullWord,
  });
}

//__
class MarkingUnanswered extends MarkingState {
  final String fullWord;
  const MarkingUnanswered({
    @required this.fullWord,
  }) : assert(fullWord != null);
  MarkingUnanswered copyWith({
    String fullWord,
  }) =>
      MarkingUnanswered(
        fullWord: fullWord == null ? this.fullWord : fullWord,
      );
  @override
  String toString() => "|fullWord:" + fullWord.toString();
}

//__
class MarkingCorrect extends MarkingAnswered {
  final String fullWord;
  const MarkingCorrect({
    @required this.fullWord,
  }) : assert(fullWord != null);
  MarkingCorrect copyWith({
    String fullWord,
  }) =>
      MarkingCorrect(
        fullWord: fullWord == null ? this.fullWord : fullWord,
      );
  @override
  String toString() => "|fullWord:" + fullWord.toString();
}

//__answer:false,infoMessages:false,
class MarkingIncorrect extends MarkingAnswered {
  final String answer;
  final String fullWord;
  final List<String> infoMessages;
  const MarkingIncorrect({
    @required this.answer,
    @required this.fullWord,
    @required this.infoMessages,
  })  : assert(answer != null),
        assert(fullWord != null),
        assert(infoMessages != null);
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
  @override
  String toString() =>
      "|answer:" +
      answer.toString() +
      "|fullWord:" +
      fullWord.toString() +
      "|infoMessages:" +
      infoMessages.toString();
}
