// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'break_time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BreakTimeModel _$_$_BreakTimeModelFromJson(Map<String, dynamic> json) {
  return _$_BreakTimeModel(
    breakStartTime: DateTime.parse(json['breakStartTime'] as String),
    breakEndTime: DateTime.parse(json['breakEndTime'] as String),
  );
}

Map<String, dynamic> _$_$_BreakTimeModelToJson(_$_BreakTimeModel instance) =>
    <String, dynamic>{
      'breakStartTime': instance.breakStartTime.toIso8601String(),
      'breakEndTime': instance.breakEndTime.toIso8601String(),
    };
