import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view_model/controller/application_controller.dart';
import '../../view_model/provider.dart';
import '../../view_model/state/calendar/application_state.dart';
import '../../view_model/state/calendar/calendar_state.dart';
import '../../view_model/util/const.dart';
import '../../view_model/util/style.dart';

/// 勤務日
class WorkingDay extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final calendarState = useProvider(calendarProvider);
    final applicationController = useProvider(applicationProvider.notifier);
    final applicationState = useProvider(applicationProvider);

    return Column(
      children: [
        ListTile(
          leading: FaIcon(
            FontAwesomeIcons.calendarAlt,
          ),
          title: Text(
            '勤務日',
            style: Style.applicationItemStyle,
          ),
          horizontalTitleGap: 0,
        ),

        // 勤務日の選択
        Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 20.0, bottom: 20.0),
          child: GestureDetector(
            onTap: () => _selectWorkingDate(
              context: context,
              calendarState: calendarState,
              applicationState: applicationState,
              applicationController: applicationController,
            ),
            child: AbsorbPointer(
              child: TextField(
                controller: applicationState
                    .workApplicationState.textEditingControllerWorkingDay,
                // workApplicationState.textEditingControllerWorkingDay,
                style: TextStyle(fontSize: 24),
                decoration: InputDecoration(hintText: '選択してください'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _selectWorkingDate(
      {required BuildContext context,
      required CalendarState calendarState,
      required ApplicationState applicationState,
      required ApplicationController applicationController}) async {
    DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) {
        DateTime? tempPickedDate;
        return Container(
          height: 250,
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      child: Text('キャンセル'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoButton(
                      child: Text('本日'),
                      onPressed: () {
                        tempPickedDate = DateTime.now();
                        Navigator.of(context).pop(tempPickedDate);
                      },
                    ),
                    CupertinoButton(
                      child: Text('選択'),
                      onPressed: () {
                        Navigator.of(context).pop(tempPickedDate);
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
              ),
              Expanded(
                child: Container(
                  child: CupertinoTheme(
                    data: CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                        dateTimePickerTextStyle: TextStyle(
                          fontSize: 22,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                      ),
                    ),
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      // 初期値：Stateの勤務日(Controllerにて、カレンダー選択日で初期化される)
                      initialDateTime:
                          applicationState.workApplicationState.workingDay,
                      // 選択可能な年(min)：-1年
                      minimumYear: DateTime.now().year - 1,
                      // 選択可能な年(max)：+1年
                      maximumYear: DateTime.now().year + 1,
                      onDateTimeChanged: (DateTime dateTime) {
                        tempPickedDate = dateTime;
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    if (pickedDate != null &&
        pickedDate != applicationState.workApplicationState.workingDay) {
      var workStartTime = applicationState.workApplicationState.workStartTime;
      var workEndTime = applicationState.workApplicationState.workEndTime;

      // 勤務日、勤務開始時刻、勤務終了時刻を更新
      applicationController.setWorkApplicationState(
        applicationState.workApplicationState.copyWith(
          workingDay: pickedDate,
          workStartTime: DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            workStartTime.hour,
            workStartTime.minute,
            workStartTime.second,
          ),
          workEndTime: DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            workEndTime.hour,
            workEndTime.minute,
            workEndTime.second,
          ),
        ),
      );
      applicationState.workApplicationState.textEditingControllerWorkingDay
          .text = Const.dateFormat.format(pickedDate);
    }
  }
}
