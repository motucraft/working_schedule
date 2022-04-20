import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/model/application_model.dart';
import '../../view/application/work_application_reference_view.dart';
import '../../view_model/provider.dart';
import '../../view_model/util/application_type.dart';
import 'leave_application_reference_view.dart';

class ApplicationDetail extends HookWidget {
  ApplicationDetail(this._applicationHistoryModel);

  final ApplicationModel _applicationHistoryModel;

  @override
  Widget build(BuildContext context) {
    final applicationHistoryAsyncValueController =
        useProvider(applicationHistoryAsyncValueProvider.notifier);

    useEffect(() {
      Future.microtask(() async {
        await applicationHistoryAsyncValueController
            .getApplicationByDay(_applicationHistoryModel.workingDay);
      });
    }, const []);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('申請履歴詳細'),
      ),
      body: Container(
        child: _createReferenceView(_applicationHistoryModel),
      ),
    );
  }

  // 申請内容の参照ウィジェットを生成する
  Widget _createReferenceView(ApplicationModel applicationHistoryModel) {
    if (ApplicationType.Work ==
        ApplicationTypeExtension.fromString(
            applicationHistoryModel.applicationType)) {
      // 勤務予定申請参照ウィジェット
      return WorkApplicationReferenceView(false);
    } else {
      // 休暇予定申請参照ウィジェット
      return LeaveApplicationReferenceView(false);
    }
  }
}
