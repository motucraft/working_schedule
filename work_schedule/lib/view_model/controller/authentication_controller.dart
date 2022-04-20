import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/model/user_model.dart';
import '../../view_model/provider.dart';

class AuthenticationController extends StateNotifier<AsyncValue<UserModel>> {
  AuthenticationController(this.ref, this._authenticationRepository)
      : super(AsyncValue.loading());

  final ProviderReference ref;
  final _authenticationRepository;

  /// ログイン
  Future<UserModel> login() async {
    state = const AsyncValue.loading();
    try {
      UserModel user = await _authenticationRepository.login(
          ref.read(userProvider).userId, ref.read(userProvider).password);
      state = AsyncValue.data(user);

      // マスタ取得
      await getMaster();

      return user;
    } catch (e) {
      state = AsyncValue.error(e);
      rethrow;
    }
  }

  /// ログアウト
  logout() async {
    try {
      await _authenticationRepository.logout();
    } catch (e) {
      state = AsyncValue.error(e);
      rethrow;
    }
  }

  /// マスタデータ取得
  Future getMaster() async {
    var masterController = ref.read(masterProvider.notifier);
    await masterController.getLeaveTypes();
  }
}
