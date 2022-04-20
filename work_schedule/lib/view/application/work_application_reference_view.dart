import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view_model/provider.dart';
import '../../view_model/util/const.dart';
import '../../view_model/util/style.dart';

/// 勤務予定申請参照ウィジェット
class WorkApplicationReferenceView extends HookWidget {
  WorkApplicationReferenceView(this._isCalendar);

  final _isCalendar;

  @override
  Widget build(BuildContext context) {
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
                ? MediaQuery.of(context).size.height * 0.8
                : MediaQuery.of(context).size.height,
            child: Column(
              children: [
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.calendarAlt,
                    color: Colors.blue,
                  ),
                  title: Text(
                    '勤務申請',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.blue,
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
                  leading: Icon(Icons.timer),
                  title: Text(
                    '勤務開始時刻',
                    style: Style.applicationItemStyle,
                  ),
                  horizontalTitleGap: 0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 50.0, right: 20.0, bottom: 20.0),
                  child: Text(
                    applicationModel.start != null
                        ? Const.timeFormat.format(applicationModel.start!)
                        : '',
                    style: TextStyle(
                      fontSize: 24,
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
                Padding(
                  padding: const EdgeInsets.only(
                      left: 50.0, right: 20.0, bottom: 20.0),
                  child: Text(
                    applicationModel.end != null
                        ? Const.timeFormat.format(applicationModel.end!)
                        : '',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.more_time),
                  title: Text(
                    '時間外理由',
                    style: Style.applicationItemStyle,
                  ),
                  horizontalTitleGap: 0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 50.0, right: 20.0, bottom: 20.0),
                  child: Text(
                    applicationModel.overtimeReason!,
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
