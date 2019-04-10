import 'package:quiver/core.dart';

class ElementSuperType {
  final ElementSuperType elementSuperType;
  final List<ElementAccessor> elementAccessors;
  final List<Interface> interfaces;
  final String name;

  ElementSuperType(
      this.elementSuperType, this.elementAccessors, this.interfaces, this.name);
}

class Interface {
  final ElementSuperType elementSuperType;
  final List<ElementAccessor> elementAccessors;
  final List<Interface> interfaces;
  final String name;

  Interface(
      this.elementSuperType, this.elementAccessors, this.interfaces, this.name);
}

///The fields of each class
class ElementAccessor {
  final String name;
  final String type;
  final String defaultValue;
  final String extra;

  ElementAccessor(this.name, this.type, {this.defaultValue, this.extra});

  ElementAccessor copyWith(String type) => ElementAccessor(
        this.name,
        type,
        defaultValue: this.defaultValue,
      );

  bool operator ==(o) => o is ElementAccessor && name == o.name;
  int get hashCode => hash2(name.hashCode, type.hashCode);
}
