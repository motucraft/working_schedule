import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import '../../view_model/controller/application_history_controller.dart';
import '../../view_model/controller/application_history_list_async_value_controller.dart';
import '../../view_model/provider.dart';
import '../../view_model/state/application_history/application_history_state.dart';
import '../../view_model/util/const.dart';

class MonthPickerFilter extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final applicationHistoryController =
        useProvider(applicationHistoryProvider.notifier);
    final applicationHistoryState = useProvider(applicationHistoryProvider);
    final applicationHistoryListAsyncValueController =
        useProvider(applicationHistoryListAsyncValueProvider.notifier);

    return GestureDetector(
      onTap: () => _selectMonth(
        context,
        applicationHistoryController,
        applicationHistoryListAsyncValueController,
        applicationHistoryState,
      ),
      child: AbsorbPointer(
        child: TextField(
          controller: applicationHistoryState.textEditingControllerMonthFilter,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
          decoration: InputDecoration(hintText: '選択してください'),
        ),
      ),
    );
  }

  _selectMonth(
      BuildContext context,
      ApplicationHistoryController applicationHistoryController,
      ApplicationHistoryListAsyncValueController
          applicationHistoryListAsyncValueController,
      ApplicationHistoryState applicationHistoryState) async {
    DateTime monthFilter = applicationHistoryState.monthFilter;
    DateTime? selectedMonth = await showMonthPicker(
      context: context,
      initialDate: applicationHistoryState.monthFilter,
    );

    if (selectedMonth != null &&
        (selectedMonth.year != monthFilter.year ||
            selectedMonth.month != monthFilter.month)) {
      // Monthフィルターを更新
      applicationHistoryController.setMonthFilter(selectedMonth);
      applicationHistoryState.textEditingControllerMonthFilter.text =
          Const.yearAndMonth.format(selectedMonth);

      // 選択した月の申請履歴を取得する
      applicationHistoryListAsyncValueController
          .getApplicationsByMonth(selectedMonth);
    }
  }
}
