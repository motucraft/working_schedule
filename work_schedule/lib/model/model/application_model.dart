import 'package:freezed_annotation/freezed_annotation.dart';

import 'break_time_model.dart';

part 'application_model.freezed.dart';
part 'application_model.g.dart';

/// 申請
@freezed
abstract class ApplicationModel with _$ApplicationModel {
  const factory ApplicationModel({
    /// [UTC]勤務日(または休暇日)
    required final DateTime workingDay,

    /// 申請タイプ(0:勤務 1:休暇)
    required final String applicationType,

    /// ユーザID
    @Default('') final String userId,

    /// [UTC]勤務開始時刻
    final DateTime? start,

    /// [UTC]勤務終了時刻
    final DateTime? end,

    /// 休憩時間リスト
    @Default([]) final List<BreakTimeModel>? breakTimeList,

    /// 時間外理由
    @Default('') final String? overtimeReason,

    /// 休暇区分ID
    @Default('') final String? leaveTypeId,
  }) = _ApplicationModel;

  factory ApplicationModel.fromJson(Map<String, dynamic> json) =>
      _$ApplicationModelFromJson(json);
}
