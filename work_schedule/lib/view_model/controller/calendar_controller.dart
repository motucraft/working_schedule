import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../provider.dart';
import '../state/calendar/calendar_state.dart';
import '../util/const.dart';

class CalendarController extends StateNotifier<CalendarState> {
  final ProviderReference ref;

  CalendarController(this.ref)
      : super(
          CalendarState(
            focusedDay: DateTime.now(),
            selectedDay: DateTime.now(),
          ),
        );

  /// カレンダーフォーマット設定
  void setCalendarFormat(CalendarFormat calendarFormat) {
    state = state.copyWith(calendarFormat: calendarFormat);
  }

  /// フォーカス日更新
  void setFocusedDay(DateTime focusedDay) {
    state = state.copyWith(focusedDay: focusedDay);
  }

  /// 選択日設定
  void setSelectedDay(DateTime selectedDay) {
    // 選択日
    state = state.copyWith(selectedDay: selectedDay);

    // 勤務日(テキスト)
    ref
        .read(applicationProvider.notifier)
        .state
        .workApplicationState
        .textEditingControllerWorkingDay
        .text = Const.dateFormat.format(state.selectedDay);
    // 休暇日(テキスト)
    ref
        .read(applicationProvider.notifier)
        .state
        .leaveApplicationState
        .textEditingControllerDayOff
        .text = Const.dateFormat.format(state.selectedDay);
  }
}
