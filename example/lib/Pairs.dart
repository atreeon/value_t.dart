import 'package:meta/meta.dart';
import 'package:value_t_annotation/value_t_annotation.dart';
import 'package:view_models/Marking.dart';
import 'package:view_models/PairItem.dart';

part 'Pairs.g.dart';

enum LastMarking { correct, allCorrect, incorrect, none }
enum LastSelection { selected, notSelected }

@ValueT(false, ["source", "foreign"])
abstract class $PairsVM {
  $PairGroup get source;
  $PairGroup get foreign;
  LastMarking get lastMarking => LastMarking.none;
  LastSelection get lastSelection => LastSelection.notSelected;
  $Marking get marking => const MarkingUnanswered();

  const $PairsVM();
}

@ValueT()
abstract class $PairGroup {
  List<$PairItem> get pairItems;
  $Selected get selected => const SelectedNone();

  const $PairGroup();
}

@ValueT(true)
abstract class $Selected {
  const $Selected();
}

@ValueT()
abstract class $SelectedNone implements $Selected {
  const $SelectedNone();
}

@ValueT()
abstract class $SelectedId implements $Selected {
  int get id;
  const $SelectedId();
}

@ValueT(true)
abstract class $Marking {
  const $Marking();
}

@ValueT(true)
abstract class $MarkingIsCorrect {
  const $MarkingIsCorrect();
}

@ValueT(true)
abstract class $MarkingHasWord {
  $ForeignWord get word;
  const $MarkingHasWord();
}

@ValueT()
abstract class $MarkingUnanswered implements $Marking {
  const $MarkingUnanswered();
}

@ValueT()
abstract class $MarkingCorrectNoWord implements $Marking, $MarkingIsCorrect {
  const $MarkingCorrectNoWord();
}

@ValueT()
abstract class $MarkingCorrect
    implements $Marking, $MarkingHasWord, $MarkingIsCorrect {
  const $MarkingCorrect();
}

@ValueT()
abstract class $MarkingIncorrect implements $Marking, $MarkingHasWord {
  String get answer;
  List<String> get infoMessages;
  const $MarkingIncorrect();
}

@ValueT()
abstract class $ForeignWord {
  String get text;
  const $ForeignWord();
}

