import 'package:value_t_generator/src/ElementForValueT.dart';

///converts an ElementSuperType to a string...for testing / checking
StringBuffer elementSuperTypeToString(
    ElementSuperType superType, int level, StringBuffer sb) {
  for (var accessor in superType.elementAccessors) {
    sb.writeln("//" +
        _createSpaces(level) +
        level.toString() +
        accessor.name +
        "|" +
        accessor.type);
  }

  if (superType.elementSuperType == null) return sb;

  return elementSuperTypeToString(superType.elementSuperType, level + 1, sb);
}

String _createSpaces(int number) {
  var str = "";
  for (var i = 0; i < number; i++) {
    str = str + " ";
  }
  return str;
}