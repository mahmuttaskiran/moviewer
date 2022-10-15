import 'package:flutter_test/flutter_test.dart';
import 'package:moviewer/di/service_module.dart';

main() {
  test('ServiceProvider should return same instances for services', () {
    shouldReturnSameInstance(ServiceModuleDI().provideMovieDbApi);
    shouldReturnSameInstance(ServiceModuleDI().provideMovieService);
    shouldReturnSameInstance(ServiceModuleDI().provideRemoteMovieService);
  });

  test("ServiceProvider should provide different instances of http.Client", () {
    final serviceProvider = ServiceModuleDI();
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
