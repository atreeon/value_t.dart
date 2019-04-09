import 'package:meta/meta.dart';
import 'package:value_t_annotation/value_t_annotation.dart';

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

  WindowCleaner({
    @required this.name,
    @required this.employeeId,
    this.windowMaxSize = "big",
  });

  WindowCleaner copyWith({
    int name,
    String employeeId,
    String windowMaxSize,
  }) =>
      WindowCleaner(
        name: name == null ? this.name : name,
        employeeId: employeeId == null ? this.employeeId : employeeId,
        windowMaxSize:
            windowMaxSize == null ? this.windowMaxSize : windowMaxSize,
      );
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
