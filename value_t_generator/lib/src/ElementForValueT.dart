import 'package:quiver/core.dart';

class ElementSuperType {
  final ElementSuperType elementSuperType;
  final List<ElementAccessor> elementAccessors;
  final List<Interface> interfaces;

  ElementSuperType(
      this.elementSuperType, this.elementAccessors, this.interfaces);
}

class Interface {
  final ElementSuperType elementSuperType;
  final List<ElementAccessor> elementAccessors;
  final List<Interface> interfaces;

  Interface(this.elementSuperType, this.elementAccessors, this.interfaces);
}

///The fields of each class
class ElementAccessor {
  final String name;
  final String type;

  ElementAccessor(this.name, this.type);

  bool operator ==(o) => o is ElementAccessor && name == o.name;
  int get hashCode => hash2(name.hashCode, type.hashCode);
}
