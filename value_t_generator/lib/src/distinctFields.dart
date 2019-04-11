import 'package:value_t_generator/src/ElementForValueT.dart';

List<ElementAccessor> distinctFields(ElementSuperType element) {
  var fields = Set<ElementAccessor>();
  var r = getAccessors(fields, element).toList();
  r = r.map((x) => x.copyWith(type: removeDollarFromType(x.type))).toList();
  r.sort((a, b) => a.name.compareTo(b.name));
  return r;
}

String removeDollarFromType(String type) {
  return type.replaceAll("\$", "");
}

Set<ElementAccessor> getAccessors(
    Set<ElementAccessor> fields, ElementSuperType element) {
  fields.addAll(element.elementAccessors);

  element.interfaces.forEach((x) => getAccessors2(fields, x));

  if (element.elementSuperType == null) {
    return fields;
  }

  return getAccessors(fields, element.elementSuperType);
}

//TODO: Think I could change interface to supertype...same thing really (lazy copy and paste, eek!)
Set<ElementAccessor> getAccessors2(
    Set<ElementAccessor> fields, Interface element) {
  fields.addAll(element.elementAccessors);

  element.interfaces.forEach((x) => getAccessors2(fields, x));

  if (element.elementSuperType == null) {
    return fields;
  }

  return getAccessors(fields, element.elementSuperType);
}
