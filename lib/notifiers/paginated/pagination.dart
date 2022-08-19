class Pagination {
  int page;
  bool hasReachedEnd;
  String query;

  Pagination({this.page = 1, this.hasReachedEnd = false, this.query = ''});

  bool isSameQuery(String query) => this.query == query;

  void clear(String query) {
    this.query = query;
    hasReachedEnd = false;
    page = 1;
  }

  void nextPage(int totalPage) {
    page++;
    hasReachedEnd = page >= totalPage;
  }
}