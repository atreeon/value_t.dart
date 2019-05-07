// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ValueT_SubTypes.dart';

// **************************************************************************
// ValueTGenerator
// **************************************************************************

//__name:false,pet:true,__type:false,colour:false,collar:true,__size:false,id:false,
class Person extends $Person {
  final String name;
  final Pet pet;
  const Person({
    @required this.name,
    @required this.pet,
  })  : assert(name != null),
        assert(pet != null);
//Person copyWith({
/*String name,
Pet pet,
String pet_type,
String pet_colour,
Collar pet_collar,
String pet_collar_size,
String pet_collar_id,
*/
/* => Person(*/
//);
}

//__type:false,colour:false,collar:true,__size:false,id:false,
class Pet extends $Pet {
  final Collar collar;
  final String colour;
  final String type;
  const Pet({
    @required this.collar,
    @required this.colour,
    @required this.type,
  })  : assert(collar != null),
        assert(colour != null),
        assert(type != null);
//Pet copyWith({
/*Collar collar,
String colour,
String type,
String collar_size,
String collar_id,
*/
/* => Pet(*/
//);
}

//__id:false,
abstract class Accessory extends $Accessory {
  String get id;
  const Accessory();
//Accessory copyWith({
/*String id,
*/
}

//__size:false,
class Collar extends $Collar implements Accessory {
  final String id;
  final String size;
  const Collar({
    @required this.id,
    @required this.size,
  })  : assert(id != null),
        assert(size != null);
//Collar copyWith({
/*String id,
String size,
*/
/* => Collar(*/
//);
}
