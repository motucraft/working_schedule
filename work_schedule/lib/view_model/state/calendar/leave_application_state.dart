import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_application_state.freezed.dart';

@freezed
abstract class LeaveApplicationState with _$LeaveApplicationState {
  const factory LeaveApplicationState({
    /// 休暇日
    required final DateTime dayOff,

    /// 休暇日(テキスト)
    required final TextEditingController textEditingControllerDayOff,

    /// 休暇区分インデックス
    required final int leaveTypeIndex,

    /// 休暇区分(テキスト)
    required final TextEditingController textEditingControllerLeaveType,
  }) = _LeaveApplicationState;
}
