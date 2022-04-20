import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'break_time_state.freezed.dart';

@freezed
abstract class BreakTimeState with _$BreakTimeState {
  const factory BreakTimeState({
    /// 休憩開始時刻
    required final DateTime breakStartTime,

    /// 休憩終了時刻
    required final DateTime breakEndTime,

    /// 休憩開始時刻(デフォルト)
    required final DateTime defaultBreakStartTime,

    /// 休憩終了時刻(デフォルト)
    required final DateTime defaultBreakEndTime,

    /// 休憩開始時刻(テキスト)
    required final TextEditingController startTimeDisplay,

    /// 休憩終了時刻(テキスト)
    required final TextEditingController endTimeDisplay,
  }) = _BreakTimeState;
}
