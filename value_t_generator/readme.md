## value_t

Generates code to create a copywith class and implements all the getter fields in any extended or implemented classes.

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

### See Marking_ValueT_extends and Marking_ValueT_implements in the example
