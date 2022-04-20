import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_state.freezed.dart';

@freezed
abstract class SettingState with _$SettingState {
  const factory SettingState({
    /// true:ダークテーマ
    @Default(false) final bool isDarkTheme,
  }) = _SettingState;
}
