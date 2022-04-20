import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/model/master/leave_type_model.dart';

part 'master_state.freezed.dart';

@freezed
abstract class MasterState with _$MasterState {
  const factory MasterState({
    /// 休暇区分リスト
    @Default([]) final List<LeaveTypeModel> leaveTypeList,
  }) = _MasterState;
}
