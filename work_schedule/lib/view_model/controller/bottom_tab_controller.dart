import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../state/bottom_tab/bottom_tab_state.dart';
import '../util/bottom_tab_type.dart';

class BottomTabController extends StateNotifier<BottomTabState> {
  BottomTabController() : super(const BottomTabState());

  void setBottomTabType(BottomTabType type) {
    state = state.copyWith(bottomTabType: type);
  }
}
