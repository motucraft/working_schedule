import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view_model/provider.dart';
import '../../view_model/util/const.dart';
import '../../view_model/util/style.dart';

/// 休暇予定申請参照ウィジェット
class LeaveApplicationReferenceView extends HookWidget {
  LeaveApplicationReferenceView(this._isCalendar);

  final _isCalendar;

  @override
  Widget build(BuildContext context) {
    final masterController = useProvider(masterProvider.notifier);
    final applicationHistoryAsyncValue =
        useProvider(applicationHistoryAsyncValueProvider);

    return applicationHistoryAsyncValue.when(
      data: (applicationModel) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Container(
            height: _isCalendar
                ? MediaQuery.of(context).size.height * 0.5
                : MediaQuery.of(context).size.height,
            child: Column(
              children: [
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.calendarMinus,
                    color: Colors.red,
                  ),
                  title: Text(
                    '休暇申請',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.red,
                    ),
                  ),
                  horizontalTitleGap: 0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 50.0, right: 20.0, bottom: 20.0),
                  child: Text(
                    Const.dateFormat.format(applicationModel.workingDay),
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.fact_check_outlined),
                  title: Text(
                    '休暇区分',
                    style: Style.applicationItemStyle,
                  ),
                  horizontalTitleGap: 0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 50.0, right: 20.0, bottom: 20.0),
                  child: Text(
                    masterController
                        .getLeaveTypeName(applicationModel.leaveTypeId!),
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      error: (e, stack) {
        return Container();
      },
    );
  }
}
