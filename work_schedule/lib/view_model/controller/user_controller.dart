import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view_model/state/authentication/user_state.dart';

class UserController extends StateNotifier<UserState> {
  UserController() : super(UserState());

  /// ユーザID設定
  setUserId(String userId) {
    state = state.copyWith(userId: userId);
  }

  /// パスワード設定
  setPassword(String password) {
    state = state.copyWith(password: password);
  }
}
