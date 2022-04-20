import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/user_model.dart';
import 'authentication_repository.dart';
import '../rest_client.dart';

class AuthenticationRepositoryWebImpl implements AuthenticationRepository {
  final _restClient = RestClient();

  @override
  Future<UserModel> login(String userId, String password) async {
    http.Response response = await _restClient.client.post(
      Uri.parse(_restClient.baseUrl + '/authentication/login'),
      body: json.encode({'userId': userId, 'password': password}),
      headers: RestClient.headers,
    );

    UserModel user = UserModel();
    if (response.statusCode == 200) {
      // print(await _client.cookieJar.loadForRequest(Uri.parse(_client.baseUrl)));

      user = UserModel.fromJson(jsonDecode(response.body));

      // IDをキャッシュ
      _restClient.id = user.id!;
    }

    return user;
  }

  @override
  logout() async {
    var url = _restClient.baseUrl + '/authentication/logout';
    // var data = {'id': 1};

    try {
      // ログアウト
      http.Response response = await _restClient.client.post(
        Uri.parse(url),
        // body: json.encode(data),
        headers: RestClient.headers,
      );

      if (response.statusCode == 401) {
        // リフレッシュ
        // http.Response response = await _restClient.refresh();
        http.Response response = await _restClient.client.get(
            Uri.parse(_restClient.baseUrl + '/authentication/refresh'),
            headers: RestClient.headers);

        if (response.statusCode == 200) {
          // 再実行
          await _restClient.client.post(
            Uri.parse(url),
            // body: json.encode(data),
            headers: RestClient.headers,
          );
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
