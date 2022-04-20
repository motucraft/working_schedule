import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../../view/component/break_time.dart';
import '../../view/component/overtime_reason.dart';
import '../../view/component/working_time.dart';
import '../../view_model/provider.dart';
import '../component/working_day.dart';

/// 予定申請(勤務)
class WorkApplicationView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final applicationState = useProvider(applicationProvider);

    return GestureDetector(
      // 画面タップでフォーカスを外す(キーボードを閉じる)
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: KeyboardActions(
          config: KeyboardActionsConfig(
            keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
            keyboardBarColor: Colors.grey[300],
            nextFocus: true,
            actions: [
              KeyboardActionsItem(
                focusNode: applicationState
                    .workApplicationState.overtimeReasonFocusNode,
                toolbarButtons: [
                  (node) {
                    return GestureDetector(
                      onTap: () => node.unfocus(),
                      child: Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Text(
                          '完了',
                          style: TextStyle(fontSize: 16),
                        ),
                        // child: Icon(Icons.close),
                      ),
                    );
                  }
                ],
              ),
            ],
          ),
          child: SizedBox(
            height: 200,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Column(
                children: [
                  // 勤務日
                  WorkingDay(),

                  // 勤務時間(勤務開始時刻/勤務終了時刻)
                  WorkingTime(),

                  // 休憩時間
                  ..._getBreakTimes(),

                  // 時間外理由
                  OvertimeReason(),
                  const SizedBox(height: 30.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 休憩時間のウィジェットリストを生成します。
  List<Widget> _getBreakTimes() {
    final applicationState = useProvider(applicationProvider);

    List<Widget> breakTimeFields = [];
    for (int i = 0;
        i < applicationState.workApplicationState.breakTimeList.length;
        i++) {
      breakTimeFields.add(
          BreakTime(i, applicationState.workApplicationState.breakTimeList[i]));
    }

    return breakTimeFields;
  }
}
