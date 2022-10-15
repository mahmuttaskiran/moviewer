import 'package:http/http.dart' as http;

class MovieDbApi {
  static const String _baseUrl = 'api.themoviedb.org';
  static const String _defaultPath = '/3/';
  static const String _apiKey = '35ef0461fc4557cf1d256d3335ed7545';

  final http.Client _client;

  MovieDbApi(this._client);

  Future<http.Response> get(String endpoint, {Map<String, String> body = const {}}) =>
      _client.get(Uri.https(_baseUrl, _defaultPath + endpoint, {'api_key': _apiKey, ...body}));
}
