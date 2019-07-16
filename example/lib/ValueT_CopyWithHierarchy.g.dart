// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ValueT_CopyWithHierarchy.dart';

// **************************************************************************
// ValueTGenerator
// **************************************************************************

//4 rules: abstract all classes | implements not extends | empty constant constructor | Generated classes as generics do not work
abstract class Person extends $Person {
  String get name;
  const Person();
  Person copyWith({
    String name,
  });
}

//4 rules: abstract all classes | implements not extends | empty constant constructor | Generated classes as generics do not work
abstract class OftenWet extends $OftenWet {
  String get wetness;
  const OftenWet();
  OftenWet copyWith({
    String wetness,
  });
}

//4 rules: abstract all classes | implements not extends | empty constant constructor | Generated classes as generics do not work
abstract class Employee extends Person {
  int get employeeId;
  String get name;
  const Employee();
  Employee copyWith({
    int employeeId,
    String name,
  });
}

//4 rules: abstract all classes | implements not extends | empty constant constructor | Generated classes as generics do not work
class WindowCleaner extends Employee implements OftenWet {
  final int employeeId;
  final String name;
  final Pet pet;
  final String wetness;
  final String windowMaxSize;
  const WindowCleaner({
    @required this.employeeId,
    @required this.name,
    @required this.pet,
    @required this.wetness,
    this.windowMaxSize = "big",
  })  : assert(employeeId != null),
        assert(name != null),
        assert(pet != null),
        assert(wetness != null),
        assert(windowMaxSize != null);
  WindowCleaner copyWith({
    String windowMaxSize,
    Pet pet,
    int employeeId,
    String wetness,
    String name,
  }) =>
      WindowCleaner(
        windowMaxSize:
            windowMaxSize == null ? this.windowMaxSize : windowMaxSize,
        pet: pet == null ? this.pet : pet,
        employeeId: employeeId == null ? this.employeeId : employeeId,
        wetness: wetness == null ? this.wetness : wetness,
        name: name == null ? this.name : name,
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

//4 rules: abstract all classes | implements not extends | empty constant constructor | Generated classes as generics do not work
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
