
abstract class $Pet<T> {
  T get name;
  const $Pet();
}

class Pet<T> extends $Pet<T> {
  final T name;
  Pet(this.name);
}

class $Dog<T> {
  const $Dog();
}

class Dog<T> extends $Dog<T> implements Pet<T> {
  final T name;
  Dog(this.name);
}

main() {
  Pet<String> pet = Dog<String>("blah");
  List<Pet> pets = List<Dog>();
}


// //OLD
// abstract class $Pet2<T> {
//   T get name;
//   const $Pet2();
// }

// class Pet2<T> extends $Pet2 {
//   final T name;
//   Pet2(this.name);
// }

// class $Dog2<T> {
//   const $Dog2();
// }

// class Dog2<T> extends $Dog2 implements Pet2 {
//   final T name;
//   Dog2(this.name);
// }

// main2() {
//   Pet2<String> pet = Dog2<String>("blah");
//   List<Pet2> pets = List<Dog2>();
// }
