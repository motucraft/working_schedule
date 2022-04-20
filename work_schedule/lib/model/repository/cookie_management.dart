import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:http/http.dart' as http;

import 'rest_client.dart';

class CookieManagement {
  factory CookieManagement() {
    return _cookieManagement ??= CookieManagement._internal();
  }

  CookieManagement._internal();

  static CookieManagement? _cookieManagement;
  final _cookieJar = CookieJar();
  final _restClient = RestClient();
  // final Duration _timeout = Duration(seconds: 10);

  CookieJar get cookieJar => _cookieJar;

  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    print("${request.method} ${request.url}");

    final cookies =
        await _cookieJar.loadForRequest(Uri.parse(_restClient.baseUrl));
    // _removeExpiredCookies(cookies);

    String cookie = _getCookies(cookies);
    if (cookie.isNotEmpty) {
      request.headers[HttpHeaders.cookieHeader] = cookie;
    }

    final response;
    try {
      // final response = await _restClient.client.send(request).timeout(_timeout);
      response = await _restClient.client.send(request);
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      throw Exception('通信異常が発生しました。');
    }

    final cookieHeader = response.headers[HttpHeaders.setCookieHeader];
    _saveCookies(cookieHeader);

    return response;
  }

  void _removeExpiredCookies(List<Cookie> cookies) {
    cookies.removeWhere((cookie) {
      if (cookie.expires != null) {
        return cookie.expires!.isBefore(DateTime.now());
      }
      return false;
    });
  }

  String _getCookies(List<Cookie> cookies) {
    return cookies.map((cookie) => "${cookie.name}=${cookie.value}").join('; ');
  }

  void _saveCookies(String? cookieHeader) {
    if (cookieHeader == null || cookieHeader.isEmpty) {
      return;
    }

    // set-cookieが複数あった場合は、","でjoinして返ってくるので分割する必要がある
    final cookies = cookieHeader.split(",");
    if (cookies.isEmpty) {
      return;
    }

    _cookieJar.saveFromResponse(
      Uri.parse(_restClient.baseUrl),
      cookies.map((cookie) => Cookie.fromSetCookieValue(cookie)).toList(),
    );
  }
}
