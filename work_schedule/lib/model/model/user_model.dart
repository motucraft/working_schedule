import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    /// ID
    final int? id,

    /// ユーザID
    @Default('') final String userId,

    /// 名前
    @Default('') final String name,

    /// パスワード
    @Default('') final String? password,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
