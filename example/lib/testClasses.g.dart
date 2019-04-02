// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testClasses.dart';

// **************************************************************************
// ConstructorInheritGenerator
// **************************************************************************

MarkingUnanswered markingUnanswered(String fullWord) {
  var r = MarkingUnanswered();

  r.fullWord = fullWord;
  return r;
}

MarkingCorrect markingCorrect(String fullWord) {
  var r = MarkingCorrect();

  r.fullWord = fullWord;
  return r;
}

MarkingIncorrect markingIncorrect(
    String answer, List<String> infoMessages, String fullWord) {
  var r = MarkingIncorrect();

  r.answer = answer;
  r.infoMessages = infoMessages;
  r.fullWord = fullWord;
  return r;
}
