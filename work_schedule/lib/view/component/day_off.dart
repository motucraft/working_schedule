import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view_model/controller/application_controller.dart';
import '../../view_model/provider.dart';
import '../../view_model/state/calendar/application_state.dart';
import '../../view_model/util/const.dart';
import '../../view_model/util/style.dart';

/// 休暇日
class DayOff extends HookWidget {
  final calendarState = useProvider(calendarProvider);
  final applicationController = useProvider(applicationProvider.notifier);
  final applicationState = useProvider(applicationProvider);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: FaIcon(
            FontAwesomeIcons.calendarMinus,
          ),
          title: Text(
            '休暇日',
            style: Style.applicationItemStyle,
          ),
          horizontalTitleGap: 0,
        ),

        // 休暇日の選択
        Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 20.0, bottom: 20.0),
          child: GestureDetector(
            onTap: () => _selectDayOff(
              context: context,
              applicationState: applicationState,
              applicationController: applicationController,
            ),
            child: AbsorbPointer(
              child: TextField(
                controller: applicationState
                    .leaveApplicationState.textEditingControllerDayOff,
                style: TextStyle(fontSize: 24),
                decoration: InputDecoration(hintText: '選択してください'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _selectDayOff(
      {required BuildContext context,
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
                      // 初期値：Stateの休暇日(Controllerにて、カレンダー選択日で初期化される)
                      initialDateTime:
                          applicationState.leaveApplicationState.dayOff,
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
        pickedDate != applicationState.leaveApplicationState.dayOff) {
      // 休暇日を更新
      applicationController.setLeaveApplicationState(
          applicationState.leaveApplicationState.copyWith(dayOff: pickedDate));
      applicationState.leaveApplicationState.textEditingControllerDayOff.text =
          Const.dateFormat.format(pickedDate);
    }
  }
}
