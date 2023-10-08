abstract class FilterModel {
  String getFilterKey();

  bool matcher(String query, {bool filter = true}) {
    return filter
        ? getFilterKey().toLowerCase().contains(query.toLowerCase())
        : false;
  }
}
