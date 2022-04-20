import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_type_model.freezed.dart';
part 'leave_type_model.g.dart';

@freezed
abstract class LeaveTypeModel with _$LeaveTypeModel {
  const factory LeaveTypeModel({
    /// 休暇区分ID
    required final String id,

    /// 休暇区分名称
    required final String leaveTypeName,

    /// コメント
    @Default('') final String comment,
  }) = _LeaveTypeModel;

  factory LeaveTypeModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveTypeModelFromJson(json);
}
