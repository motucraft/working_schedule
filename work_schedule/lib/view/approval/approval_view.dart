import 'package:flutter/material.dart';

import 'approval_history_view.dart';
import 'unapproved_view.dart';

class ApprovalView extends StatelessWidget {
  final _tabs = [
    _ApprovalViewTabInfo(
      '未承認',
      UnapprovedView(),
    ),
    _ApprovalViewTabInfo(
      '承認履歴',
      ApprovalHistoryView(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text('承認'),
          bottom: PreferredSize(
            child: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 2,
              tabs: _tabs.map((_ApprovalViewTabInfo tab) {
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
        ),
        body: TabBarView(children: _tabs.map((tab) => tab.widget).toList()),
      ),
    );
  }
}

class _ApprovalViewTabInfo {
  String label;
  Widget widget;

  _ApprovalViewTabInfo(this.label, this.widget);
}
