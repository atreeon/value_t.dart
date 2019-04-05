import 'package:adi_helpers/stringH.dart';
import 'package:value_t_generator/src/ElementForValueT.dart';

///converts an ElementSuperType to a string...for testing / checking
StringBuffer elementSuperTypeToString(
    ElementSuperType superType, int level, StringBuffer sb) {
  for (var accessor in superType.elementAccessors) {
    sb.writeln("//" +
        createSpaces(level) +
        level.toString() +
        accessor.name +
        "|" +
        accessor.type);
  }

  if (superType.elementSuperType == null) return sb;

  return elementSuperTypeToString(superType.elementSuperType, level + 1, sb);
}
