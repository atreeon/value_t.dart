import 'package:meta/meta.dart';
import 'package:value_t_annotation/value_t_annotation.dart';

part 'ValueT_defaultFieldValue.g.dart';

@ValueT()
abstract class $BatchItemTest {
  List<int> get lectureIds;
  int get orderId => 5;

  const $BatchItemTest();
}

main() {
  var a = BatchItemTest(lectureIds: [1, 2, 3]);

  print(a.orderId);
}
