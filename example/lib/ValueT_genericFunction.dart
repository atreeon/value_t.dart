import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:value_t_annotation/value_t_annotation.dart';

part 'ValueT_genericFunction.g.dart';

@ValueT(true)
abstract class $FbLoadTypeDef<T> {
  FbLoadType get fbLoadType;
  bool Function(Store<AppState>) get hasDataCheck;
  bool get isStaticData;

  const $FbLoadTypeDef();
}

@ValueT()
abstract class $FbLoadTypeDefList<T> implements $FbLoadTypeDef<T> {
  List<T> Function(List<dynamic>) get loadFnList;

  const $FbLoadTypeDefList();
}

@ValueT()
abstract class $FbLoadTypeDefSingle<T> implements $FbLoadTypeDef<T> {
  T Function(List<dynamic>) get loadFnSingle;

  const $FbLoadTypeDefSingle();
}

enum FbLoadType {
  lessons,
  lectures,
  translations,
  flags,
  userLectures,
  userLessons,
  userFlags,
  userProfile,
}

class Dog {}

class AppState {
  final Dog dog;

  AppState({
    this.dog,
  });
}
