## value_t

Generates code to create simple type with a copywith class and implements all the getter fields in any extended or implemented classes.

### Advantages over coding it yourself
Less code to write and then read back over too.  Also, refactoring can be less because you don't need to change all the names in the copyWith definitions and where a class has been extended multiple times.  A free toString implementation (useful for equality in testing)

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
abstract class Marking {}

abstract class IsCorrect {}

abstract class HasWord {
  String get word;
}

@ValueT() //will be made non abastract and getters created
abstract class $MarkingCorrectNoWord implements Marking, IsCorrect {}

@ValueT()
abstract class $MarkingCorrect implements Marking, HasWord, IsCorrect {}

@ValueT()
abstract class $MarkingIncorrect implements Marking, HasWord {
  String get answer;
  List<String> get infoMessages;
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
var a = MyClass("Adrian");
```

### See example folder for usage

### Inspirations
Thanks for built_value and meta_types for inspiration (the dollar in front of the class names was copied from meta_types)
