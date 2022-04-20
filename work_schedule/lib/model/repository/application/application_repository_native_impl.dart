import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/application_model.dart';
import '../cookie_management.dart';
import '../rest_client.dart';
import '../unauthorized_exception.dart';
import 'application_repository.dart';

class ApplicationRepositoryNativeImpl extends http.BaseClient
    implements ApplicationRepository {
  final _restClient = RestClient();
  final _cookieManagement = CookieManagement();

  @override
  Future<List<ApplicationModel>> getApplications() async {
    var url = _restClient.baseUrl + '/applications';

    var response = await get(
      Uri.parse(url),
      headers: RestClient.headers,
    );

    var applications = <ApplicationModel>[];
    if (response.statusCode == 200) {
      for (var res in jsonDecode(response.body)) {
        print(res);
        applications.add(ApplicationModel.fromJson(res));
      }
    } else if (response.statusCode == 401) {
      // リフレッシュ
      http.Response response = await get(
        Uri.parse(_restClient.baseUrl + '/authentication/refresh'),
        headers: RestClient.headers,
      );

      if (response.statusCode == 200) {
        // 再実行
        response = await get(
          Uri.parse(url),
          headers: RestClient.headers,
        );

        if (response.statusCode == 200) {
          for (var res in jsonDecode(response.body)) {
            applications.add(ApplicationModel.fromJson(res));
          }
        }
      } else if (response.statusCode == 401) {
        throw UnauthorizedException('接続の有効期限が切れました。再度ログインしてください。');
      }
    }

    return applications;
  }

  @override
  Future<List<ApplicationModel>> getApplicationsByPeriod(
      String begin, String end) async {
    var url =
        _restClient.baseUrl + '/applications/period?begin={begin}&end={end}';

    url = url.replaceFirst('{begin}', begin).replaceFirst('{end}', end);
    print(url);

    var response = await get(
      Uri.parse(url),
      headers: RestClient.headers,
    );

    var applications = <ApplicationModel>[];
    if (response.statusCode == 200) {
      for (var res in jsonDecode(response.body)) {
        print(res);
        applications.add(ApplicationModel.fromJson(res));
      }
    } else if (response.statusCode == 401) {
      // リフレッシュ
      http.Response response = await get(
        Uri.parse(_restClient.baseUrl + '/authentication/refresh'),
        headers: RestClient.headers,
      );

      if (response.statusCode == 200) {
        // 再実行
        response = await get(
          Uri.parse(url),
          headers: RestClient.headers,
        );

        if (response.statusCode == 200) {
          for (var res in jsonDecode(response.body)) {
            applications.add(ApplicationModel.fromJson(res));
          }
        }
      } else if (response.statusCode == 401) {
        throw UnauthorizedException('接続の有効期限が切れました。再度ログインしてください。');
      }
    }

    return applications;
  }

  @override
  Future<ApplicationModel> postApplication(
      ApplicationModel applicationModel) async {
    var url = _restClient.baseUrl + '/applications';
    var data = applicationModel.toJson();

    var response = await post(
      Uri.parse(url),
      body: json.encode(data),
      headers: RestClient.headers,
    );

    var application;
    if (response.statusCode == 201) {
      application = ApplicationModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      // リフレッシュ
      http.Response response = await get(
        Uri.parse(_restClient.baseUrl + '/authentication/refresh'),
        headers: RestClient.headers,
      );

      if (response.statusCode == 200) {
        // 再実行
        response = await post(
          Uri.parse(url),
          body: json.encode(data),
          headers: RestClient.headers,
        );

        if (response.statusCode == 201) {
          application = ApplicationModel.fromJson(jsonDecode(response.body));
        }
      } else if (response.statusCode == 401) {
        throw UnauthorizedException('接続の有効期限が切れました。再度ログインしてください。');
      }
    }

    return application;
  }

  @override
  Future<ApplicationModel> deleteApplication(DateTime workingDay) async {
    var url = _restClient.baseUrl + '/applications/{workingDay}/delete';

    url = url.replaceFirst(
      '{workingDay}',
      workingDay.year.toString() +
          '-' +
          workingDay.month.toString().padLeft(2, '0') +
          '-' +
          workingDay.day.toString().padLeft(2, '0'),
    );
    print(url);

    var response = await delete(
      Uri.parse(url),
      headers: RestClient.headers,
    );

    var application;
    if (response.statusCode == 200) {
      application = ApplicationModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      // リフレッシュ
      http.Response response = await get(
        Uri.parse(_restClient.baseUrl + '/authentication/refresh'),
        headers: RestClient.headers,
      );

      if (response.statusCode == 200) {
        // 再実行
        response = await delete(
          Uri.parse(url),
          headers: RestClient.headers,
        );

        if (response.statusCode == 200) {
          application = ApplicationModel.fromJson(jsonDecode(response.body));
        }
      } else if (response.statusCode == 401) {
        throw UnauthorizedException('接続の有効期限が切れました。再度ログインしてください。');
      }
    }

    return application;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    return await _cookieManagement.send(request);
  }
}
