import 'package:collection/collection.dart';
import 'package:value_t_generator/src/ElementForValueT.dart';

///Takes the list of properties and combines in a way that they are 
/// the correct levels to be formatted for the copyWith function.
///This just a maximum of one level deep.
List<Property> getPropertiesOneLevel(List<Property> properties) {
  var properties1Level = List<Property>();

  for (var item in properties) {
    if (item.hasSub) {
      properties1Level.add(Property(item.name, item.type,
          nameHierarchy: item.name,
          properties: addProperties([item.name], item.properties, 0)));
    } else {
      properties1Level
          .add(Property(item.name, item.type, nameHierarchy: item.name));
    }
  }

  return groupBy(properties1Level, (x) => x.name)
      .map((x, y) => MapEntry(x, y.first))
      .values
      .toList();
}

List<Property> addProperties(
    List<String> propertyName, List<Property> properties, int level) {
  var propertiesNew = List<Property>();
  for (var item in properties) {
    propertiesNew.add(Property(
      level == 0 ? item.name : "${propertyName.skip(1).join("_")}_${item.name}",
      item.type,
      nameHierarchy: "${propertyName.join("_")}_${item.name}",
    ));

    if (item.hasSub) {
      propertiesNew.addAll(addProperties(
          propertyName + [item.name], item.properties, level + 1));
    }
  }

  return propertiesNew;
}