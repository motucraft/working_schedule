import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_model.freezed.dart';

@freezed
abstract class CalendarModel with _$CalendarModel {
  const factory CalendarModel({
    @Default([]) final List selectedEvents,

    // required final AnimationController animationController,
    // final CalendarController calendarController,
  }) = _CalendarModel;
}
