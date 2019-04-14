## value_t

Generates code to create a simple type with a copywith class and implements all the getter fields in any extended or implemented classes.

### Advantages over coding it yourself
Less code to write and less code to read back over too.  Refactoring can be less because you don't need to change all the names in the copyWith definitions, constructors and where a class has been extended multiple times.  A free toString implementation (I find this useful when comparing objects for tests)

### Downsides over coding it yourself
####Go to definition will take you to the generated class...two work arounds
+ Need to define a const constructor in the base type
+ Go to definition then on the $MyClass go to definition again...not much of an impedement
+ name the file the same as your class and instead of pressing f12 cmd + p and type the filename.  This sounds like more work but because of the conciseness of your classes you can fit whole class heirarchies and related interfaces in a single file and still view all the definitions.
+ Also, the generated file will have the fields names so you can is it as a reference anyway
#### Renaming classes
you must rename both your defition and the generated name `$PersonClass` and `PersonClass`.  This one is more fiddly, press f2 on PersonClass and rename, then change the name of $PersonClass...this order will result in just two changes.

Usage
```
  var a = MarkingIncorrect("my answer", <String>["blah", "blah"], "fullWord");

  print("a is MarkingState:" + (a is Marking).toString());

  var d = a.copyWith(answer: "blah");
```

Definition
```
  Person a = WindowCleaner(pet: Pet(type: "cat"), name: "Bob", employeeId: 5, wetness: "wet");

  if (a is Employee) {
    print('I am an employee');
    print(a.employeeId);
  }

  if (a is Person) {
    print('I am a Person');
    print(a.name);
  }

  var b = a.copyWith(name: "bobby");
  print(b.name);

  if (b is OftenWet) {
    print("windowCleaners are OftenWet");
  }
}
```

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
var a = MyClass("Adriaaan");
```

### See example folder for usage

### Inspirations and alternatives
built_value and meta_types
