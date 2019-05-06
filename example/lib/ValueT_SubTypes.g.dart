// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ValueT_SubTypes.dart';

// **************************************************************************
// ValueTGenerator
// **************************************************************************

//__name:false,pet:true,__type:false,colour:false,collar:true,__size:false,
abstract class Person extends $Person {
  String get name;
  Pet get pet;
  const Person();
  Person copyWith({
    String name,
    Pet pet,
  });
}

//__type:false,colour:false,collar:true,__size:false,
abstract class Pet extends $Pet {
  Collar get collar;
  String get colour;
  String get type;
  const Pet();
  Pet copyWith({
    Collar collar,
    String colour,
    String type,
  });
}

//__size:false,
class Collar extends $Collar {
  final String size;
  const Collar({
    @required this.size,
  }) : assert(size != null);
  Collar copyWith({
    String size,
  }) =>
      Collar(
        size: size == null ? this.size : size,
      );
  @override
  String toString() => "|size:" + size.toString();
}
