import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view_model/state/setting/setting_state.dart';

class SettingController extends StateNotifier<SettingState> {
  SettingController() : super(const SettingState());

  /// ダークテーマフラグ設定
  setIsDarkTheme(bool isDarkTheme) {
    state = state.copyWith(isDarkTheme: isDarkTheme);
  }
}
