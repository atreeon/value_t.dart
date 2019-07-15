// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Pairs.dart';

// **************************************************************************
// ValueTGenerator
// **************************************************************************

class PairsVM extends $PairsVM {
  final PairGroup foreign;
  final LastMarking lastMarking;
  final LastSelection lastSelection;
  final Marking marking;
  final PairGroup source;
  const PairsVM({
    @required this.foreign,
    this.lastMarking = LastMarking.none,
    this.lastSelection = LastSelection.notSelected,
    this.marking = const MarkingUnanswered(),
    @required this.source,
  })  : assert(foreign != null),
        assert(lastMarking != null),
        assert(lastSelection != null),
        assert(marking != null),
        assert(source != null);
  PairsVM copyWith({
    PairGroup source,
    PairGroup foreign,
    LastMarking lastMarking,
    LastSelection lastSelection,
    Marking marking,
    List<dynamic> source_pairItems,
    Selected source_selected,
    List<dynamic> foreign_pairItems,
    Selected foreign_selected,
  }) =>
      PairsVM(
        source: source == null &&
                source_pairItems == null &&
                source_selected == null
            ? this.source
            : this.source.copyWith(
                  pairItems: source_pairItems,
                  selected: source_selected,
                ),
        foreign: foreign == null &&
                foreign_pairItems == null &&
                foreign_selected == null
            ? this.foreign
            : this.foreign.copyWith(
                  pairItems: foreign_pairItems,
                  selected: foreign_selected,
                ),
        lastMarking: lastMarking == null ? this.lastMarking : lastMarking,
        lastSelection:
            lastSelection == null ? this.lastSelection : lastSelection,
        marking: marking == null ? this.marking : marking,
      );
  @override
  String toString() =>
      "|foreign:" +
      foreign.toString() +
      "|lastMarking:" +
      lastMarking.toString() +
      "|lastSelection:" +
      lastSelection.toString() +
      "|marking:" +
      marking.toString() +
      "|source:" +
      source.toString();
}

class PairGroup extends $PairGroup {
  final List<dynamic> pairItems;
  final Selected selected;
  const PairGroup({
    @required this.pairItems,
    this.selected = const SelectedNone(),
  })  : assert(pairItems != null),
        assert(selected != null);
  PairGroup copyWith({
    List<dynamic> pairItems,
    Selected selected,
  }) =>
      PairGroup(
        pairItems: pairItems == null ? this.pairItems : pairItems,
        selected: selected == null ? this.selected : selected,
      );
  @override
  String toString() =>
      "|pairItems:" + pairItems.toString() + "|selected:" + selected.toString();
}

abstract class Selected extends $Selected {
  const Selected();
}

class SelectedNone extends $SelectedNone implements Selected {
  const SelectedNone();
}

class SelectedId extends $SelectedId implements Selected {
  final int id;
  const SelectedId({
    @required this.id,
  }) : assert(id != null);
  SelectedId copyWith({
    int id,
  }) =>
      SelectedId(
        id: id == null ? this.id : id,
      );
  @override
  String toString() => "|id:" + id.toString();
}

abstract class Marking extends $Marking {
  const Marking();
}

abstract class MarkingIsCorrect extends $MarkingIsCorrect {
  const MarkingIsCorrect();
}

abstract class MarkingHasWord extends $MarkingHasWord {
  ForeignWord get word;
  const MarkingHasWord();
  MarkingHasWord copyWith({
    ForeignWord word,
  });
}

class MarkingUnanswered extends $MarkingUnanswered implements Marking {
  const MarkingUnanswered();
}

class MarkingCorrectNoWord extends $MarkingCorrectNoWord
    implements Marking, MarkingIsCorrect {
  const MarkingCorrectNoWord();
}

class MarkingCorrect extends $MarkingCorrect
    implements Marking, MarkingHasWord, MarkingIsCorrect {
  final ForeignWord word;
  const MarkingCorrect({
    @required this.word,
  }) : assert(word != null);
  MarkingCorrect copyWith({
    ForeignWord word,
  }) =>
      MarkingCorrect(
        word: word == null ? this.word : word,
      );
  @override
  String toString() => "|word:" + word.toString();
}

class MarkingIncorrect extends $MarkingIncorrect
    implements Marking, MarkingHasWord {
  final String answer;
  final List<String> infoMessages;
  final ForeignWord word;
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
    ForeignWord word,
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

class ForeignWord extends $ForeignWord {
  final String text;
  const ForeignWord({
    @required this.text,
  }) : assert(text != null);
  ForeignWord copyWith({
    String text,
  }) =>
      ForeignWord(
        text: text == null ? this.text : text,
      );
  @override
  String toString() => "|text:" + text.toString();
}
