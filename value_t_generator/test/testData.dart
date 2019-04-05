import 'package:value_t_generator/src/ElementForValueT.dart';

var example1 = ElementSuperType(
  ElementSuperType(
    null,
    [ElementAccessor("fullWord", "String")],
    [],
  ),
  [],
  [],
);

var example2 = ElementSuperType(
  ElementSuperType(
    ElementSuperType(
      null,
      [ElementAccessor("fullWord", "String")],
      [],
    ),
    [],
    [],
  ),
  [],
  [],
);

var example3 = ElementSuperType(
  ElementSuperType(
    ElementSuperType(
      null,
      [ElementAccessor("fullWord", "String")],
      [],
    ),
    [],
    [],
  ),
  [
    ElementAccessor("answer", "String"),
    ElementAccessor("infoMessages", "List<String>"),
  ],
  [],
);

var exampleDuplicates = ElementSuperType(
  ElementSuperType(
    ElementSuperType(
      null,
      [ElementAccessor("fullWord", "String")],
      [],
    ),
    [ElementAccessor("fullWord", "String")],
    [],
  ),
  [
    ElementAccessor("answer", "String"),
    ElementAccessor("infoMessages", "List<String>"),
  ],
  [],
);

var exampleNoFields = ElementSuperType(
  ElementSuperType(
    ElementSuperType(
      null,
      [],
      [],
    ),
    [],
    [],
  ),
  [],
  [],
);

var exampleWithInterfacesSimple = ElementSuperType(
  ElementSuperType(
    null,
    [ElementAccessor("fullWord", "String")],
    [
      Interface(
        ElementSuperType(
          null,
          [
            ElementAccessor("A", "int"),
            ElementAccessor("B", "int"),
          ],
          [],
        ),
        [ElementAccessor("C", "int")],
        [],
      )
    ],
  ),
  [
    ElementAccessor("infoMessages", "List<String>"),
  ],
  [],
);
