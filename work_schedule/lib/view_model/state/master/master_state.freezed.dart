// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'master_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MasterStateTearOff {
  const _$MasterStateTearOff();

  _MasterState call({List<LeaveTypeModel> leaveTypeList = const []}) {
    return _MasterState(
      leaveTypeList: leaveTypeList,
    );
  }
}

/// @nodoc
const $MasterState = _$MasterStateTearOff();

/// @nodoc
mixin _$MasterState {
  /// 休暇区分リスト
  List<LeaveTypeModel> get leaveTypeList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MasterStateCopyWith<MasterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasterStateCopyWith<$Res> {
  factory $MasterStateCopyWith(
          MasterState value, $Res Function(MasterState) then) =
      _$MasterStateCopyWithImpl<$Res>;
  $Res call({List<LeaveTypeModel> leaveTypeList});
}

/// @nodoc
class _$MasterStateCopyWithImpl<$Res> implements $MasterStateCopyWith<$Res> {
  _$MasterStateCopyWithImpl(this._value, this._then);

  final MasterState _value;
  // ignore: unused_field
  final $Res Function(MasterState) _then;

  @override
  $Res call({
    Object? leaveTypeList = freezed,
  }) {
    return _then(_value.copyWith(
      leaveTypeList: leaveTypeList == freezed
          ? _value.leaveTypeList
          : leaveTypeList // ignore: cast_nullable_to_non_nullable
              as List<LeaveTypeModel>,
    ));
  }
}

/// @nodoc
abstract class _$MasterStateCopyWith<$Res>
    implements $MasterStateCopyWith<$Res> {
  factory _$MasterStateCopyWith(
          _MasterState value, $Res Function(_MasterState) then) =
      __$MasterStateCopyWithImpl<$Res>;
  @override
  $Res call({List<LeaveTypeModel> leaveTypeList});
}

/// @nodoc
class __$MasterStateCopyWithImpl<$Res> extends _$MasterStateCopyWithImpl<$Res>
    implements _$MasterStateCopyWith<$Res> {
  __$MasterStateCopyWithImpl(
      _MasterState _value, $Res Function(_MasterState) _then)
      : super(_value, (v) => _then(v as _MasterState));

  @override
  _MasterState get _value => super._value as _MasterState;

  @override
  $Res call({
    Object? leaveTypeList = freezed,
  }) {
    return _then(_MasterState(
      leaveTypeList: leaveTypeList == freezed
          ? _value.leaveTypeList
          : leaveTypeList // ignore: cast_nullable_to_non_nullable
              as List<LeaveTypeModel>,
    ));
  }
}

/// @nodoc

class _$_MasterState implements _MasterState {
  const _$_MasterState({this.leaveTypeList = const []});

  @JsonKey(defaultValue: const [])
  @override

  /// 休暇区分リスト
  final List<LeaveTypeModel> leaveTypeList;

  @override
  String toString() {
    return 'MasterState(leaveTypeList: $leaveTypeList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MasterState &&
            (identical(other.leaveTypeList, leaveTypeList) ||
                const DeepCollectionEquality()
                    .equals(other.leaveTypeList, leaveTypeList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(leaveTypeList);

  @JsonKey(ignore: true)
  @override
  _$MasterStateCopyWith<_MasterState> get copyWith =>
      __$MasterStateCopyWithImpl<_MasterState>(this, _$identity);
}

abstract class _MasterState implements MasterState {
  const factory _MasterState({List<LeaveTypeModel> leaveTypeList}) =
      _$_MasterState;

  @override

  /// 休暇区分リスト
  List<LeaveTypeModel> get leaveTypeList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MasterStateCopyWith<_MasterState> get copyWith =>
      throw _privateConstructorUsedError;
}
