import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_application_model.freezed.dart';

@freezed
abstract class LeaveApplicationModel with _$LeaveApplicationModel {
  const factory LeaveApplicationModel({
    /// 申請対象日
    required final DateTime targetDate,

    /// 休暇区分
    // TODO
  }) = _LeaveApplicationModel;
}
