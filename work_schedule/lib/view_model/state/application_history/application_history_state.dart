import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/model/application_model.dart';

part 'application_history_state.freezed.dart';

@freezed
abstract class ApplicationHistoryState with _$ApplicationHistoryState {
  const factory ApplicationHistoryState({
    /// 申請履歴リスト
    @Default([]) final List<ApplicationModel> applicationHistoryList,

    /// 申請履歴
    final ApplicationModel? applicationHistory,

    /// Monthフィルター
    required final DateTime monthFilter,

    /// 勤務日(テキスト)
    required final TextEditingController textEditingControllerMonthFilter,
  }) = _ApplicationHistoryState;
}
