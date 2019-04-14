import 'package:meta/meta.dart';

// @ValueT(true)
abstract class $Person {
  String get name;
}

// @ValueT(true)
abstract class $Employee extends $Person {
  int get employeeId;
}

// @ValueT()
abstract class $WindowCleaner extends $Employee {
  String get windowMaxSize => "big";
  Pet get pet;
}

// @ValueT()
abstract class $Manager extends $Person {
  String get bosses;
}

//*****generated code********//
abstract class Person extends $Person {
  String get name;

  Person copyWith({int name});
}

//if is abstract
//  add abstract
//  ; instead of body of copyWith
//  no constructor
//  no final

abstract class Employee extends Person {
  String get name;
  String get employeeId;

  Employee copyWith({
    int name,
    String employeeId,
  });
}

class WindowCleaner extends Employee {
  final String name;
  final String employeeId;
  final String windowMaxSize;
  final Pet pet;

  WindowCleaner({
    @required this.name,
    @required this.employeeId,
    this.windowMaxSize = "big",
    this.pet,
  });

  WindowCleaner copyWith({
    int name,
    String employeeId,
    String windowMaxSize,
    Pet pet,
    String pet_type,
    String pet_name,
  }) =>
      WindowCleaner(
          name: name == null ? this.name : name,
          employeeId: employeeId == null ? this.employeeId : employeeId,
          windowMaxSize:
              windowMaxSize == null ? this.windowMaxSize : windowMaxSize,
          pet: pet == null
              ? this.pet
              : pet_type == null && pet_name == null
                  ? pet
                  : Pet(
                      type: pet_type == null ? this.pet.type : pet_type,
                      name: pet_name == null ? this.pet.name : pet_name));
}

main() {
  Person a = WindowCleaner(name: "Bob", employeeId: "window cleaner");
  a.copyWith(name: 7);

  if (a is Employee) {
    print('I am an employee');
    print(a.employeeId);
  }

  if (a is Person) {
    print('I am an employee');
    print(a.name);
  }
}

class Pet {
  final String type;
  final String name;
  const Pet({
    @required this.type,
    @required this.name,
  }) : assert(type != null);
  Pet copyWith({
    String type,
    String name,
  }) =>
      Pet(
        type: type == null ? this.type : type,
        name: name == null ? this.name : name,
      );
  String toString() => "|type:" + type.toString();
}
