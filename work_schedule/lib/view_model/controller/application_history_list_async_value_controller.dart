import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/model/application_model.dart';
import '../../model/repository/application/application_repository.dart';
import '../provider.dart';

class ApplicationHistoryListAsyncValueController
    extends StateNotifier<AsyncValue<List<ApplicationModel>>> {
  ApplicationHistoryListAsyncValueController(
      this._ref, this._applicationRepository)
      : super(AsyncValue.loading());

  final ProviderReference _ref;
  final ApplicationRepository _applicationRepository;

  /// 申請履歴(全件)取得
  @Deprecated('全件取得は不要の想定')
  getApplications() async {
    // 申請履歴リスト
    var applicationsList = await _applicationRepository.getApplications();
    // ローカルタイムゾーンへ変換
    applicationsList = applicationsList
        .map(
          (model) => model.copyWith(
            workingDay: model.workingDay.toLocal(),
            start: model.start != null ? model.start!.toLocal() : null,
            end: model.end != null ? model.end!.toLocal() : null,
          ),
        )
        .toList();

    _ref
        .read(applicationHistoryProvider.notifier)
        .setApplicationHistoryList(applicationsList);
    state = AsyncValue.data(applicationsList);
  }

  /// 申請履歴取得(期間指定)
  Future getApplicationsByPeriod(DateTime begin, DateTime end) async {
    if (begin.isUtc || end.isUtc) {
      // この例外が発生したらバグ
      throw Exception('ローカルタイムゾーンを指定してください。');
    }

    // 申請履歴リスト
    var applicationsList = await _applicationRepository.getApplicationsByPeriod(
      begin.toIso8601String() + _getTimeZoneOffset(begin),
      end.toIso8601String() + _getTimeZoneOffset(end),
    );

    // ローカルタイムゾーンへ変換
    applicationsList = _toLocalTimeZone(applicationsList);

    _ref
        .read(applicationHistoryProvider.notifier)
        .setApplicationHistoryList(applicationsList);
    state = AsyncValue.data(applicationsList);
  }

  /// 指定した月の前後プラス1か月分（3か月分）の申請履歴を取得
  Future getApplicationsByThreeMonth(DateTime target) async {
    if (target.isUtc) {
      // この例外が発生したらバグ
      throw Exception('ローカルタイムゾーンを指定してください。');
    }

    // 前月の月初1日
    var begin = DateTime(target.year, target.month -1, 1);
    // 翌月の月末日
    var end = DateTime(target.year, target.month + 2, 0);

    // ISO 8601の文字列を作成するためのタイムゾーンオフセット(e.g. 09:00)
    var timeZoneOffset = _getTimeZoneOffset(target);

    // 申請履歴リスト
    var applicationsList = await _applicationRepository.getApplicationsByPeriod(
      begin.toIso8601String() + timeZoneOffset,
      end.toIso8601String() + timeZoneOffset,
    );

    // ローカルタイムゾーンへ変換
    applicationsList = _toLocalTimeZone(applicationsList);

    _ref
        .read(applicationHistoryProvider.notifier)
        .setApplicationHistoryList(applicationsList);
    state = AsyncValue.data(applicationsList);
  }

  /// 指定した月の申請履歴を取得
  Future getApplicationsByMonth(DateTime target) async {
    if (target.isUtc) {
      // この例外が発生したらバグ
      throw Exception('ローカルタイムゾーンを指定してください。');
    }

    // 月初1日
    var begin = DateTime(target.year, target.month , 1);
    // 月末日
    var end = DateTime(target.year, target.month + 1, 0);

    // ISO 8601の文字列を作成するためのタイムゾーンオフセット(e.g. 09:00)
    var timeZoneOffset = _getTimeZoneOffset(target);

    // 申請履歴リスト
    var applicationsList = await _applicationRepository.getApplicationsByPeriod(
      begin.toIso8601String() + timeZoneOffset,
      end.toIso8601String() + timeZoneOffset,
    );

    // ローカルタイムゾーンへ変換
    applicationsList = _toLocalTimeZone(applicationsList);

    _ref
        .read(applicationHistoryProvider.notifier)
        .setApplicationHistoryList(applicationsList);
    state = AsyncValue.data(applicationsList);
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
