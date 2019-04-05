import 'package:value_t_generator/src/ElementForValueT.dart';

List<ElementAccessor> distinctFields(ElementSuperType element) {
  var fields = Set<ElementAccessor>();
  var r = getAccessors(fields, element).toList();
  r.sort((a, b) => a.name.compareTo(b.name));
  return r;
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

//TODO: could change interface to supertype...same thing really
Set<ElementAccessor> getAccessors2(
    Set<ElementAccessor> fields, Interface element) {
  fields.addAll(element.elementAccessors);

  element.interfaces.forEach((x) => getAccessors2(fields, x));

  if (element.elementSuperType == null) {
    return fields;
  }

  return getAccessors(fields, element.elementSuperType);
}
