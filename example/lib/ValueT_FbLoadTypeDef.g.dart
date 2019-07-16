// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ValueT_FbLoadTypeDef.dart';

// **************************************************************************
// ValueTGenerator
// **************************************************************************

//5 points: abstract all classes | implements not extends | empty constant constructor | Generated classes as generics do not work | functions not included in copywith
class FbLoadTypeDef<T> extends $FbLoadTypeDef {
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

//5 points: abstract all classes | implements not extends | empty constant constructor | Generated classes as generics do not work | functions not included in copywith
class FbLoadTypeDefList<T> extends $FbLoadTypeDefList {
  final List<T> Function(List<dynamic>) loadFn;
  const FbLoadTypeDefList({
    @required this.loadFn,
  }) : assert(loadFn != null);
}

//5 points: abstract all classes | implements not extends | empty constant constructor | Generated classes as generics do not work | functions not included in copywith
class FbLoadTypeDefSingle<T> extends $FbLoadTypeDefSingle {
  final T Function(List<dynamic>) loadFn;
  const FbLoadTypeDefSingle({
    @required this.loadFn,
  }) : assert(loadFn != null);
}
