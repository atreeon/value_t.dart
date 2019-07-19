// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ValueT_covariance.dart';

// **************************************************************************
// ValueTGenerator
// **************************************************************************

//5 points: abstract all classes | implements not extends | empty constant constructor | functions not included in copywith | fields should be getters
class Pet<T> extends $Pet<T> {
  final T name;
  const Pet({
    @required this.name,
  }) : assert(name != null);
  Pet copyWith({
    T name,
  }) =>
      Pet(
        name: name == null ? this.name : name,
      );
  @override
  String toString() => "|name:" + name.toString();
}

//5 points: abstract all classes | implements not extends | empty constant constructor | functions not included in copywith | fields should be getters
class Dog<T> extends $Dog<T> implements Pet<T> {
  final T name;
  const Dog({
    @required this.name,
  }) : assert(name != null);
  Dog copyWith({
    T name,
  }) =>
      Dog(
        name: name == null ? this.name : name,
      );
  @override
  String toString() => "|name:" + name.toString();
}
