import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../model/repository/unauthorized_exception.dart';
import '../../view_model/provider.dart';

class ApplicationAsyncView extends HookWidget {
  ApplicationAsyncView(this._isWork);

  final bool _isWork;

  @override
  Widget build(BuildContext context) {
    final applicationAsyncValueController =
        useProvider(applicationAsyncValueProvider);
    final calendarState = useProvider(calendarProvider);
    final applicationHistoryAsyncValueController =
        useProvider(applicationHistoryAsyncValueProvider.notifier);
    final applicationHistoryListAsyncValueController =
        useProvider(applicationHistoryListAsyncValueProvider.notifier);

    return applicationAsyncValueController.when(
      data: (applicationModel) {
        WidgetsBinding.instance!.addPostFrameCallback((_) async {
          final dialog;
          if (_isWork) {
            dialog = AwesomeDialog(
              context: context,
              animType: AnimType.LEFTSLIDE,
              headerAnimationLoop: false,
              dialogType: DialogType.SUCCES,
              title: 'Success',
              desc: '勤務予定を申請しました。',
              btnOkIcon: Icons.check_circle,
              autoHide: Duration(seconds: 2),
            );
          } else {
            dialog = AwesomeDialog(
              context: context,
              animType: AnimType.LEFTSLIDE,
              headerAnimationLoop: false,
              dialogType: DialogType.SUCCES,
              title: 'Success',
              desc: '休暇予定を申請しました。',
              btnOkIcon: Icons.check_circle,
              autoHide: Duration(seconds: 2),
            );
          }

          await dialog.show();

          // 申請後、カレンダー画面へ戻ったときのイベント表示のための申請履歴取得
          var targetDay = DateTime(calendarState.selectedDay.year,
              calendarState.selectedDay.month, calendarState.selectedDay.day);
          applicationHistoryListAsyncValueController
              .getApplicationsByThreeMonth(targetDay);
          applicationHistoryAsyncValueController.getApplicationByDay(targetDay);

          // ダイアログから申請画面へ戻す
          Navigator.of(context).pop();
          // カレンダー画面へ戻す
          Navigator.of(context).pop();
        });

        return Container();
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
        if (e is UnauthorizedException) {
          Fluttertoast.showToast(msg: e.toString());
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            // ログイン画面へ戻す
            Navigator.of(context).popUntil((route) => route.isFirst);
          });
        } else {
          Fluttertoast.showToast(msg: '通信異常が発生しました。');
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            // ダイアログから申請画面へ戻す
            Navigator.of(context).pop();
            // カレンダー画面へ戻す
            Navigator.of(context).pop();
          });
        }
        return Container();
      },
    );
  }
}
