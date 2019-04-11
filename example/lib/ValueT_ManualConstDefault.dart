import 'package:meta/meta.dart';

// @ValueT(true)
abstract class $OftenWet {
  String get wetness;
}

// @ValueT(true)
abstract class $Person {
  String get name;

  const $Person();
}

// @ValueT(true)
abstract class $Employee extends $Person {
  int get employeeId;
}

// @ValueT()
abstract class $WindowCleaner extends $Employee implements $OftenWet {
  String get windowMaxSize => "big";
}

// @ValueT()
abstract class $Manager extends $Person {
  String get bosses;
}

//*****generated code********//
abstract class Person extends $Person {
  String get name;

  const Person();

  Person copyWith({String name});
}

abstract class OftenWet extends $OftenWet {
  String get wetness;

  OftenWet copyWith({String wetness});
}

//if is abstract
//  add abstract
//  ; instead of body of copyWith
//  no constructor
//  no final

abstract class Employee extends Person {
  String get name;
  String get employeeId;

  const Employee();

  Employee copyWith({
    String name,
    String employeeId,
  });
}

class WindowCleaner extends Employee implements OftenWet {
  final String name;
  final String employeeId;
  final String windowMaxSize;
  final String wetness;

  const WindowCleaner({
    @required this.name,
    @required this.employeeId,
    this.windowMaxSize = "big",
    this.wetness,
  }) : assert(name != null), assert(employeeId !=null);

  WindowCleaner copyWith({
    String name,
    String employeeId,
    String windowMaxSize,
    String wetness,
  }) =>
      WindowCleaner(
        name: name == null ? this.name : name,
        employeeId: employeeId == null ? this.employeeId : employeeId,
        windowMaxSize:
            windowMaxSize == null ? this.windowMaxSize : windowMaxSize,
      );
}

main() {
  Person a = WindowCleaner(name: null, employeeId: "window cleaner");
  var c = a.copyWith(name: "Bob");

  //null check
  Person b = WindowCleaner(name: "Bob", employeeId: "window cleaner");

  if (c is Employee) {
    print('I am an employee');
    print(c.employeeId);
  }

  if (c is Person) {
    print('I am an employee');
    print(c.name);
  }
}
