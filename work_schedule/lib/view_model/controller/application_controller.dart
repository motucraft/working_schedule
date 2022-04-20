import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view_model/state/calendar/application_state.dart';
import '../../view_model/state/calendar/break_time_state.dart';
import '../provider.dart';
import '../state/calendar/leave_application_state.dart';
import '../state/calendar/work_application_state.dart';
import '../util/const.dart';

class ApplicationController extends StateNotifier<ApplicationState> {
  final ProviderReference ref;

  ApplicationController(this.ref)
      : super(ApplicationState(
          workApplicationState: WorkApplicationState(
            workingDay: Const.epochTime,
            textEditingControllerWorkingDay: TextEditingController(),
            workStartTime: Const.epochTime,
            defaultWorkStartTime: Const.epochTime,
            textEditingControllerWorkStartTime: TextEditingController(),
            workEndTime: Const.epochTime,
            defaultWorkEndTime: Const.epochTime,
            textEditingControllerWorkEndTime: TextEditingController(),
            breakTimeList: [],
            overtimeReason: TextEditingController(),
            overtimeReasonFocusNode: FocusNode(),
          ),
          leaveApplicationState: LeaveApplicationState(
            dayOff: Const.epochTime,
            textEditingControllerDayOff: TextEditingController(),
            leaveTypeIndex: 0,
            textEditingControllerLeaveType: TextEditingController(),
          ),
        )) {
    // 選択日
    var selectedDay = ref.read(calendarProvider.notifier).state.selectedDay;

    // 勤務日、勤務日(テキスト)をカレンダー選択日にて初期設定
    state = state.copyWith(
        workApplicationState:
            state.workApplicationState.copyWith(workingDay: selectedDay));
    state.workApplicationState.textEditingControllerWorkingDay.text =
        Const.dateFormat.format(selectedDay);
    // 休暇日、休暇日(テキスト)をカレンダー選択日にて初期設定
    state = state.copyWith(
        leaveApplicationState:
            state.leaveApplicationState.copyWith(dayOff: selectedDay));
    state.leaveApplicationState.textEditingControllerDayOff.text =
        Const.dateFormat.format(selectedDay);

    // TODO 勤務開始時刻の初期値を変更可能とする
    var defaultWorkStartTime =
        DateTime(selectedDay.year, selectedDay.month, selectedDay.day, 8, 40);
    // TODO 勤務終了時刻の初期値を変更可能とする
    var defaultWorkEndTime =
        DateTime(selectedDay.year, selectedDay.month, selectedDay.day, 17, 20);
    // TODO 休憩開始時刻、休憩終了時刻の初期値を変更可能とする
    var defaultBreakTimeStart =
        DateTime(selectedDay.year, selectedDay.month, selectedDay.day, 12, 00);
    var defaultBreakTimeEnd =
        DateTime(selectedDay.year, selectedDay.month, selectedDay.day, 13, 00);

    // 勤務開始時刻(テキスト)
    state.workApplicationState.textEditingControllerWorkStartTime.text =
        Const.timeFormat.format(defaultWorkStartTime);
    // 勤務終了時刻(テキスト)
    state.workApplicationState.textEditingControllerWorkEndTime.text =
        Const.timeFormat.format(defaultWorkEndTime);

    state = state.copyWith(
      workApplicationState: state.workApplicationState.copyWith(
        workStartTime: defaultWorkStartTime,
        workEndTime: defaultWorkEndTime,
        defaultWorkStartTime: defaultWorkStartTime,
        defaultWorkEndTime: defaultWorkEndTime,
        breakTimeList: [
          BreakTimeState(
            breakStartTime: defaultBreakTimeStart,
            breakEndTime: defaultBreakTimeEnd,
            defaultBreakStartTime: defaultBreakTimeStart,
            defaultBreakEndTime: defaultBreakTimeEnd,
            startTimeDisplay: TextEditingController(
              text: Const.timeFormat.format(defaultBreakTimeStart),
            ),
            endTimeDisplay: TextEditingController(
              text: Const.timeFormat.format(defaultBreakTimeEnd),
            ),
          )
        ],
      ),
    );

    // 休暇区分(テキスト)
    state.leaveApplicationState.textEditingControllerLeaveType.text = ref
        .read(masterProvider)
        .leaveTypeList[state.leaveApplicationState.leaveTypeIndex]
        .leaveTypeName;
  }

  /// スクロールアニメーションの現在値設定
  setIsScrolling(bool isScrolling) {
    state = state.copyWith(isScrolling: isScrolling);
  }

  setWorkApplicationState(WorkApplicationState workApplicationState) {
    state = state.copyWith(workApplicationState: workApplicationState);
  }

  setLeaveApplicationState(LeaveApplicationState leaveApplicationState) {
    state = state.copyWith(leaveApplicationState: leaveApplicationState);
  }

  /// 休憩開始時刻、休憩開始時刻(テキスト)設定
  setBreakStartTime(int index, DateTime breakStartTime) {
    // 対象インデックスの休憩時間状態を更新
    var breakTimeState = state.workApplicationState.breakTimeList[index]
        .copyWith(
            breakStartTime: breakStartTime,
            startTimeDisplay: TextEditingController(
                text: Const.timeFormat.format(breakStartTime)));
    state.workApplicationState.breakTimeList[index] = breakTimeState;

    // 更新した休憩時間リストを設定
    state = state.copyWith(
        workApplicationState: state.workApplicationState
            .copyWith(breakTimeList: state.workApplicationState.breakTimeList));
  }

  /// 休憩終了時刻、休憩終了時刻(テキスト)設定
  setBreakEndTime(int index, DateTime breakEndTime) {
    // 対象インデックスの休憩時間状態を更新
    var breakTimeState = state.workApplicationState.breakTimeList[index]
        .copyWith(
            breakEndTime: breakEndTime,
            endTimeDisplay: TextEditingController(
                text: Const.timeFormat.format(breakEndTime)));
    state.workApplicationState.breakTimeList[index] = breakTimeState;

    // 更新した休憩時間リストを設定
    state = state.copyWith(
        workApplicationState: state.workApplicationState
            .copyWith(breakTimeList: state.workApplicationState.breakTimeList));
  }

  /// 休暇区分設定
  setLeaveType(int leaveTypeIndex) {
    // 休暇区分インデックス設定
    state = state.copyWith(
        leaveApplicationState: state.leaveApplicationState
            .copyWith(leaveTypeIndex: leaveTypeIndex));

    // 休暇区分(テキスト)設定
    state.leaveApplicationState.textEditingControllerLeaveType.text =
        ref.read(masterProvider).leaveTypeList[leaveTypeIndex].leaveTypeName;
  }
}
