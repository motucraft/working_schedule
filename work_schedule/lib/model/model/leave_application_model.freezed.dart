// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'leave_application_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LeaveApplicationModelTearOff {
  const _$LeaveApplicationModelTearOff();

  _LeaveApplicationModel call({required DateTime targetDate}) {
    return _LeaveApplicationModel(
      targetDate: targetDate,
    );
  }
}

/// @nodoc
const $LeaveApplicationModel = _$LeaveApplicationModelTearOff();

/// @nodoc
mixin _$LeaveApplicationModel {
  /// 申請対象日
  DateTime get targetDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LeaveApplicationModelCopyWith<LeaveApplicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveApplicationModelCopyWith<$Res> {
  factory $LeaveApplicationModelCopyWith(LeaveApplicationModel value,
          $Res Function(LeaveApplicationModel) then) =
      _$LeaveApplicationModelCopyWithImpl<$Res>;
  $Res call({DateTime targetDate});
}

/// @nodoc
class _$LeaveApplicationModelCopyWithImpl<$Res>
    implements $LeaveApplicationModelCopyWith<$Res> {
  _$LeaveApplicationModelCopyWithImpl(this._value, this._then);

  final LeaveApplicationModel _value;
  // ignore: unused_field
  final $Res Function(LeaveApplicationModel) _then;

  @override
  $Res call({
    Object? targetDate = freezed,
  }) {
    return _then(_value.copyWith(
      targetDate: targetDate == freezed
          ? _value.targetDate
          : targetDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$LeaveApplicationModelCopyWith<$Res>
    implements $LeaveApplicationModelCopyWith<$Res> {
  factory _$LeaveApplicationModelCopyWith(_LeaveApplicationModel value,
          $Res Function(_LeaveApplicationModel) then) =
      __$LeaveApplicationModelCopyWithImpl<$Res>;
  @override
  $Res call({DateTime targetDate});
}

/// @nodoc
class __$LeaveApplicationModelCopyWithImpl<$Res>
    extends _$LeaveApplicationModelCopyWithImpl<$Res>
    implements _$LeaveApplicationModelCopyWith<$Res> {
  __$LeaveApplicationModelCopyWithImpl(_LeaveApplicationModel _value,
      $Res Function(_LeaveApplicationModel) _then)
      : super(_value, (v) => _then(v as _LeaveApplicationModel));

  @override
  _LeaveApplicationModel get _value => super._value as _LeaveApplicationModel;

  @override
  $Res call({
    Object? targetDate = freezed,
  }) {
    return _then(_LeaveApplicationModel(
      targetDate: targetDate == freezed
          ? _value.targetDate
          : targetDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_LeaveApplicationModel implements _LeaveApplicationModel {
  const _$_LeaveApplicationModel({required this.targetDate});

  @override

  /// 申請対象日
  final DateTime targetDate;

  @override
  String toString() {
    return 'LeaveApplicationModel(targetDate: $targetDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LeaveApplicationModel &&
            (identical(other.targetDate, targetDate) ||
                const DeepCollectionEquality()
                    .equals(other.targetDate, targetDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(targetDate);

  @JsonKey(ignore: true)
  @override
  _$LeaveApplicationModelCopyWith<_LeaveApplicationModel> get copyWith =>
      __$LeaveApplicationModelCopyWithImpl<_LeaveApplicationModel>(
          this, _$identity);
}

abstract class _LeaveApplicationModel implements LeaveApplicationModel {
  const factory _LeaveApplicationModel({required DateTime targetDate}) =
      _$_LeaveApplicationModel;

  @override

  /// 申請対象日
  DateTime get targetDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LeaveApplicationModelCopyWith<_LeaveApplicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
