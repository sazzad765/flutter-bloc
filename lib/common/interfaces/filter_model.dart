abstract class Filter {
  String getKey();

  bool matcher(String query, {bool filter = true}) {
    return filter
        ? getKey().toLowerCase().contains(query.toLowerCase())
        : false;
  }
}
