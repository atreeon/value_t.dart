// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ValueT_ConstDefault.dart';

// **************************************************************************
// ValueTGenerator
// **************************************************************************

//__name:false,
abstract class Person extends $Person {
  String get name;
  const Person();
  Person copyWith({
    String name,
  });
}

//__wetness:false,
abstract class OftenWet extends $OftenWet {
  String get wetness;
  const OftenWet();
  OftenWet copyWith({
    String wetness,
  });
}

//__employeeId:false,
abstract class Employee extends Person {
  int get employeeId;
  String get name;
  const Employee();
  Employee copyWith({
    int employeeId,
    String name,
  });
}

//__windowMaxSize:false,pet:false,
class WindowCleaner extends Employee implements OftenWet {
  final int employeeId;
  final String name;
  final Pet pet;
  final String wetness;
  final String windowMaxSize;
  const WindowCleaner({
    @required this.employeeId,
    @required this.name,
    this.pet = const Pet(type: "cat"),
    @required this.wetness,
    this.windowMaxSize = "big",
  })  : assert(employeeId != null),
        assert(name != null),
        assert(pet != null),
        assert(wetness != null),
        assert(windowMaxSize != null);
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
  @override
  String toString() =>
      "|employeeId:" +
      employeeId.toString() +
      "|name:" +
      name.toString() +
      "|pet:" +
      pet.toString() +
      "|wetness:" +
      wetness.toString() +
      "|windowMaxSize:" +
      windowMaxSize.toString();
}

//__bosses:false,
class Manager extends Person {
  final String bosses;
  final String name;
  const Manager({
    @required this.bosses,
    @required this.name,
  })  : assert(bosses != null),
        assert(name != null);
  Manager copyWith({
    String bosses,
    String name,
  }) =>
      Manager(
        bosses: bosses == null ? this.bosses : bosses,
        name: name == null ? this.name : name,
      );
  @override
  String toString() =>
      "|bosses:" + bosses.toString() + "|name:" + name.toString();
}
