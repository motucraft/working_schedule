import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/model/master/leave_type_model.dart';
import '../../../model/repository/unauthorized_exception.dart';
import '../cookie_management.dart';
import '../rest_client.dart';
import 'master_repository.dart';

class MasterRepositoryNativeImpl extends http.BaseClient
    implements MasterRepository {
  final _restClient = RestClient();
  final _cookieManagement = CookieManagement();

  @override
  Future<List<LeaveTypeModel>> getLeaveTypes() async {
    var url = _restClient.baseUrl + '/leave-types';

    var response = await get(
      Uri.parse(url),
      headers: RestClient.headers,
    );

    var leaveTypes = <LeaveTypeModel>[];
    if (response.statusCode == 200) {
      for (var res in jsonDecode(response.body)) {
        print(res);
        leaveTypes.add(LeaveTypeModel.fromJson(res));
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
            leaveTypes.add(LeaveTypeModel.fromJson(res));
          }
        }
      } else if (response.statusCode == 401) {
        throw UnauthorizedException('接続の有効期限が切れました。再度ログインしてください。');
      }
    }

    return leaveTypes;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    return await _cookieManagement.send(request);
  }
}
