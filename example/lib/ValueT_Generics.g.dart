// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ValueT_Generics.dart';

// **************************************************************************
// ValueTGenerator
// **************************************************************************

class PetDepartment<T extends Pet> extends $PetDepartment<T> {
  final List<T> pets;
  const PetDepartment({
    @required this.pets,
  }) : assert(pets != null);
  PetDepartment copyWith({
    List<T> pets,
  }) =>
      PetDepartment(
        pets: pets == null ? this.pets : pets,
      );
  @override
  String toString() => "|pets:" + pets.toString();
}
