import 'package:freezed_annotation/freezed_annotation.dart';

import 'leave_application_state.dart';
import 'work_application_state.dart';

part 'application_state.freezed.dart';

@freezed
abstract class ApplicationState with _$ApplicationState {
  const factory ApplicationState({
    /// スクロールアニメーション中
    @Default(false) final bool isScrolling,

    /// 勤務申請
    required final WorkApplicationState workApplicationState,

    /// 休暇申請
    required final LeaveApplicationState leaveApplicationState,
  }) = _ApplicationState;
}
