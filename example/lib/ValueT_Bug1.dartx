import 'package:meta/meta.dart';
import 'package:value_t_annotation/value_t_annotation.dart';

part 'ValueT_Bug1.g.dart';

/*
The bug is as follows.
If I use implements then toArray() function does not get inherited
If I use extends then 
  () → List<ScoreStaged> isn't a valid override of () → List<$ScoreStaged>
So, I must re-implement the toArray method
Workaround: add toArray() method manually
Possible update to code: copy method over to implemented functions if it doesn't re-implement it
*/

@ValueT()
abstract class $UserLecture {
  List<$ScoreStaged> get lastXPointsForStages;
  List<$ScoreRandom> get lastXPointsForRandom;
  const $UserLecture();
}

@ValueT(true)
abstract class $Score {
  int get score;
  int get max;

  List<int> toArray() => [score, max];

  const $Score();
}

@ValueT()
abstract class $ScoreRandom implements $Score {
  List<int> toArray() => [score, max];

  const $ScoreRandom();
}

@ValueT()
abstract class $ScoreStaged implements $Score {
  const $ScoreStaged();
}
