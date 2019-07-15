import 'package:meta/meta.dart';
import 'package:value_t_annotation/value_t_annotation.dart';

part 'Pairs2.g.dart';

@ValueT(false, ["source"])
abstract class $PairsVM {
  $PairGroup get source;

  const $PairsVM();
}

@ValueT()
abstract class $PairGroup {
  $Selected get selected;
  const $PairGroup();
}

@ValueT()
abstract class $Selected {
  String get word;
  const $Selected();
}

//TODO: Major error
/*
      PairsVM(
        source: 
          source == null && source_selected == null
            ? this.source
            : source != null 
              ? source
              : this.source.copyWith(
                  selected: source_selected,
                ),
      );
*/

main() {
  var vm = PairsVM(
    source: PairGroup(selected: Selected(word: "blah")),
  );

  print(vm.toString());

  var changed = vm.copyWith(
      source: vm.source.copyWith(selected: Selected(word: "changed blah")));

  print(changed.toString());
}
