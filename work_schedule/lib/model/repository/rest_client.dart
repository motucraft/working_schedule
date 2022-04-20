import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:universal_platform/universal_platform.dart';

class RestClient {
  factory RestClient() {
    return _restClient ??= RestClient._internal();
  }

  RestClient._internal() {
    if (UniversalPlatform.isAndroid && env['BASE_URL_ANDROID'] != null) {
      // プラットフォームがAndroid、かつBASE_URL_ANDROIDが定義されている場合
      // AndroidのエミュレータからPCへアクセスするためにはlocalhostではなく10.0.2.2でアクセスする必要がある。
      // そのため、プラットフォームによってbaseUrlを切り替えられるようにしている。
      _baseUrl = env['BASE_URL_ANDROID'];
    } else {
      _baseUrl = env['BASE_URL'];
    }
  }

  static RestClient? _restClient;
  static const headers = {'Content-Type': 'application/json; charset=utf-8'};
  final http.Client _client = http.Client();
  // final _cookieJar = CookieJar();
  late final String? _baseUrl;
  late int id;

  String get baseUrl => _baseUrl != null ? _baseUrl! : '';

  http.Client get client => _client;

  // CookieJar get cookieJar => _cookieJar;

  // Future<UserModel> login(String userId, String password);

  // Future logout();

}
