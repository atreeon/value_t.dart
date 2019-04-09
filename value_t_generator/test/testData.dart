import 'package:value_t_generator/src/ElementForValueT.dart';

var example1 = ElementSuperType(
  ElementSuperType(
    null,
    [ElementAccessor("fullWord", "String", null)],
    [],
  ),
  [],
  [],
);

var example2 = ElementSuperType(
  ElementSuperType(
    ElementSuperType(
      null,
      [ElementAccessor("fullWord", "String", null)],
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
      [ElementAccessor("fullWord", "String", null)],
      [],
    ),
    [],
    [],
  ),
  [
    ElementAccessor("answer", "String", null),
    ElementAccessor("infoMessages", "List<String>", null),
  ],
  [],
);

var exampleDuplicates = ElementSuperType(
  ElementSuperType(
    ElementSuperType(
      null,
      [ElementAccessor("fullWord", "String", null)],
      [],
    ),
    [ElementAccessor("fullWord", "String", null)],
    [],
  ),
  [
    ElementAccessor("answer", "String", null),
    ElementAccessor("infoMessages", "List<String>", null),
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
    [ElementAccessor("fullWord", "String", null)],
    [
      Interface(
        ElementSuperType(
          null,
          [
            ElementAccessor("A", "int", null),
            ElementAccessor("B", "int", null),
          ],
          [],
        ),
        [ElementAccessor("C", "int", null)],
        [],
      )
    ],
  ),
  [
    ElementAccessor("infoMessages", "List<String>", null),
  ],
  [],
);

var exampleWithDefaultValue = ElementSuperType(
  ElementSuperType(
    null,
    [ElementAccessor("fullWord", "String", """ "default" """)],
    [
      Interface(
        ElementSuperType(
          null,
          [
            ElementAccessor("A", "int", null),
            ElementAccessor("B", "int", null),
          ],
          [],
        ),
        [ElementAccessor("C", "int", null)],
        [],
      )
    ],
  ),
  [
    ElementAccessor("infoMessages", "List<String>", """ List<String>() """),
  ],
  [],
);
