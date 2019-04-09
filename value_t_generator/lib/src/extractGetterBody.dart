String extractGetterBody(String getterName, String getterType, String unit) {
  var startToken = "${getterType} get ${getterName} => ";
  var endToken = ";";

  if (unit.indexOf(startToken) == -1) return null;

  var start = unit.substring(unit.indexOf(startToken) + startToken.length);
  var body = start.substring(0, start.indexOf(endToken));

  return " ${body} ";
}
