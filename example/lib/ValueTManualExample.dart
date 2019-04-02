// part 'partTest_g.dart';

abstract class $PartTest {
  String get fullWord;
}

class PartTest implements $PartTest {
  final String fullWord;
  PartTest(this.fullWord) {
    assert(this.fullWord != null);
  }

  PartTest copyWith({
    String fullWord,
  }) =>
      PartTest(
        fullWord == null ? this.fullWord : fullWord,
      );
}

PartTest partTest(String fullWord) {
  return PartTest(fullWord);
}
