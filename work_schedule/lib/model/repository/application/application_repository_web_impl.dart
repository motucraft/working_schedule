import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/model/application_model.dart';
import '../rest_client.dart';
import '../unauthorized_exception.dart';
import 'application_repository.dart';

class ApplicationRepositoryWebImpl implements ApplicationRepository {
  final _restClient = RestClient();

  @override
  Future<List<ApplicationModel>> getApplications() async {
    var url = _restClient.baseUrl + '/applications';

    var response = await _restClient.client.get(
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
      http.Response response = await _restClient.client.get(
        Uri.parse(_restClient.baseUrl + '/authentication/refresh'),
        headers: RestClient.headers,
      );

      if (response.statusCode == 200) {
        // 再実行
        response = await _restClient.client.get(
          Uri.parse(url),
          headers: RestClient.headers,
        );

        if (response.statusCode == 200) {
          for (var res in jsonDecode(response.body)) {
            applications.add(ApplicationModel.fromJson(res));
          }
        }
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

    var response = await _restClient.client.get(
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
      http.Response response = await _restClient.client.get(
        Uri.parse(_restClient.baseUrl + '/authentication/refresh'),
        headers: RestClient.headers,
      );

      if (response.statusCode == 200) {
        // 再実行
        response = await _restClient.client.get(
          Uri.parse(url),
          headers: RestClient.headers,
        );

        if (response.statusCode == 200) {
          for (var res in jsonDecode(response.body)) {
            applications.add(ApplicationModel.fromJson(res));
          }
        }
      }
    }

    return applications;
  }

  @override
  Future<ApplicationModel> postApplication(
      ApplicationModel applicationModel) async {
    var url = _restClient.baseUrl + '/applications';
    var data = applicationModel.toJson();

    var response = await _restClient.client.post(
      Uri.parse(url),
      body: json.encode(data),
      headers: RestClient.headers,
    );

    var application;
    if (response.statusCode == 201) {
      application = ApplicationModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      // リフレッシュ
      http.Response response = await _restClient.client.get(
        Uri.parse(_restClient.baseUrl + '/authentication/refresh'),
        headers: RestClient.headers,
      );

      if (response.statusCode == 200) {
        // 再実行
        response = await _restClient.client.post(
          Uri.parse(url),
          body: json.encode(data),
          headers: RestClient.headers,
        );

        if (response.statusCode == 201) {
          application = ApplicationModel.fromJson(jsonDecode(response.body));
        }
      } else if (response.statusCode == 401) {
        throw UnauthorizedException('接続の有効期限が切れました。再度ログインしてください。');
      } else {
        print(response.statusCode);
        throw Exception('通信異常が発生しました。');
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

    var response = await _restClient.client.delete(
      Uri.parse(url),
      headers: RestClient.headers,
    );

    var application;
    if (response.statusCode == 200) {
      application = ApplicationModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      // リフレッシュ
      http.Response response = await _restClient.client.get(
        Uri.parse(_restClient.baseUrl + '/authentication/refresh'),
        headers: RestClient.headers,
      );

      if (response.statusCode == 200) {
        // 再実行
        response = await _restClient.client.delete(
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
}
