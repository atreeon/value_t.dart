// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ValueT_FbLoadTypeDef.dart';

// **************************************************************************
// ValueTGenerator
// **************************************************************************

//6 points: abstract all classes | implements not extends | empty constant constructor | Generated classes as generics do not work | functions not included in copywith | fields should be getters
class FbLoadTypeDef<T> extends $FbLoadTypeDef<T> {
  final FbLoadType fbLoadType;
  final bool Function(Store) hasDataCheck;
  final bool isStaticData;
  const FbLoadTypeDef({
    @required this.fbLoadType,
    @required this.hasDataCheck,
    @required this.isStaticData,
  })  : assert(fbLoadType != null),
        assert(hasDataCheck != null),
        assert(isStaticData != null);
  FbLoadTypeDef copyWith({
    FbLoadType fbLoadType,
    bool isStaticData,
  }) =>
      FbLoadTypeDef(
        fbLoadType: fbLoadType == null ? this.fbLoadType : fbLoadType,
        isStaticData: isStaticData == null ? this.isStaticData : isStaticData,
      );
  @override
  String toString() =>
      "|fbLoadType:" +
      fbLoadType.toString() +
      "|hasDataCheck:" +
      hasDataCheck.toString() +
      "|isStaticData:" +
      isStaticData.toString();
}

//6 points: abstract all classes | implements not extends | empty constant constructor | Generated classes as generics do not work | functions not included in copywith | fields should be getters
class FbLoadTypeDefList<T> extends $FbLoadTypeDefList<T> {
  final List<T> Function(List<dynamic>) loadFn;
  const FbLoadTypeDefList({
    @required this.loadFn,
  }) : assert(loadFn != null);
}

//6 points: abstract all classes | implements not extends | empty constant constructor | Generated classes as generics do not work | functions not included in copywith | fields should be getters
class FbLoadTypeDefSingle<T> extends $FbLoadTypeDefSingle<T> {
  final T Function(List<dynamic>) loadFn;
  const FbLoadTypeDefSingle({
    @required this.loadFn,
  }) : assert(loadFn != null);
}
