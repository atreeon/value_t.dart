import 'package:meta/meta.dart';

abstract class MarkingState {
  String get fullWord;
  String get category => "default";
}

abstract class MarkingAnswered extends MarkingState {}

class MarkingUnanswered extends MarkingState {
  final String fullWord;
  final String category;
  MarkingUnanswered(
      {@required this.fullWord, String this.category = "default"});

  MarkingUnanswered copyWith({
    String fullWord,
  }) =>
      MarkingUnanswered(
        fullWord: fullWord == null ? this.fullWord : fullWord,
        category: category == null ? this.category : category,
      );
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

main() {
  var a = MarkingUnanswered(fullWord: "blah", category: "sdf");
  var b = MarkingUnanswered(fullWord: "blah");
  var c = MarkingUnanswered(fullWord: "blah");
}
