import 'package:meta/meta.dart';
import 'package:value_t_annotation/value_t_annotation.dart';

part 'ValueT_covariance.g.dart';

@ValueT()
abstract class $Pet<T> {
  T get name;
  const $Pet();
}

@ValueT()
abstract class $Dog<T> implements $Pet<T> {
  const $Dog();
}

main() {
  Pet<String> pet = Dog<String>(name: "bob");
  Pet<int> pet2 = Dog<int>(name: 1235);
  List<Pet> pets = List<Dog>();
}
