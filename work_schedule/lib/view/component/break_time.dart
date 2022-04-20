import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view_model/controller/application_controller.dart';
import '../../view_model/provider.dart';
import '../../view_model/state/calendar/application_state.dart';
import '../../view_model/state/calendar/break_time_state.dart';
import '../../view_model/util/const.dart';
import '../../view_model/util/picker_mode.dart';
import '../../view_model/util/style.dart';

/// 休憩時間
class BreakTime extends HookWidget {
  // 休憩時間の状態
  // Providerの休憩時間リストへインデックスでアクセスすると、
  // 休憩時間を追加/削除した際にインデックスがずれるため、
  // BreakTimeStateをコンストラクタで引き渡すようにしている。
  final BreakTimeState _breakTimeState;

  // 休憩時間リストのインデックス
  final int _index;

  BreakTime(this._index, this._breakTimeState);

  @override
  Widget build(BuildContext context) {
    final applicationController = useProvider(applicationProvider.notifier);
    final applicationState = useProvider(applicationProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.free_breakfast_outlined),
                  title: Text(
                    '休憩時間${_index + 1}',
                    style: Style.applicationItemStyle,
                  ),
                  horizontalTitleGap: 0,
                ),

                // 休憩時間(開始)
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Text(
                        '開始',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            _selectBreakTime(
                                context: context,
                                pickerMode: PickerMode.BreakTimeStart,
                                applicationController: applicationController,
                                applicationState: applicationState,
                                initialDateTime: _breakTimeState.breakStartTime,
                                index: _index);
                          },
                          child: AbsorbPointer(
                            child: TextField(
                              controller: _breakTimeState.startTimeDisplay,
                              style: TextStyle(
                                fontSize: 24,
                              ),
                              decoration: InputDecoration(
                                hintText: '選択してください',
                                hintStyle: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // 休憩時間（終了）
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Text(
                        '終了',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            _selectBreakTime(
                                context: context,
                                pickerMode: PickerMode.BreakTimeEnd,
                                applicationController: applicationController,
                                applicationState: applicationState,
                                initialDateTime: _breakTimeState.breakEndTime,
                                index: _index);
                          },
                          child: AbsorbPointer(
                            child: TextField(
                              controller: _breakTimeState.endTimeDisplay,
                              style: TextStyle(fontSize: 24),
                              decoration: InputDecoration(
                                hintText: '選択してください',
                                hintStyle: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 16,
          ),

          // 追加/削除ボタン
          _addRemoveButton(
              // リストの最後は追加ボタン
              _index ==
                  applicationState.workApplicationState.breakTimeList.length -
                      1,
              _index),
        ],
      ),
    );
  }

  // 休憩時間を選択
  _selectBreakTime(
      {required BuildContext context,
      required ApplicationController applicationController,
      required ApplicationState applicationState,
      required PickerMode pickerMode,
      required DateTime initialDateTime,
      required int index}) async {
    DateTime? pickedTime = await showModalBottomSheet<DateTime>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) {
        DateTime? tempPickedDate;

        // true : デフォルトで表示される一つ目の休憩時間ウィジェット
        bool isFirstBreakTimeWidget = (index ==
            applicationState.workApplicationState.breakTimeList.length - 1);

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
                        style: TextStyle(
                            fontSize: isFirstBreakTimeWidget ? 12 : 14),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoButton(
                      child: Text(
                        '現在時刻',
                        style: TextStyle(
                            fontSize: isFirstBreakTimeWidget ? 12 : 14),
                      ),
                      onPressed: () {
                        tempPickedDate = DateTime.now();
                        Navigator.of(context).pop(tempPickedDate);
                      },
                    ),
                    if (isFirstBreakTimeWidget)
                      // 最初の休憩時間のみデフォルト値へのリセットを可能とする
                      CupertinoButton(
                        child: Text(
                          'デフォルト',
                          style: TextStyle(fontSize: 12),
                        ),
                        onPressed: () {
                          if (PickerMode.BreakTimeStart == pickerMode) {
                            // 休憩開始時刻のデフォルトを設定
                            tempPickedDate = applicationState
                                .workApplicationState
                                .breakTimeList[index]
                                .defaultBreakStartTime;
                          } else {
                            // 休憩終了時刻のデフォルトを設定
                            tempPickedDate = applicationState
                                .workApplicationState
                                .breakTimeList[index]
                                .defaultBreakEndTime;
                          }
                          Navigator.of(context).pop(tempPickedDate);
                        },
                      ),
                    CupertinoButton(
                      child: Text(
                        '選択',
                        style: TextStyle(
                            fontSize: isFirstBreakTimeWidget ? 12 : 14),
                      ),
                      onPressed: () {
                        if (tempPickedDate == null) {
                          tempPickedDate = initialDateTime;
                        }
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
      var tempBreakTime = DateTime(
          applicationState.workApplicationState.workingDay.year,
          applicationState.workApplicationState.workingDay.month,
          applicationState.workApplicationState.workingDay.day,
          pickedTime.hour,
          pickedTime.minute);
      switch (pickerMode) {
        case PickerMode.BreakTimeStart:
          // 休憩開始時刻を更新
          applicationController.setBreakStartTime(index, tempBreakTime);
          break;
        case PickerMode.BreakTimeEnd:
          // 休憩終了時刻を更新
          applicationController.setBreakEndTime(index, tempBreakTime);
          break;
        default:
          // この例外が発生したらバグ
          throw Exception('Internal Error.');
      }
    }
  }

  Widget _addRemoveButton(bool add, int index) {
    final calendarState = useProvider(calendarProvider);
    final applicationController = useProvider(applicationProvider.notifier);
    final applicationState = useProvider(applicationProvider);

    // カレンダー選択日
    var selectedDay = calendarState.selectedDay;

    // TODO 休憩開始時刻、休憩終了時刻の初期値を変更可能とする
    var defaultBreakTimeStart =
        DateTime(selectedDay.year, selectedDay.month, selectedDay.day, 12, 00);
    var defaultBreakTimeEnd =
        DateTime(selectedDay.year, selectedDay.month, selectedDay.day, 13, 00);

    return InkWell(
      onTap: () {
        if (add) {
          // 先頭に追加
          applicationState.workApplicationState.breakTimeList.insert(
              0,
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
              ));
        } else {
          // 削除
          applicationState.workApplicationState.breakTimeList.removeAt(index);
        }

        // 予定申請(勤務)の状態を更新(この状態更新により再描画され、休憩時間が増減する)
        applicationController.setWorkApplicationState(
            applicationState.workApplicationState.copyWith(
                breakTimeList:
                    applicationState.workApplicationState.breakTimeList));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0, right: 20),
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: (add) ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            (add) ? Icons.add : Icons.remove,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
