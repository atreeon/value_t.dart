import 'package:value_t_generator/src/ElementForValueT.dart';

var example1 = ElementSuperType(
  ElementSuperType(
    null,
    [ElementAccessor("fullWord", "String")],
    [],
    [Property("fullWord", "String")],
    null,
  ),
  [],
  [],
  [Property("fullWord", "String")],
  null,
);

var example2 = ElementSuperType(
  ElementSuperType(
    ElementSuperType(
      null,
      [ElementAccessor("fullWord", "String")],
      [],
      [],
      null,
    ),
    [],
    [],
    [],
    null,
  ),
  [],
  [],
  [Property("fullWord", "String")],
  null,
);

var example3 = ElementSuperType(
  ElementSuperType(
    ElementSuperType(
      null,
      [ElementAccessor("fullWord", "String")],
      [],
      [],
      null,
    ),
    [],
    [],
    [],
    null,
  ),
  [
    ElementAccessor("answer", "String"),
    ElementAccessor("infoMessages", "List<String>"),
  ],
  [],
  [],
  null,
);

var exampleDuplicates = ElementSuperType(
  ElementSuperType(
    ElementSuperType(
      null,
      [ElementAccessor("fullWord", "String")],
      [],
      [],
      null,
    ),
    [ElementAccessor("fullWord", "String")],
    [],
    [],
    null,
  ),
  [
    ElementAccessor("answer", "String"),
    ElementAccessor("infoMessages", "List<String>"),
  ],
  [],
  [
    Property("fullWord", "String"),
    Property("answer", "String"),
    Property("infoMessages", "List<String>")
  ],
  null,
);

var exampleNoFields = ElementSuperType(
  ElementSuperType(
    ElementSuperType(
      null,
      [],
      [],
      [],
      null,
    ),
    [],
    [],
    [],
    null,
  ),
  [],
  [],
  [],
  null,
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
          [],
          null,
        ),
        [ElementAccessor("C", "int")],
        [],
        [],
        null,
      )
    ],
    [],
    null,
  ),
  [
    ElementAccessor("infoMessages", "List<String>"),
  ],
  [],
  [
    Property("fullWord", "String"),
    Property("A", "int"),
    Property("B", "int"),
    Property("C", "int"),
    Property("infoMessages", "List<String>"),
  ],
  null,
);

var exampleWithDefaultValue = ElementSuperType(
  ElementSuperType(
    null,
    [ElementAccessor("fullWord", "String", defaultValue: """ "default" """)],
    [
      Interface(
        ElementSuperType(
          null,
          [
            ElementAccessor("A", "int"),
            ElementAccessor("B", "int"),
          ],
          [],
          [],
          null,
        ),
        [ElementAccessor("C", "int")],
        [],
        [],
        null,
      )
    ],
    [],
    null,
  ),
  [
    ElementAccessor("infoMessages", "List<String>",
        defaultValue: """ List<String>() """),
  ],
  [],
  [],
  null,
);

var exampleWithDollar = ElementSuperType(
  ElementSuperType(
    ElementSuperType(
      null,
      [ElementAccessor("pet", "\$Pet")],
      [],
      [],
      null,
    ),
    [],
    [],
    [],
    null,
  ),
  [
    ElementAccessor("answer", "String"),
    ElementAccessor("infoMessages", "List<String>"),
  ],
  [],
  [],
  null,
);
