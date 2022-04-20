import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../model/model/application_model.dart';
import '../../view/application/leave_application_reference_view.dart';
import '../../view/application/work_application_reference_view.dart';
import '../../view_model/controller/application_history_async_value_controller.dart';
import '../../view_model/controller/application_history_list_async_value_controller.dart';
import '../../view_model/provider.dart';
import '../../view_model/state/application_history/application_history_state.dart';
import '../../view_model/util/application_type.dart';
import '../application/schedule_application_view.dart';

class CalendarView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(context),
      body: _createCalendar(context),
      floatingActionButton: _createFloatingActionButton(context),
    );
  }

  PreferredSizeWidget _createAppBar(BuildContext context) {
    final calendarController = useProvider(calendarProvider.notifier);
    final authenticationController =
        useProvider(authenticationProvider.notifier);
    final applicationHistoryListAsyncValueController =
        useProvider(applicationHistoryListAsyncValueProvider.notifier);
    final applicationHistoryAsyncValueController =
        useProvider(applicationHistoryAsyncValueProvider.notifier);

    return AppBar(
      centerTitle: true,
      title: Text('勤務予定'),
      leading: Transform.scale(
        scale: 1.8,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: IconButton(
            icon: Image.asset('assets/images/rabbit.gif'),
            onPressed: () {
              var now = DateTime.now();
              // リフレッシュ：本日をフォーカス
              calendarController.setFocusedDay(now);
              // リフレッシュ：本日を選択
              calendarController.setSelectedDay(now);
              // 本日の申請履歴取得
              _getApplicationByDay(applicationHistoryAsyncValueController, now);
              // 3ヶ月分の申請履歴取得
              _getApplicationsByThreeMonth(
                  applicationHistoryListAsyncValueController, now);
            },
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.exit_to_app,
            size: 30,
          ),
          onPressed: () {
            // ログアウト
            // ログアウト処理の完了を待たずにログイン画面へ戻す。
            // そのため、ここではawaitしない。
            authenticationController.logout();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget _createCalendar(BuildContext context) {
    final calendarController = useProvider(calendarProvider.notifier);
    final calendarState = useProvider(calendarProvider);
    final applicationHistoryState = useProvider(applicationHistoryProvider);
    final applicationHistoryAsyncValueController =
        useProvider(applicationHistoryAsyncValueProvider.notifier);
    final applicationHistoryListAsyncValueController =
        useProvider(applicationHistoryListAsyncValueProvider.notifier);

    var now = DateTime.now();

    return Column(
      children: [
        TableCalendar<ApplicationModel>(
          locale: 'ja_JP',
          // カレンダー表示期間(first)
          firstDay: now.subtract(Duration(days: 365)),
          // カレンダー表示期間(last)
          lastDay: now.add(Duration(days: 365)),
          focusedDay: calendarState.focusedDay,
          selectedDayPredicate: (day) =>
              isSameDay(calendarState.selectedDay, day),
          calendarFormat: calendarState.calendarFormat,
          rangeSelectionMode: RangeSelectionMode.disabled,
          eventLoader: (DateTime day) {
            return _getEventsForDay(applicationHistoryState, day);
          },
          calendarStyle: CalendarStyle(
            // 選択日のデコレーション
            selectedDecoration: const BoxDecoration(
              color: const Color(0xFFFF7043), // Material deepOrange[400]
              shape: BoxShape.circle,
            ),
            // "本日"のデコレーション
            todayDecoration: const BoxDecoration(
              color: const Color(0xFFFFAB91), // Material deepOrange[200]
              shape: BoxShape.circle,
            ),
            outsideDaysVisible: false,
            markerDecoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              shape: BoxShape.circle,
            ),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            // 曜日の平日スタイル
            weekdayStyle: const TextStyle(
              fontSize: 13,
              color: const Color(0xFF616161), // Material grey[700]
            ),
            // 曜日の週末スタイル
            weekendStyle: const TextStyle(
              fontSize: 13,
              color: const Color(0xFFF44336), // Material red[500]
            ),
          ),
          headerStyle: HeaderStyle(
            formatButtonTextStyle:
                TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
            formatButtonDecoration: BoxDecoration(
              color: Colors.deepOrange[400],
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          onDaySelected: (selectedDay, focusedDay) {
            calendarController.setFocusedDay(focusedDay);
            calendarController.setSelectedDay(selectedDay);

            // 選択日の申請履歴取得
            _getApplicationByDay(
                applicationHistoryAsyncValueController, selectedDay);
          },
          onFormatChanged: (format) {
            print('onFormatChanged focusedDay=' +
                calendarState.focusedDay.toString());
            if (calendarState.calendarFormat != format) {
              calendarController.setCalendarFormat(format);
            }
          },
          onPageChanged: (focusedDay) {
            print('onPageChanged focusedDay=$focusedDay');
            calendarController.setFocusedDay(focusedDay);
            calendarController.setSelectedDay(focusedDay);
            // 選択日の申請履歴取得
            _getApplicationByDay(
                applicationHistoryAsyncValueController, focusedDay);

            // 3ヶ月分の申請履歴を取得
            _getApplicationsByThreeMonth(
                applicationHistoryListAsyncValueController, focusedDay);
          },
          onDayLongPressed: (selectedDay, focusedDay) {
            calendarController.setFocusedDay(focusedDay);
            calendarController.setSelectedDay(selectedDay);

            // 選択日の申請履歴取得
            _getApplicationByDay(
                applicationHistoryAsyncValueController, selectedDay);

            // 予定申請画面へ
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScheduleApplicationView(),
              ),
            );
          },
          onCalendarCreated: (pageController) {
            print('onCalendarCreated');
            // 選択日の申請履歴取得
            _getApplicationByDay(applicationHistoryAsyncValueController,
                calendarState.selectedDay);
            // 3ヶ月分の申請履歴を取得
            _getApplicationsByThreeMonth(applicationHistoryListAsyncValueController,
                calendarState.focusedDay);
          },
        ),
        Divider(color: Theme.of(context).primaryColor),
        Expanded(
          child: _createReferenceView(applicationHistoryState),
        ),
      ],
    );
  }

  // 対象日の申請履歴取得
  Future _getApplicationByDay(
      ApplicationHistoryAsyncValueController
          applicationHistoryAsyncValueController,
      DateTime targetDay) async {
    // selectedDay, focusedDayはUTCのため、ローカルタイムゾーンでDateTimeを生成する
    var period = DateTime(targetDay.year, targetDay.month, targetDay.day);
    await applicationHistoryAsyncValueController.getApplicationByDay(period);
  }

  Future _getApplicationsByThreeMonth(
      ApplicationHistoryListAsyncValueController
          applicationHistoryListAsyncValueController,
      DateTime targetDay) async {
    // selectedDay, focusedDayはUTCのため、ローカルタイムゾーンでDateTimeを生成する
    var period = DateTime(targetDay.year, targetDay.month, targetDay.day);
    await applicationHistoryListAsyncValueController
        .getApplicationsByThreeMonth(period);
  }

  List<ApplicationModel> _getEventsForDay(
      ApplicationHistoryState applicationHistoryState, DateTime day) {
    // 申請履歴リストから一致する日を返却
    // calendar_tableのインタフェース起因でList<>で返却するが、
    // 1日1申請の思想のため該当する場合でも1件だけとなる。
    return applicationHistoryState.applicationHistoryList
        .where((element) => isSameDay(element.workingDay, day))
        .toList();
  }

  Widget _createFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xFFFF7043), // Material deepOrange[400]
      splashColor: Colors.grey,
      child: Icon(
        Icons.edit_outlined,
      ),
      onPressed: () {
        // 予定申請画面へ
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScheduleApplicationView(),
          ),
        );
      },
    );
  }

  // 申請内容の参照ウィジェットを生成する
  Widget _createReferenceView(ApplicationHistoryState applicationHistoryState) {
    if (applicationHistoryState.applicationHistory == null) {
      // 申請履歴が存在しない日の場合はContainerを返却
      return Container();
    }

    if (ApplicationType.Work ==
        ApplicationTypeExtension.fromString(
            applicationHistoryState.applicationHistory!.applicationType)) {
      // 勤務予定申請参照ウィジェット
      return WorkApplicationReferenceView(true);
    } else {
      // 休暇予定申請参照ウィジェット
      return LeaveApplicationReferenceView(true);
    }
  }
}
