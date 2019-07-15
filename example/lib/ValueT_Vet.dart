import 'package:meta/meta.dart';
import 'package:value_t_annotation/value_t_annotation.dart';

part 'ValueT_Vet.g.dart';

///We are on object equality
///The toString function should go down and print the toString of each value in list

@ValueT()
abstract class $Vet {
  String get name;
  List<String> get pets;

  const $Vet();
}

main() {
  var a = Vet(name: "bob", pets: ["sandy", "zen"]);
  var b = Vet(name: "bob", pets: ["sandy", "zen"]);
  print(a == b); //false
  print(a.toString() == b.toString());
}
