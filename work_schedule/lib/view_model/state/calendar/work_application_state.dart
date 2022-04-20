import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'break_time_state.dart';

part 'work_application_state.freezed.dart';

@freezed
abstract class WorkApplicationState with _$WorkApplicationState {
  const factory WorkApplicationState({
    /// 勤務日
    required final DateTime workingDay,

    /// 勤務日(テキスト)
    required final TextEditingController textEditingControllerWorkingDay,

    /// 勤務開始時刻
    required final DateTime workStartTime,

    /// 勤務開始時刻(デフォルト)
    required final DateTime defaultWorkStartTime,

    /// 勤務開始時刻(テキスト)
    required final TextEditingController textEditingControllerWorkStartTime,

    /// 勤務終了時刻
    required final DateTime workEndTime,

    /// 勤務終了時刻(デフォルト)
    required final DateTime defaultWorkEndTime,

    /// 勤務終了時刻(テキスト)
    required final TextEditingController textEditingControllerWorkEndTime,

    /// 休憩時間リスト
    required final List<BreakTimeState> breakTimeList,

    /// 時間外理由
    required final TextEditingController overtimeReason,

    /// 時間外理由のFocusNode
    required final FocusNode overtimeReasonFocusNode,
  }) = _WorkApplicationState;
}
