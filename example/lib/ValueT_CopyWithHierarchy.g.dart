// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ValueT_CopyWithHierarchy.dart';

// **************************************************************************
// ValueTGenerator
// **************************************************************************

abstract class Person extends $Person {
  String get name;
  Person copyWith({
    String name,
  });
}

abstract class OftenWet extends $OftenWet {
  String get wetness;
  OftenWet copyWith({
    String wetness,
  });
}

abstract class Employee extends Person {
  int get employeeId;
  String get name;
  Employee copyWith({
    int employeeId,
    String name,
  });
}

class WindowCleaner extends Employee implements OftenWet {
  final int employeeId;
  final String name;
  final Pet pet;
  final String wetness;
  final String windowMaxSize;
  WindowCleaner({
    @required this.employeeId,
    @required this.name,
    @required this.pet,
    @required this.wetness,
    this.windowMaxSize = "big",
  }) {
    assert(this.employeeId != null);
    assert(this.name != null);
    assert(this.pet != null);
    assert(this.wetness != null);
    assert(this.windowMaxSize != null);
  }
  WindowCleaner copyWith({
    int employeeId,
    String name,
    Pet pet,
    String wetness,
    String windowMaxSize,
  }) =>
      WindowCleaner(
        employeeId: employeeId == null ? this.employeeId : employeeId,
        name: name == null ? this.name : name,
        pet: pet == null ? this.pet : pet,
        wetness: wetness == null ? this.wetness : wetness,
        windowMaxSize:
            windowMaxSize == null ? this.windowMaxSize : windowMaxSize,
      );
}

class Manager extends Person {
  final String bosses;
  final String name;
  Manager({
    @required this.bosses,
    @required this.name,
  }) {
    assert(this.bosses != null);
    assert(this.name != null);
  }
  Manager copyWith({
    String bosses,
    String name,
  }) =>
      Manager(
        bosses: bosses == null ? this.bosses : bosses,
        name: name == null ? this.name : name,
      );
}
