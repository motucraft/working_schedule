import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/model/master/leave_type_model.dart';
import '../../../model/repository/master/master_repository.dart';
import '../rest_client.dart';

class MasterRepositoryWebImpl implements MasterRepository {
  final _restClient = RestClient();

  @override
  Future<List<LeaveTypeModel>> getLeaveTypes() async {
    var url = _restClient.baseUrl + '/leave-types';

    var response = await _restClient.client.get(
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
            leaveTypes.add(LeaveTypeModel.fromJson(res));
          }
        }
      }
    }

    return leaveTypes;
  }
}
