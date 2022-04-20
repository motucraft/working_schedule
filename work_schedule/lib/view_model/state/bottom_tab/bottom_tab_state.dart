import 'package:freezed_annotation/freezed_annotation.dart';

import '../../util/bottom_tab_type.dart';

part 'bottom_tab_state.freezed.dart';

@freezed
abstract class BottomTabState with _$BottomTabState {
  const factory BottomTabState({
    /// タブタイプ
    @Default(BottomTabType.Home) final BottomTabType bottomTabType,
  }) = _BottomTabState;
}
