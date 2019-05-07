// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Marking_ValueT_extends.dart';

// **************************************************************************
// ValueTGenerator
// **************************************************************************

//__fullWord:false,
abstract class MarkingState extends $MarkingState {
  String get fullWord;
  const MarkingState();
//MarkingState copyWith({
/*String fullWord,
*/
}

//__
abstract class MarkingAnswered extends MarkingState {
  String get fullWord;
  const MarkingAnswered();
//MarkingAnswered copyWith({
/*String fullWord,
*/
}

//__
class MarkingUnanswered extends MarkingState {
  final String fullWord;
  const MarkingUnanswered({
    @required this.fullWord,
  }) : assert(fullWord != null);
//MarkingUnanswered copyWith({
/*String fullWord,
*/
/* => MarkingUnanswered(*/
//);
}

//__
class MarkingCorrect extends MarkingAnswered {
  final String fullWord;
  const MarkingCorrect({
    @required this.fullWord,
  }) : assert(fullWord != null);
//MarkingCorrect copyWith({
/*String fullWord,
*/
/* => MarkingCorrect(*/
//);
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
//MarkingIncorrect copyWith({
/*String answer,
String fullWord,
List<String> infoMessages,
*/
/* => MarkingIncorrect(*/
//);
}
