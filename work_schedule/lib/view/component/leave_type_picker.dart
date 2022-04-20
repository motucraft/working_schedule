import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/model/master/leave_type_model.dart';
import '../../view_model/controller/application_controller.dart';
import '../../view_model/provider.dart';
import '../../view_model/state/calendar/application_state.dart';
import '../../view_model/state/master/master_state.dart';
import '../../view_model/util/style.dart';

class LeaveTypePicker extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final masterState = useProvider(masterProvider);
    final applicationController = useProvider(applicationProvider.notifier);
    final applicationState = useProvider(applicationProvider);

    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.fact_check_outlined),
          title: Text(
            '休暇区分',
            style: Style.applicationItemStyle,
          ),
          horizontalTitleGap: 0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 20.0, bottom: 20.0),
          child: GestureDetector(
            onTap: () {
              _selectLeaveType(context, masterState, applicationController,
                  applicationState);
            },
            child: AbsorbPointer(
              child: TextField(
                controller: applicationState
                    .leaveApplicationState.textEditingControllerLeaveType,
                style: TextStyle(fontSize: 24),
                decoration: InputDecoration(hintText: '選択してください'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _selectLeaveType(
      BuildContext context,
      MasterState masterState,
      ApplicationController applicationController,
      ApplicationState applicationState) async {
    int? pickedLeaveTypeIndex = await showModalBottomSheet<int>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) {
        int? tempPickedLeaveTypeIndex;
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
                      child: Text('選択'),
                      onPressed: () {
                        Navigator.of(context).pop(tempPickedLeaveTypeIndex);
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
                        pickerTextStyle: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                      ),
                    ),
                    child: CupertinoPicker(
                      itemExtent: 40,
                      scrollController: FixedExtentScrollController(
                        initialItem: applicationState
                            .leaveApplicationState.leaveTypeIndex,
                      ),
                      onSelectedItemChanged: (int index) {
                        tempPickedLeaveTypeIndex = index;
                      },
                      children:
                          masterState.leaveTypeList.map(_pickerItem).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    if (pickedLeaveTypeIndex != null &&
        pickedLeaveTypeIndex !=
            applicationState.leaveApplicationState.leaveTypeIndex) {
      // 休暇区分の状態を更新
      applicationController.setLeaveType(pickedLeaveTypeIndex);
    }
  }

  Widget _pickerItem(LeaveTypeModel leaveType) {
    return Center(
      child: Text(
        leaveType.leaveTypeName,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
