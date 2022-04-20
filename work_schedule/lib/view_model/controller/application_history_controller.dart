import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/model/application_model.dart';
import '../../model/repository/application/application_repository.dart';
import '../../view_model/state/application_history/application_history_state.dart';
import '../../view_model/util/const.dart';

class ApplicationHistoryController
    extends StateNotifier<ApplicationHistoryState> {
  // アプリケーション履歴リポジトリ
  final ApplicationRepository _applicationRepository;

  ApplicationHistoryController(this._applicationRepository)
      : super(
          ApplicationHistoryState(
            monthFilter: DateTime.now(),
            textEditingControllerMonthFilter: TextEditingController(
                text: Const.yearAndMonth.format(DateTime.now())),
          ),
        );

  /// Monthフィルター設定
  setMonthFilter(DateTime monthFilter) {
    state = state.copyWith(monthFilter: monthFilter);
  }

  setApplicationHistory(ApplicationModel? applicationHistory) {
    state = state.copyWith(applicationHistory: applicationHistory);
  }

  setApplicationHistoryList(List<ApplicationModel> applicationHistoryList) {
    state = state.copyWith(applicationHistoryList: applicationHistoryList);
  }

  /// 指定した勤務日の申請履歴を削除
  deleteApplication(DateTime workingDay) async {
    await _applicationRepository.deleteApplication(workingDay);
  }
}
