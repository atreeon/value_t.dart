// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ValueT_Pets.dart';

// **************************************************************************
// ValueTGenerator
// **************************************************************************

//5 points: abstract all classes | implements not extends | empty constant constructor | Generated classes as generics do not work | functions not included in copywith
class Pet extends $Pet {
  final String type;
  const Pet({
    @required this.type,
  }) : assert(type != null);
  Pet copyWith({
    String type,
  }) =>
      Pet(
        type: type == null ? this.type : type,
      );
  @override
  String toString() => "|type:" + type.toString();
}
