import '../../model/user_model.dart';

abstract class AuthenticationRepository {
  /// ログイン
  Future<UserModel> login(String userId, String password);

  /// ログアウト
  logout();
}
