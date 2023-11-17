import 'package:bloc_example/common/interfaces/filter_model.dart';

class Search {
  static List<T> find<T extends Filter>({
    required List<T> items,
    required String q,
    SearchFilter<T>? filter,
  }) {
    final i =
        filter == null ? items : items.where((item) => filter(item)).toList();
    return i.where((element) => element.matcher(q)).toList();
  }
}

typedef SearchFilter<T> = bool Function(T item);
