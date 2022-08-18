import 'package:flutter_test/flutter_test.dart';
import 'package:moviewer/di/service_provider.dart';

main() {
  test('ServiceProvider should return same instances for services', () {
    shouldReturnSameInstance(ServiceProvider().provideMovieDbApi);
    shouldReturnSameInstance(ServiceProvider().provideMovieService);
    shouldReturnSameInstance(ServiceProvider().provideRemoteMovieService);
  });

  test("ServiceProvider should provide different instances of http.Client", () {
    final serviceProvider = ServiceProvider();
    final firstClient = serviceProvider.provideHttpClient();
    final secondClient = serviceProvider.provideHttpClient();
    expect(firstClient, isNot(secondClient));
  });
}

void shouldReturnSameInstance(dynamic Function() getInstance) {
  final instance1 = getInstance();
  final instance2 = getInstance();
  expect(instance1, instance2);
}
