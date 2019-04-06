## value_t

Generates code to create a copywith class and implements all the getter fields in any extended or implemented classes.

### When defining your class put a dollar infront of the name and make it abstract
```
abstract class $MyClass {
```

### When defining the fields make them non-final getters
```
    String get name;
}
```

### When using your class in code remove the dollar
```
var a = MyClass("Adrian");
```

### See Marking_ValueT_extends and Marking_ValueT_implements in the example
