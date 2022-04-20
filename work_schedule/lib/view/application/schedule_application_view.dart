import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view_model/controller/application_async_value_controller.dart';
import '../../view_model/provider.dart';
import 'application_async_view.dart';
import 'leave_application_view.dart';
import 'work_application_view.dart';

/// 予定申請
class ScheduleApplicationView extends HookWidget {
  final _tabs = [
    _ScheduleApplicationViewTabInfo(
      '勤務',
      WorkApplicationView(),
    ),
    _ScheduleApplicationViewTabInfo(
      '休暇',
      LeaveApplicationView(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final applicationController = useProvider(applicationProvider.notifier);
    final applicationState = useProvider(applicationProvider);
    final applicationAsyncValueController =
        useProvider(applicationAsyncValueProvider.notifier);
    final tabController = useTabController(initialLength: _tabs.length);

    tabController.animation!.addListener(() {
      if (tabController.animation!.value == 1.0 ||
          tabController.animation!.value == 0.0) {
        if (applicationState.isScrolling) {
          // スクロール完了
          applicationController.setIsScrolling(false);
        }
      } else {
        if (!applicationState.isScrolling) {
          // スクロール中
          applicationController.setIsScrolling(true);
        }
      }
    });

    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('予定申請'),
          bottom: PreferredSize(
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 2,
              tabs: _tabs.map((_ScheduleApplicationViewTabInfo tab) {
                return Container(
                  width: 80,
                  child: Tab(
                    text: tab.label,
                  ),
                );
              }).toList(),
            ),
            preferredSize: Size.fromHeight(30.0),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Icon(
                  Icons.check_circle_outline,
                  size: 30,
                ),
                onPressed: applicationState.isScrolling
                    // スクロール中は申請ボタンをタップできないようにする
                    ? null
                    : () {
                        if (tabController.index == 0) {
                          // 勤務予定申請
                          _confirmApplication(
                              context, applicationAsyncValueController, true);
                        } else {
                          // 休暇予定申請
                          _confirmApplication(
                              context, applicationAsyncValueController, false);
                        }
                      },
              ),
            ),
          ],
        ),
        body: TabBarView(
          controller: tabController,
          children: _tabs.map((tab) => tab.widget).toList(),
        ),
      ),
    );
  }

  // 確認ダイアログ
  Future<bool?> _confirmApplication(
      BuildContext context,
      ApplicationAsyncValueController applicationAsyncValueController,
      bool isWork) async {
    bool? res = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: isWork
              ? Text('勤務予定を申請します。よろしいですか？')
              : Text(
                  '休暇予定を申請します。よろしいですか？',
                  style: TextStyle(color: Colors.red),
                ),
          actions: [
            TextButton(
              child: Text(
                'キャンセル',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () async {
                // ダイアログから申請画面へ戻る
                Navigator.of(context).pop(true);
                if (isWork) {
                  // 勤務予定申請
                  applicationAsyncValueController.postWorkApplication();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ApplicationAsyncView(isWork),
                    ),
                  );
                } else {
                  // 休暇予定申請
                  applicationAsyncValueController.postLeaveApplication();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ApplicationAsyncView(isWork),
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );

    return res;
  }
}

class _ScheduleApplicationViewTabInfo {
  String label;
  Widget widget;

  _ScheduleApplicationViewTabInfo(this.label, this.widget);
}
