// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ValueT_Vet.dart';

// **************************************************************************
// ValueTGenerator
// **************************************************************************

//5 points: abstract all classes | implements not extends | empty constant constructor | Generated classes as generics do not work | functions not included in copywith
class Vet extends $Vet {
  final String name;
  final List<String> pets;
  const Vet({
    @required this.name,
    @required this.pets,
  })  : assert(name != null),
        assert(pets != null);
  Vet copyWith({
    String name,
    List<String> pets,
  }) =>
      Vet(
        name: name == null ? this.name : name,
        pets: pets == null ? this.pets : pets,
      );
  @override
  String toString() => "|name:" + name.toString() + "|pets:" + pets.toString();
}
