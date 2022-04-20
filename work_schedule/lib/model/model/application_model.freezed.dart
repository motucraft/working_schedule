// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'application_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApplicationModel _$ApplicationModelFromJson(Map<String, dynamic> json) {
  return _ApplicationModel.fromJson(json);
}

/// @nodoc
class _$ApplicationModelTearOff {
  const _$ApplicationModelTearOff();

  _ApplicationModel call(
      {required DateTime workingDay,
      required String applicationType,
      String userId = '',
      DateTime? start,
      DateTime? end,
      List<BreakTimeModel>? breakTimeList = const [],
      String? overtimeReason = '',
      String? leaveTypeId = ''}) {
    return _ApplicationModel(
      workingDay: workingDay,
      applicationType: applicationType,
      userId: userId,
      start: start,
      end: end,
      breakTimeList: breakTimeList,
      overtimeReason: overtimeReason,
      leaveTypeId: leaveTypeId,
    );
  }

  ApplicationModel fromJson(Map<String, Object> json) {
    return ApplicationModel.fromJson(json);
  }
}

/// @nodoc
const $ApplicationModel = _$ApplicationModelTearOff();

/// @nodoc
mixin _$ApplicationModel {
  /// [UTC]勤務日(または休暇日)
  DateTime get workingDay => throw _privateConstructorUsedError;

  /// 申請タイプ(0:勤務 1:休暇)
  String get applicationType => throw _privateConstructorUsedError;

  /// ユーザID
  String get userId => throw _privateConstructorUsedError;

  /// [UTC]勤務開始時刻
  DateTime? get start => throw _privateConstructorUsedError;

  /// [UTC]勤務終了時刻
  DateTime? get end => throw _privateConstructorUsedError;

  /// 休憩時間リスト
  List<BreakTimeModel>? get breakTimeList => throw _privateConstructorUsedError;

  /// 時間外理由
  String? get overtimeReason => throw _privateConstructorUsedError;

  /// 休暇区分ID
  String? get leaveTypeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplicationModelCopyWith<ApplicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationModelCopyWith<$Res> {
  factory $ApplicationModelCopyWith(
          ApplicationModel value, $Res Function(ApplicationModel) then) =
      _$ApplicationModelCopyWithImpl<$Res>;
  $Res call(
      {DateTime workingDay,
      String applicationType,
      String userId,
      DateTime? start,
      DateTime? end,
      List<BreakTimeModel>? breakTimeList,
      String? overtimeReason,
      String? leaveTypeId});
}

/// @nodoc
class _$ApplicationModelCopyWithImpl<$Res>
    implements $ApplicationModelCopyWith<$Res> {
  _$ApplicationModelCopyWithImpl(this._value, this._then);

  final ApplicationModel _value;
  // ignore: unused_field
  final $Res Function(ApplicationModel) _then;

  @override
  $Res call({
    Object? workingDay = freezed,
    Object? applicationType = freezed,
    Object? userId = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? breakTimeList = freezed,
    Object? overtimeReason = freezed,
    Object? leaveTypeId = freezed,
  }) {
    return _then(_value.copyWith(
      workingDay: workingDay == freezed
          ? _value.workingDay
          : workingDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      applicationType: applicationType == freezed
          ? _value.applicationType
          : applicationType // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      breakTimeList: breakTimeList == freezed
          ? _value.breakTimeList
          : breakTimeList // ignore: cast_nullable_to_non_nullable
              as List<BreakTimeModel>?,
      overtimeReason: overtimeReason == freezed
          ? _value.overtimeReason
          : overtimeReason // ignore: cast_nullable_to_non_nullable
              as String?,
      leaveTypeId: leaveTypeId == freezed
          ? _value.leaveTypeId
          : leaveTypeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ApplicationModelCopyWith<$Res>
    implements $ApplicationModelCopyWith<$Res> {
  factory _$ApplicationModelCopyWith(
          _ApplicationModel value, $Res Function(_ApplicationModel) then) =
      __$ApplicationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime workingDay,
      String applicationType,
      String userId,
      DateTime? start,
      DateTime? end,
      List<BreakTimeModel>? breakTimeList,
      String? overtimeReason,
      String? leaveTypeId});
}

/// @nodoc
class __$ApplicationModelCopyWithImpl<$Res>
    extends _$ApplicationModelCopyWithImpl<$Res>
    implements _$ApplicationModelCopyWith<$Res> {
  __$ApplicationModelCopyWithImpl(
      _ApplicationModel _value, $Res Function(_ApplicationModel) _then)
      : super(_value, (v) => _then(v as _ApplicationModel));

  @override
  _ApplicationModel get _value => super._value as _ApplicationModel;

  @override
  $Res call({
    Object? workingDay = freezed,
    Object? applicationType = freezed,
    Object? userId = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? breakTimeList = freezed,
    Object? overtimeReason = freezed,
    Object? leaveTypeId = freezed,
  }) {
    return _then(_ApplicationModel(
      workingDay: workingDay == freezed
          ? _value.workingDay
          : workingDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      applicationType: applicationType == freezed
          ? _value.applicationType
          : applicationType // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      breakTimeList: breakTimeList == freezed
          ? _value.breakTimeList
          : breakTimeList // ignore: cast_nullable_to_non_nullable
              as List<BreakTimeModel>?,
      overtimeReason: overtimeReason == freezed
          ? _value.overtimeReason
          : overtimeReason // ignore: cast_nullable_to_non_nullable
              as String?,
      leaveTypeId: leaveTypeId == freezed
          ? _value.leaveTypeId
          : leaveTypeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApplicationModel implements _ApplicationModel {
  const _$_ApplicationModel(
      {required this.workingDay,
      required this.applicationType,
      this.userId = '',
      this.start,
      this.end,
      this.breakTimeList = const [],
      this.overtimeReason = '',
      this.leaveTypeId = ''});

  factory _$_ApplicationModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ApplicationModelFromJson(json);

  @override

  /// [UTC]勤務日(または休暇日)
  final DateTime workingDay;
  @override

  /// 申請タイプ(0:勤務 1:休暇)
  final String applicationType;
  @JsonKey(defaultValue: '')
  @override

  /// ユーザID
  final String userId;
  @override

  /// [UTC]勤務開始時刻
  final DateTime? start;
  @override

  /// [UTC]勤務終了時刻
  final DateTime? end;
  @JsonKey(defaultValue: const [])
  @override

  /// 休憩時間リスト
  final List<BreakTimeModel>? breakTimeList;
  @JsonKey(defaultValue: '')
  @override

  /// 時間外理由
  final String? overtimeReason;
  @JsonKey(defaultValue: '')
  @override

  /// 休暇区分ID
  final String? leaveTypeId;

  @override
  String toString() {
    return 'ApplicationModel(workingDay: $workingDay, applicationType: $applicationType, userId: $userId, start: $start, end: $end, breakTimeList: $breakTimeList, overtimeReason: $overtimeReason, leaveTypeId: $leaveTypeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ApplicationModel &&
            (identical(other.workingDay, workingDay) ||
                const DeepCollectionEquality()
                    .equals(other.workingDay, workingDay)) &&
            (identical(other.applicationType, applicationType) ||
                const DeepCollectionEquality()
                    .equals(other.applicationType, applicationType)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.start, start) ||
                const DeepCollectionEquality().equals(other.start, start)) &&
            (identical(other.end, end) ||
                const DeepCollectionEquality().equals(other.end, end)) &&
            (identical(other.breakTimeList, breakTimeList) ||
                const DeepCollectionEquality()
                    .equals(other.breakTimeList, breakTimeList)) &&
            (identical(other.overtimeReason, overtimeReason) ||
                const DeepCollectionEquality()
                    .equals(other.overtimeReason, overtimeReason)) &&
            (identical(other.leaveTypeId, leaveTypeId) ||
                const DeepCollectionEquality()
                    .equals(other.leaveTypeId, leaveTypeId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(workingDay) ^
      const DeepCollectionEquality().hash(applicationType) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(start) ^
      const DeepCollectionEquality().hash(end) ^
      const DeepCollectionEquality().hash(breakTimeList) ^
      const DeepCollectionEquality().hash(overtimeReason) ^
      const DeepCollectionEquality().hash(leaveTypeId);

  @JsonKey(ignore: true)
  @override
  _$ApplicationModelCopyWith<_ApplicationModel> get copyWith =>
      __$ApplicationModelCopyWithImpl<_ApplicationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ApplicationModelToJson(this);
  }
}

abstract class _ApplicationModel implements ApplicationModel {
  const factory _ApplicationModel(
      {required DateTime workingDay,
      required String applicationType,
      String userId,
      DateTime? start,
      DateTime? end,
      List<BreakTimeModel>? breakTimeList,
      String? overtimeReason,
      String? leaveTypeId}) = _$_ApplicationModel;

  factory _ApplicationModel.fromJson(Map<String, dynamic> json) =
      _$_ApplicationModel.fromJson;

  @override

  /// [UTC]勤務日(または休暇日)
  DateTime get workingDay => throw _privateConstructorUsedError;
  @override

  /// 申請タイプ(0:勤務 1:休暇)
  String get applicationType => throw _privateConstructorUsedError;
  @override

  /// ユーザID
  String get userId => throw _privateConstructorUsedError;
  @override

  /// [UTC]勤務開始時刻
  DateTime? get start => throw _privateConstructorUsedError;
  @override

  /// [UTC]勤務終了時刻
  DateTime? get end => throw _privateConstructorUsedError;
  @override

  /// 休憩時間リスト
  List<BreakTimeModel>? get breakTimeList => throw _privateConstructorUsedError;
  @override

  /// 時間外理由
  String? get overtimeReason => throw _privateConstructorUsedError;
  @override

  /// 休暇区分ID
  String? get leaveTypeId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ApplicationModelCopyWith<_ApplicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
