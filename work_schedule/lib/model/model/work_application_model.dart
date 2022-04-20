import 'package:freezed_annotation/freezed_annotation.dart';

import 'break_time_model.dart';

part 'work_application_model.freezed.dart';

@freezed
abstract class WorkApplicationModel with _$WorkApplicationModel {
  const factory WorkApplicationModel({
    /// 申請対象日
    required final DateTime targetDate,

    /// 勤務開始時刻
    required final DateTime workStartTime,

    /// 勤務終了時刻
    required final DateTime workEndTime,

    /// 休憩時間
    required final List<BreakTimeModel> breakTimeList,

    /// 時間外理由
    required final String overtimeReason,
  }) = _WorkApplicationModel;
}
