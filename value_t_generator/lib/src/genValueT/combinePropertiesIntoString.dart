import 'package:value_t_generator/src/ElementForValueT.dart';

///For testing and to see what the properties look like, this combines all
/// the properties into one big string (think now we can use other fns)
StringBuffer combinePropertiesIntoString(List<Property> properties) {
  var sb = StringBuffer();
  sb.write("__");
  for (var item in properties) {
    if (item.properties != null) {
      sb.write(item.name +
          ":" +
          item.hasSub.toString() +
          "," +
          combinePropertiesIntoString(item.properties).toString());
    } else {
      sb.write(item.name + ":" + item.hasSub.toString() + ",");
    }
  }
  return sb;
}