## value_t

Generates code to create a copywith class and properly inherits all the readonly fields in the hierarchy

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

### When inheriting from a class use a dollar
```
abstract class $MyOtherClass extends $MyClass{
```
