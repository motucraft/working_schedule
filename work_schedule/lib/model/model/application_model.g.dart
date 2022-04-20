// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApplicationModel _$_$_ApplicationModelFromJson(Map<String, dynamic> json) {
  return _$_ApplicationModel(
    workingDay: DateTime.parse(json['workingDay'] as String),
    applicationType: json['applicationType'] as String,
    userId: json['userId'] as String? ?? '',
    start:
        json['start'] == null ? null : DateTime.parse(json['start'] as String),
    end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
    breakTimeList: (json['breakTimeList'] as List<dynamic>?)
            ?.map((e) => BreakTimeModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    overtimeReason: json['overtimeReason'] as String? ?? '',
    leaveTypeId: json['leaveTypeId'] as String? ?? '',
  );
}

Map<String, dynamic> _$_$_ApplicationModelToJson(
        _$_ApplicationModel instance) =>
    <String, dynamic>{
      'workingDay': instance.workingDay.toIso8601String(),
      'applicationType': instance.applicationType,
      'userId': instance.userId,
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'breakTimeList': instance.breakTimeList,
      'overtimeReason': instance.overtimeReason,
      'leaveTypeId': instance.leaveTypeId,
    };
