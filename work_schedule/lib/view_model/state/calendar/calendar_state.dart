import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:table_calendar/table_calendar.dart';

part 'calendar_state.freezed.dart';

@freezed
abstract class CalendarState with _$CalendarState {
  const factory CalendarState({
    /// カレンダーフォーマット
    @Default(CalendarFormat.month) final CalendarFormat calendarFormat,

    /// フォーカス日
    required final DateTime focusedDay,

    /// カレンダー選択日
    required final DateTime selectedDay,
  }) = _CalendarState;
}
