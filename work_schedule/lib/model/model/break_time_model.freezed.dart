// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'break_time_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BreakTimeModel _$BreakTimeModelFromJson(Map<String, dynamic> json) {
  return _BreakTimeModel.fromJson(json);
}

/// @nodoc
class _$BreakTimeModelTearOff {
  const _$BreakTimeModelTearOff();

  _BreakTimeModel call(
      {required DateTime breakStartTime, required DateTime breakEndTime}) {
    return _BreakTimeModel(
      breakStartTime: breakStartTime,
      breakEndTime: breakEndTime,
    );
  }

  BreakTimeModel fromJson(Map<String, Object> json) {
    return BreakTimeModel.fromJson(json);
  }
}

/// @nodoc
const $BreakTimeModel = _$BreakTimeModelTearOff();

/// @nodoc
mixin _$BreakTimeModel {
  /// 休憩開始時刻
  DateTime get breakStartTime => throw _privateConstructorUsedError;

  /// 休憩終了時刻
  DateTime get breakEndTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BreakTimeModelCopyWith<BreakTimeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreakTimeModelCopyWith<$Res> {
  factory $BreakTimeModelCopyWith(
          BreakTimeModel value, $Res Function(BreakTimeModel) then) =
      _$BreakTimeModelCopyWithImpl<$Res>;
  $Res call({DateTime breakStartTime, DateTime breakEndTime});
}

/// @nodoc
class _$BreakTimeModelCopyWithImpl<$Res>
    implements $BreakTimeModelCopyWith<$Res> {
  _$BreakTimeModelCopyWithImpl(this._value, this._then);

  final BreakTimeModel _value;
  // ignore: unused_field
  final $Res Function(BreakTimeModel) _then;

  @override
  $Res call({
    Object? breakStartTime = freezed,
    Object? breakEndTime = freezed,
  }) {
    return _then(_value.copyWith(
      breakStartTime: breakStartTime == freezed
          ? _value.breakStartTime
          : breakStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      breakEndTime: breakEndTime == freezed
          ? _value.breakEndTime
          : breakEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$BreakTimeModelCopyWith<$Res>
    implements $BreakTimeModelCopyWith<$Res> {
  factory _$BreakTimeModelCopyWith(
          _BreakTimeModel value, $Res Function(_BreakTimeModel) then) =
      __$BreakTimeModelCopyWithImpl<$Res>;
  @override
  $Res call({DateTime breakStartTime, DateTime breakEndTime});
}

/// @nodoc
class __$BreakTimeModelCopyWithImpl<$Res>
    extends _$BreakTimeModelCopyWithImpl<$Res>
    implements _$BreakTimeModelCopyWith<$Res> {
  __$BreakTimeModelCopyWithImpl(
      _BreakTimeModel _value, $Res Function(_BreakTimeModel) _then)
      : super(_value, (v) => _then(v as _BreakTimeModel));

  @override
  _BreakTimeModel get _value => super._value as _BreakTimeModel;

  @override
  $Res call({
    Object? breakStartTime = freezed,
    Object? breakEndTime = freezed,
  }) {
    return _then(_BreakTimeModel(
      breakStartTime: breakStartTime == freezed
          ? _value.breakStartTime
          : breakStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      breakEndTime: breakEndTime == freezed
          ? _value.breakEndTime
          : breakEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BreakTimeModel implements _BreakTimeModel {
  const _$_BreakTimeModel(
      {required this.breakStartTime, required this.breakEndTime});

  factory _$_BreakTimeModel.fromJson(Map<String, dynamic> json) =>
      _$_$_BreakTimeModelFromJson(json);

  @override

  /// 休憩開始時刻
  final DateTime breakStartTime;
  @override

  /// 休憩終了時刻
  final DateTime breakEndTime;

  @override
  String toString() {
    return 'BreakTimeModel(breakStartTime: $breakStartTime, breakEndTime: $breakEndTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BreakTimeModel &&
            (identical(other.breakStartTime, breakStartTime) ||
                const DeepCollectionEquality()
                    .equals(other.breakStartTime, breakStartTime)) &&
            (identical(other.breakEndTime, breakEndTime) ||
                const DeepCollectionEquality()
                    .equals(other.breakEndTime, breakEndTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(breakStartTime) ^
      const DeepCollectionEquality().hash(breakEndTime);

  @JsonKey(ignore: true)
  @override
  _$BreakTimeModelCopyWith<_BreakTimeModel> get copyWith =>
      __$BreakTimeModelCopyWithImpl<_BreakTimeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BreakTimeModelToJson(this);
  }
}

abstract class _BreakTimeModel implements BreakTimeModel {
  const factory _BreakTimeModel(
      {required DateTime breakStartTime,
      required DateTime breakEndTime}) = _$_BreakTimeModel;

  factory _BreakTimeModel.fromJson(Map<String, dynamic> json) =
      _$_BreakTimeModel.fromJson;

  @override

  /// 休憩開始時刻
  DateTime get breakStartTime => throw _privateConstructorUsedError;
  @override

  /// 休憩終了時刻
  DateTime get breakEndTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BreakTimeModelCopyWith<_BreakTimeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
