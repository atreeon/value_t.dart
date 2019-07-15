// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Pairs2.dart';

// **************************************************************************
// ValueTGenerator
// **************************************************************************

class PairsVM extends $PairsVM {
  final PairGroup source;
  const PairsVM({
    @required this.source,
  }) : assert(source != null);
  PairsVM copyWith({
    PairGroup source,
    Selected source_selected,
  }) =>
      PairsVM(
        source: source == null && source_selected == null
            ? this.source
            : this.source.copyWith(
                  selected: source_selected,
                ),
      );
  @override
  String toString() => "|source:" + source.toString();
}

class PairGroup extends $PairGroup {
  final Selected selected;
  const PairGroup({
    @required this.selected,
  }) : assert(selected != null);
  PairGroup copyWith({
    Selected selected,
  }) =>
      PairGroup(
        selected: selected == null ? this.selected : selected,
      );
  @override
  String toString() => "|selected:" + selected.toString();
}

class Selected extends $Selected {
  final String word;
  const Selected({
    @required this.word,
  }) : assert(word != null);
  Selected copyWith({
    String word,
  }) =>
      Selected(
        word: word == null ? this.word : word,
      );
  @override
  String toString() => "|word:" + word.toString();
}
