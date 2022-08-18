import 'package:http/http.dart' as http;

class MovieDbApi {
  static const String _baseUrl = 'https://api.themoviedb.org/3/';
  static const String _apiKey = '35ef0461fc4557cf1d256d3335ed7545';

  final http.Client _client;

  MovieDbApi(this._client);

  Future<http.Response> get(String endpoint) =>
      _client.get(Uri.dataFromString("$_baseUrl$endpoint?api_key=$_apiKey", mimeType: 'application/json'));
}
