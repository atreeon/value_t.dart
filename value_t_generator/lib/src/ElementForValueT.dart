import 'package:meta/meta.dart';
import 'package:quiver/core.dart';

class ElementSuperType {
  final ElementSuperType elementSuperType;
  final List<ElementAccessor> elementAccessors;
  final List<Interface> interfaces;
  final List<Property> properties;
  final String name;

  ElementSuperType(this.elementSuperType, this.elementAccessors,
      this.interfaces, this.properties, this.name);
}

class Interface {
  final ElementSuperType elementSuperType;
  final List<ElementAccessor> elementAccessors;
  final List<Interface> interfaces;
  final List<Property> properties;
  final String name;

  Interface(this.elementSuperType, this.elementAccessors, this.interfaces,
      this.properties, this.name);
}

///The fields of each class
class ElementAccessor {
  final String name;
  final String type;
  final String defaultValue;
  final String extra;

  ElementAccessor(this.name, this.type, {this.defaultValue, this.extra});

  ElementAccessor copyWith({@required String type}) => ElementAccessor(
        this.name,
        type,
        extra: this.extra,
        defaultValue: this.defaultValue,
      );

  bool operator ==(o) => o is ElementAccessor && name == o.name;
  int get hashCode => hash2(name.hashCode, type.hashCode);
}

class Property {
  final String name;
  final String type;
  final String nameHierarchy;

  ///whether this property has a list of sub properties (ie property Pet has pet_name, pet_type)
  final bool hasSub;
  final List<Property> properties;

  Property(this.name, this.type,
      {this.nameHierarchy, this.hasSub = false, this.properties});

  @override
  String toString() {
    return name +
        "|" +
        type +
        "|" +
        nameHierarchy.toString() +
        "|" +
        hasSub.toString() +
        "|" +
        properties.toString();
  }
}
