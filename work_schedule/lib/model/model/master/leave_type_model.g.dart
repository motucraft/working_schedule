// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LeaveTypeModel _$_$_LeaveTypeModelFromJson(Map<String, dynamic> json) {
  return _$_LeaveTypeModel(
    id: json['id'] as String,
    leaveTypeName: json['leaveTypeName'] as String,
    comment: json['comment'] as String? ?? '',
  );
}

Map<String, dynamic> _$_$_LeaveTypeModelToJson(_$_LeaveTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'leaveTypeName': instance.leaveTypeName,
      'comment': instance.comment,
    };
