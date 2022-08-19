class PaginatedDataState<T> {
  List<T> data = [];
  String errorMessage = '';
  bool isFetching = false;

  bool get hasError => errorMessage.isNotEmpty;

  PaginatedDataState();

  void setInitialState() {
    data.clear();
    errorMessage = '';
    isFetching = false;
  }

  void setLoadingState() {
    isFetching = true;
    errorMessage = '';
  }

  void setDataState(List<T> data) {
    this.data.addAll(data);
    isFetching = false;
    errorMessage = '';
  }

  void setErrorState(String errorMessage) {
    isFetching = false;
    this.errorMessage = errorMessage;
  }
}
