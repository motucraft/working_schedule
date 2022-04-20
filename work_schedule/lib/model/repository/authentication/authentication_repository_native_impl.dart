import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/user_model.dart';
import '../cookie_management.dart';
import '../rest_client.dart';
import 'authentication_repository.dart';

class AuthenticationRepositoryNativeImpl extends http.BaseClient
    implements AuthenticationRepository {
  final _restClient = RestClient();
  final _cookieManagement = CookieManagement();

  @override
  Future<UserModel> login(String userId, String password) async {
    http.Response response = await post(
      Uri.parse(_restClient.baseUrl + '/authentication/login'),
      body: json.encode({'userId': userId, 'password': password}),
      headers: RestClient.headers,
    );

    UserModel user = UserModel();
    if (response.statusCode == 200) {
      var cookies = await _cookieManagement.cookieJar
          .loadForRequest(Uri.parse(_restClient.baseUrl));
      print('cookies=' + cookies.toString());

      user = UserModel.fromJson(jsonDecode(response.body));

      // IDをキャッシュ
      _restClient.id = user.id!;
    }

    return user;
  }

  @override
  logout() async {
    var url = _restClient.baseUrl + '/authentication/logout';

    try {
      // ログアウト
      http.Response response = await post(
        Uri.parse(url),
        headers: RestClient.headers,
      );

      if (response.statusCode == 401) {
        // リフレッシュ
        // http.Response response = await _restClient.refresh();
        http.Response response = await get(
          Uri.parse(_restClient.baseUrl + '/authentication/refresh'),
          headers: RestClient.headers,
        );

        if (response.statusCode == 200) {
          // 再実行
          await post(
            Uri.parse(url),
            headers: RestClient.headers,
          );
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    return await _cookieManagement.send(request);
  }
}
