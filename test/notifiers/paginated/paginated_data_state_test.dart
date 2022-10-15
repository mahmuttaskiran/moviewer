import 'package:flutter_test/flutter_test.dart';
import 'package:moviewer/notifiers/paginated/paginated.dart';

main() {
  test("PaginatedDataState.hasError should return true after setErrorState", () {
    final state = PaginatedDataState<String>();
    expect(state.hasError, false);

    state.setErrorState("Fuck! Something went wrong");

    expect(state.hasError, true);
  });

  test("PaginatedDataState.isFetching should return true after setLoadingState", () {
    final state = PaginatedDataState<String>();
    expect(state.isFetching, false);

    state.setLoadingState();

    expect(state.isFetching, true);
  });

  test("PaginatedDataState.data should return non-empty list after setSetDataState", () {
    final state = PaginatedDataState<String>();
    expect(state.data.isEmpty, true);

    state.setDataState(["mahmut", "mehmet", "andrew", "jack"]);

    expect(state.data.isEmpty, false);
  });
}
