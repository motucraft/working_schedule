import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../view/component/day_off.dart';
import '../../view/component/leave_type_picker.dart';

/// 予定申請(休暇)
class LeaveApplicationView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 500,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Column(
            children: [
              // 休暇日
              DayOff(),

              // 休暇区分
              LeaveTypePicker(),
            ],
          ),
        ),
      ),
    );
  }
}
