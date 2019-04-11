import 'package:meta/meta.dart';
class $MyClass{
  const $MyClass();
}
class MyClass
 extends $MyClass 
{

final String fullWord;
const MyClass({@required this.fullWord,
}):

assert(fullWord != null);
MyClass copyWith({
String fullWord,
})
 => MyClass(

fullWord: fullWord == null ? this.fullWord : fullWord,
);
}