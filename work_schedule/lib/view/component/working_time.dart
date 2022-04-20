import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view_model/controller/application_controller.dart';
import '../../view_model/provider.dart';
import '../../view_model/state/calendar/application_state.dart';
import '../../view_model/util/const.dart';
import '../../view_model/util/picker_mode.dart';
import '../../view_model/util/style.dart';

/// 勤務時間(勤務開始時刻/勤務終了時刻)
class WorkingTime extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final applicationController = useProvider(applicationProvider.notifier);
    final applicationState = useProvider(applicationProvider);

    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.timer),
          title: Text(
            '勤務開始時刻',
            style: Style.applicationItemStyle,
          ),
          horizontalTitleGap: 0,
        ),

        // 勤務開始時刻の選択
        Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 20.0, bottom: 20.0),
          child: GestureDetector(
            onTap: () => _selectTime(
              context: context,
              pickerMode: PickerMode.WorkStartTime,
              initialDateTime:
                  applicationState.workApplicationState.workStartTime,
              applicationController: applicationController,
              applicationState: applicationState,
            ),
            child: AbsorbPointer(
              child: TextField(
                controller: applicationState
                    .workApplicationState.textEditingControllerWorkStartTime,
                style: TextStyle(fontSize: 24),
                decoration: InputDecoration(hintText: '選択してください'),
              ),
            ),
          ),
        ),

        ListTile(
          leading: Icon(Icons.timer),
          title: Text(
            '勤務終了時刻',
            style: Style.applicationItemStyle,
          ),
          horizontalTitleGap: 0,
        ),

        // 勤務終了時刻の選択
        Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 20.0, bottom: 20.0),
          child: GestureDetector(
            onTap: () => _selectTime(
              context: context,
              pickerMode: PickerMode.WorkEndTime,
              initialDateTime:
                  applicationState.workApplicationState.workEndTime,
              applicationController: applicationController,
              applicationState: applicationState,
            ),
            child: AbsorbPointer(
              child: TextField(
                controller: applicationState
                    .workApplicationState.textEditingControllerWorkEndTime,
                style: TextStyle(fontSize: 24),
                decoration: InputDecoration(hintText: '選択してください'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _selectTime(
      {required BuildContext context,
      required PickerMode pickerMode,
      required DateTime initialDateTime,
      required ApplicationController applicationController,
      required ApplicationState applicationState}) async {
    DateTime? pickedTime = await showModalBottomSheet<DateTime>(
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
                      child: Text(
                        'キャンセル',
                        style: TextStyle(fontSize: 12),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoButton(
                      child: Text(
                        '現在時刻',
                        style: TextStyle(fontSize: 12),
                      ),
                      onPressed: () {
                        tempPickedDate = DateTime.now();
                        Navigator.of(context).pop(tempPickedDate);
                      },
                    ),
                    CupertinoButton(
                      child: Text(
                        'デフォルト',
                        style: TextStyle(fontSize: 12),
                      ),
                      onPressed: () {
                        if (PickerMode.WorkStartTime == pickerMode) {
                          // 勤務開始時刻のデフォルトを設定
                          tempPickedDate = applicationState
                              .workApplicationState.defaultWorkStartTime;
                        } else {
                          // 勤務終了時刻のデフォルトを設定
                          tempPickedDate = applicationState
                              .workApplicationState.defaultWorkEndTime;
                        }
                        Navigator.of(context).pop(tempPickedDate);
                      },
                    ),
                    CupertinoButton(
                      child: Text(
                        '選択',
                        style: TextStyle(fontSize: 12),
                      ),
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
                      use24hFormat: true,
                      initialDateTime: initialDateTime,
                      mode: CupertinoDatePickerMode.time,
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

    if (pickedTime != null && pickedTime != initialDateTime) {
      switch (pickerMode) {
        case PickerMode.WorkStartTime:
          // 勤務開始時刻を更新
          applicationController.setWorkApplicationState(applicationState
              .workApplicationState
              .copyWith(workStartTime: pickedTime));
          applicationState
              .workApplicationState
              .textEditingControllerWorkStartTime
              .text = Const.timeFormat.format(pickedTime);
          break;
        case PickerMode.WorkEndTime:
          // 勤務終了時刻を更新
          applicationController.setWorkApplicationState(applicationState
              .workApplicationState
              .copyWith(workEndTime: pickedTime));
          applicationState.workApplicationState.textEditingControllerWorkEndTime
              .text = Const.timeFormat.format(pickedTime);
          break;
        default:
          // この例外が発生したらバグ
          throw Exception('Internal Error.');
      }
    }
  }
}
