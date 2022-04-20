// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'work_application_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WorkApplicationModelTearOff {
  const _$WorkApplicationModelTearOff();

  _WorkApplicationModel call(
      {required DateTime targetDate,
      required DateTime workStartTime,
      required DateTime workEndTime,
      required List<BreakTimeModel> breakTimeList,
      required String overtimeReason}) {
    return _WorkApplicationModel(
      targetDate: targetDate,
      workStartTime: workStartTime,
      workEndTime: workEndTime,
      breakTimeList: breakTimeList,
      overtimeReason: overtimeReason,
    );
  }
}

/// @nodoc
const $WorkApplicationModel = _$WorkApplicationModelTearOff();

/// @nodoc
mixin _$WorkApplicationModel {
  /// 申請対象日
  DateTime get targetDate => throw _privateConstructorUsedError;

  /// 勤務開始時刻
  DateTime get workStartTime => throw _privateConstructorUsedError;

  /// 勤務終了時刻
  DateTime get workEndTime => throw _privateConstructorUsedError;

  /// 休憩時間
  List<BreakTimeModel> get breakTimeList => throw _privateConstructorUsedError;

  /// 時間外理由
  String get overtimeReason => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkApplicationModelCopyWith<WorkApplicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkApplicationModelCopyWith<$Res> {
  factory $WorkApplicationModelCopyWith(WorkApplicationModel value,
          $Res Function(WorkApplicationModel) then) =
      _$WorkApplicationModelCopyWithImpl<$Res>;
  $Res call(
      {DateTime targetDate,
      DateTime workStartTime,
      DateTime workEndTime,
      List<BreakTimeModel> breakTimeList,
      String overtimeReason});
}

/// @nodoc
class _$WorkApplicationModelCopyWithImpl<$Res>
    implements $WorkApplicationModelCopyWith<$Res> {
  _$WorkApplicationModelCopyWithImpl(this._value, this._then);

  final WorkApplicationModel _value;
  // ignore: unused_field
  final $Res Function(WorkApplicationModel) _then;

  @override
  $Res call({
    Object? targetDate = freezed,
    Object? workStartTime = freezed,
    Object? workEndTime = freezed,
    Object? breakTimeList = freezed,
    Object? overtimeReason = freezed,
  }) {
    return _then(_value.copyWith(
      targetDate: targetDate == freezed
          ? _value.targetDate
          : targetDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      workStartTime: workStartTime == freezed
          ? _value.workStartTime
          : workStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      workEndTime: workEndTime == freezed
          ? _value.workEndTime
          : workEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      breakTimeList: breakTimeList == freezed
          ? _value.breakTimeList
          : breakTimeList // ignore: cast_nullable_to_non_nullable
              as List<BreakTimeModel>,
      overtimeReason: overtimeReason == freezed
          ? _value.overtimeReason
          : overtimeReason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$WorkApplicationModelCopyWith<$Res>
    implements $WorkApplicationModelCopyWith<$Res> {
  factory _$WorkApplicationModelCopyWith(_WorkApplicationModel value,
          $Res Function(_WorkApplicationModel) then) =
      __$WorkApplicationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime targetDate,
      DateTime workStartTime,
      DateTime workEndTime,
      List<BreakTimeModel> breakTimeList,
      String overtimeReason});
}

/// @nodoc
class __$WorkApplicationModelCopyWithImpl<$Res>
    extends _$WorkApplicationModelCopyWithImpl<$Res>
    implements _$WorkApplicationModelCopyWith<$Res> {
  __$WorkApplicationModelCopyWithImpl(
      _WorkApplicationModel _value, $Res Function(_WorkApplicationModel) _then)
      : super(_value, (v) => _then(v as _WorkApplicationModel));

  @override
  _WorkApplicationModel get _value => super._value as _WorkApplicationModel;

  @override
  $Res call({
    Object? targetDate = freezed,
    Object? workStartTime = freezed,
    Object? workEndTime = freezed,
    Object? breakTimeList = freezed,
    Object? overtimeReason = freezed,
  }) {
    return _then(_WorkApplicationModel(
      targetDate: targetDate == freezed
          ? _value.targetDate
          : targetDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      workStartTime: workStartTime == freezed
          ? _value.workStartTime
          : workStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      workEndTime: workEndTime == freezed
          ? _value.workEndTime
          : workEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      breakTimeList: breakTimeList == freezed
          ? _value.breakTimeList
          : breakTimeList // ignore: cast_nullable_to_non_nullable
              as List<BreakTimeModel>,
      overtimeReason: overtimeReason == freezed
          ? _value.overtimeReason
          : overtimeReason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_WorkApplicationModel implements _WorkApplicationModel {
  const _$_WorkApplicationModel(
      {required this.targetDate,
      required this.workStartTime,
      required this.workEndTime,
      required this.breakTimeList,
      required this.overtimeReason});

  @override

  /// 申請対象日
  final DateTime targetDate;
  @override

  /// 勤務開始時刻
  final DateTime workStartTime;
  @override

  /// 勤務終了時刻
  final DateTime workEndTime;
  @override

  /// 休憩時間
  final List<BreakTimeModel> breakTimeList;
  @override

  /// 時間外理由
  final String overtimeReason;

  @override
  String toString() {
    return 'WorkApplicationModel(targetDate: $targetDate, workStartTime: $workStartTime, workEndTime: $workEndTime, breakTimeList: $breakTimeList, overtimeReason: $overtimeReason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WorkApplicationModel &&
            (identical(other.targetDate, targetDate) ||
                const DeepCollectionEquality()
                    .equals(other.targetDate, targetDate)) &&
            (identical(other.workStartTime, workStartTime) ||
                const DeepCollectionEquality()
                    .equals(other.workStartTime, workStartTime)) &&
            (identical(other.workEndTime, workEndTime) ||
                const DeepCollectionEquality()
                    .equals(other.workEndTime, workEndTime)) &&
            (identical(other.breakTimeList, breakTimeList) ||
                const DeepCollectionEquality()
                    .equals(other.breakTimeList, breakTimeList)) &&
            (identical(other.overtimeReason, overtimeReason) ||
                const DeepCollectionEquality()
                    .equals(other.overtimeReason, overtimeReason)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(targetDate) ^
      const DeepCollectionEquality().hash(workStartTime) ^
      const DeepCollectionEquality().hash(workEndTime) ^
      const DeepCollectionEquality().hash(breakTimeList) ^
      const DeepCollectionEquality().hash(overtimeReason);

  @JsonKey(ignore: true)
  @override
  _$WorkApplicationModelCopyWith<_WorkApplicationModel> get copyWith =>
      __$WorkApplicationModelCopyWithImpl<_WorkApplicationModel>(
          this, _$identity);
}

abstract class _WorkApplicationModel implements WorkApplicationModel {
  const factory _WorkApplicationModel(
      {required DateTime targetDate,
      required DateTime workStartTime,
      required DateTime workEndTime,
      required List<BreakTimeModel> breakTimeList,
      required String overtimeReason}) = _$_WorkApplicationModel;

  @override

  /// 申請対象日
  DateTime get targetDate => throw _privateConstructorUsedError;
  @override

  /// 勤務開始時刻
  DateTime get workStartTime => throw _privateConstructorUsedError;
  @override

  /// 勤務終了時刻
  DateTime get workEndTime => throw _privateConstructorUsedError;
  @override

  /// 休憩時間
  List<BreakTimeModel> get breakTimeList => throw _privateConstructorUsedError;
  @override

  /// 時間外理由
  String get overtimeReason => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WorkApplicationModelCopyWith<_WorkApplicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
