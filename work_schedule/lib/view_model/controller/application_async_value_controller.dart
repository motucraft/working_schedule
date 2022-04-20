import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/model/application_model.dart';
import '../../model/repository/application/application_repository.dart';
import '../../view_model/provider.dart';

class ApplicationAsyncValueController
    extends StateNotifier<AsyncValue<ApplicationModel>> {
  ApplicationAsyncValueController(this.ref, this._applicationRepository)
      : super(AsyncValue.loading());
  final ProviderReference ref;

  // 申請リポジトリ
  final ApplicationRepository _applicationRepository;

  /// 勤務申請
  postWorkApplication() async {
    var applicationModel = ApplicationModel(
      workingDay:
          ref.read(applicationProvider).workApplicationState.workingDay.toUtc(),
      applicationType: '0',
      userId: ref.read(userProvider).userId,
      start: ref
          .read(applicationProvider)
          .workApplicationState
          .workStartTime
          .toUtc(),
      end: ref
          .read(applicationProvider)
          .workApplicationState
          .workEndTime
          .toUtc(),
      overtimeReason: ref
          .read(applicationProvider)
          .workApplicationState
          .overtimeReason
          .text,
    );

    try {
      var responseModel =
          await _applicationRepository.postApplication(applicationModel);
      state = AsyncValue.data(
        // ローカルタイムゾーンへ戻す
        responseModel.copyWith(
          workingDay: responseModel.workingDay.toLocal(),
          start: responseModel.start!.toLocal(),
          end: responseModel.end!.toLocal(),
        ),
      );
    } catch (e) {
      state = AsyncValue.error(e);
      rethrow;
    }
  }

  /// 休暇申請
  postLeaveApplication() async {
    var applicationModel = ApplicationModel(
      workingDay:
          ref.read(applicationProvider).leaveApplicationState.dayOff.toUtc(),
      applicationType: '1',
      userId: ref.read(userProvider).userId,
      // leaveTypeId: ref
      //     .read(applicationProvider)
      //     .leaveApplicationState
      //     .leaveTypeIndex
      //     .toString(),
      leaveTypeId: ref.read(masterProvider.notifier).getLeaveTypeId(ref
          .read(applicationProvider)
          .leaveApplicationState
          .textEditingControllerLeaveType
          .text),
    );

    try {
      var responseModel =
          await _applicationRepository.postApplication(applicationModel);
      state = AsyncValue.data(
        // ローカルタイムゾーンへ戻す
        responseModel.copyWith(
          workingDay: responseModel.workingDay.toLocal(),
        ),
      );
    } catch (e) {
      state = AsyncValue.error(e);
      rethrow;
    }
  }
}
