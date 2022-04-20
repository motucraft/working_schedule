import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../view_model/provider.dart';
import '../view_model/util/bottom_tab_type.dart';
import 'application_history/application_history_view.dart';
import 'approval/approval_view.dart';
import 'calendar/calendar_view.dart';
import 'setting/setting_view.dart';

class WorkScheduleHomeView extends HookWidget {
  // ボトムナビゲーションにて表示するView
  final _views = [
    CalendarView(),
    ApplicationHistoryView(),
    ApprovalView(),
    SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomTabController = useProvider(bottomTableProvider.notifier);
    final bottomTableState = useProvider(bottomTableProvider);
    final authentication = useProvider(authenticationProvider);

    return authentication.when(
      data: (user) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.format_list_bulleted_sharp),
                label: '申請履歴',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.approval),
                label: '承認',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.build_circle_outlined),
                label: '設定',
              ),
            ],
            onTap: (int index) {
              // タブの状態(選択中のタブインデックス)を更新
              bottomTabController.setBottomTabType(BottomTabType.values[index]);
            },
            currentIndex: bottomTableState.bottomTabType.index,
          ),
          body: _views[bottomTableState.bottomTabType.index],
        );
      },
      loading: () {
        return Container(
          // child: CircularProgressIndicator(),
          child: Center(
            child: HeartbeatProgressIndicator(
              child: Text(
                'Loading...',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ),
          ),
        );
      },
      error: (e, stack) {
        print(e);
        print(stack);
        Fluttertoast.showToast(msg: 'ログインに失敗しました。');
        Navigator.pop(context);
        return Container();
      },
    );
  }
}
