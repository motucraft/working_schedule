import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/model/master/leave_type_model.dart';
import '../../model/repository/master/master_repository.dart';
import '../../view_model/state/master/master_state.dart';

class MasterController extends StateNotifier<MasterState> {
  MasterController(this._masterRepository) : super(const MasterState());

  final MasterRepository _masterRepository;

  Future getLeaveTypes() async {
    var leaveTypeList = await _masterRepository.getLeaveTypes();
    if (leaveTypeList.length == 0) {
      throw Exception('休暇区分の取得に失敗しました。');
    }
    state = state.copyWith(leaveTypeList: leaveTypeList);
  }

  setLeaveTypeList(List<LeaveTypeModel> leaveTypeList) {
    state = state.copyWith(leaveTypeList: leaveTypeList);
  }

  /// 休暇区分のIDに対応する休暇区分名称を返却します。
  String getLeaveTypeName(String id) {
    return state.leaveTypeList
        .firstWhere((element) => element.id == id)
        .leaveTypeName;
  }

  /// 休暇区分名称に対応する休暇区分IDを返却します。
  String getLeaveTypeId(String leaveTypeName) {
    print(leaveTypeName);
    print('leaveTypeList=' + state.leaveTypeList.toString());
    print(state.leaveTypeList
        .firstWhere((element) => element.leaveTypeName == leaveTypeName));
    return state.leaveTypeList
        .firstWhere((element) => element.leaveTypeName == leaveTypeName)
        .id;
  }
}
