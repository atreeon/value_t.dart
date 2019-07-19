import 'package:meta/meta.dart';
import 'package:value_t_annotation/value_t_annotation.dart';

part 'ValueT_GetterFunction.g.dart';

@ValueT(true)
abstract class $BatchItem {
  bool get isComplete;
  List<int> getLectureIds();

  const $BatchItem();
}

@ValueT()
abstract class $BatchItemLecture implements $BatchItem {
  int get lectureId;

  @override
  List<int> getLectureIds() {
    return [lectureId];
  }

  const $BatchItemLecture();
}

@ValueT()
abstract class $BatchItemTest implements $BatchItem {
  List<int> get lectureIds;

  @override
  List<int> getLectureIds() {
    return lectureIds;
  }

  const $BatchItemTest();
}

main() {
  BatchItem item1 = BatchItemTest(isComplete: false, lectureIds: [1, 3, 4]);
  BatchItem item2 = BatchItemLecture(isComplete: false, lectureId: 1);

  print(item1.getLectureIds().toString());
  print(item2.getLectureIds().toString());
}
