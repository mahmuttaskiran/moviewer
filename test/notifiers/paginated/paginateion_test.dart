import 'package:flutter_test/flutter_test.dart';
import 'package:moviewer/notifiers/paginated/paginated.dart';

void main() {
  test('Pagination should be set to initial state after .clear()', () {
    final pagination = Pagination();
    pagination.nextPage(10);
    expect(pagination.page, 2);

    pagination.clear("new query");

    expect(pagination.page, 1);
  });

  test("Pagination should return hasReachedEnd true when page >= totalPage", () {
    final pagination = Pagination();
    pagination.nextPage(3);
    expect(pagination.hasReachedEnd, false);

    pagination.nextPage(3);
    expect(pagination.hasReachedEnd, true);
  });
}