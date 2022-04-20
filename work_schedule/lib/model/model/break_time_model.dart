import 'package:freezed_annotation/freezed_annotation.dart';

part 'break_time_model.freezed.dart';

part 'break_time_model.g.dart';

@freezed
abstract class BreakTimeModel with _$BreakTimeModel {
  const factory BreakTimeModel({
    /// 休憩開始時刻
    required final DateTime breakStartTime,

    /// 休憩終了時刻
    required final DateTime breakEndTime,
  }) = _BreakTimeModel;

  factory BreakTimeModel.fromJson(Map<String, dynamic> json) =>
      _$BreakTimeModelFromJson(json);
}
