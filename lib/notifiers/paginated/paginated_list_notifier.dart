import 'package:flutter/foundation.dart';
import 'package:moviewer/notifiers/paginated/paginated.dart';

abstract class PaginatedListNotifier<T> extends ChangeNotifier {
  final pagination = Pagination();
  final state = PaginatedDataState<T>();

  Future<void> nextPage(String query) async {
    if (!pagination.isSameQuery(query)) {
      pagination.clear(query);
      state.setInitialState();
    }

    state.setLoadingState();
    notifyListeners();

    try {
      await fetchData();
      notifyListeners();
    } catch (e) {
      state.setErrorState(e.toString());
      notifyListeners();
    }
  }

  Future<void> fetchData();
}
