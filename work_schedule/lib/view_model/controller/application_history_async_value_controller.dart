import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/model/application_model.dart';
import '../../model/repository/application/application_repository.dart';
import '../../view_model/provider.dart';

class ApplicationHistoryAsyncValueController
    extends StateNotifier<AsyncValue<ApplicationModel>> {
  ApplicationHistoryAsyncValueController(this._ref, this._applicationRepository)
      : super(AsyncValue.loading());

  final ProviderReference _ref;
  final ApplicationRepository _applicationRepository;

  /// 指定した日の申請履歴を取得
  Future getApplicationByDay(DateTime target) async {
    if (target.isUtc) {
      // この例外が発生したらバグ
      throw Exception('ローカルタイムゾーンを指定してください。');
    }

    var targetDay = target.toIso8601String() + _getTimeZoneOffset(target);

    try {
      // 申請履歴リスト
      var applicationsList =
          await _applicationRepository.getApplicationsByPeriod(
        targetDay,
        targetDay,
      );

      // ローカルタイムゾーンへ変換
      applicationsList = _toLocalTimeZone(applicationsList);

      if (applicationsList.length != 0) {
        _ref
            .read(applicationHistoryProvider.notifier)
            .setApplicationHistory(applicationsList.first);
        print('AsyncValue');
        state = AsyncValue.data(applicationsList.first);
      } else {
        _ref
            .read(applicationHistoryProvider.notifier)
            .setApplicationHistory(null);
      }
    } catch (e) {
      state = AsyncValue.error(e);
      rethrow;
    }
  }

  // タイムゾーンオフセット生成
  String _getTimeZoneOffset(DateTime dataTime) {
    return _getTimeZoneOffsetSign(dataTime) +
        dataTime.timeZoneOffset.inHours.toString().padLeft(2, '0') +
        ':' +
        dataTime.timeZoneOffset.inMinutes
            .remainder(60)
            .toString()
            .padLeft(2, '0');
  }

  // タイムゾーンオフセットの符号生成
  String _getTimeZoneOffsetSign(DateTime dataTime) {
    if (dataTime.timeZoneOffset.isNegative) {
      return '-';
    } else {
      // '+'はURLエンコードが必要
      return '%2B';
    }
  }

  // ローカルタイムゾーンへ変換
  List<ApplicationModel> _toLocalTimeZone(
      List<ApplicationModel> applicationsList) {
    return applicationsList
        .map(
          (model) => model.copyWith(
            workingDay: model.workingDay.toLocal(),
            start: model.start != null ? model.start!.toLocal() : null,
            end: model.end != null ? model.end!.toLocal() : null,
          ),
        )
        .toList();
  }
}
