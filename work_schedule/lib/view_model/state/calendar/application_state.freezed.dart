// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'application_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ApplicationStateTearOff {
  const _$ApplicationStateTearOff();

  _ApplicationState call(
      {bool isScrolling = false,
      required WorkApplicationState workApplicationState,
      required LeaveApplicationState leaveApplicationState}) {
    return _ApplicationState(
      isScrolling: isScrolling,
      workApplicationState: workApplicationState,
      leaveApplicationState: leaveApplicationState,
    );
  }
}

/// @nodoc
const $ApplicationState = _$ApplicationStateTearOff();

/// @nodoc
mixin _$ApplicationState {
  /// スクロールアニメーション中
  bool get isScrolling => throw _privateConstructorUsedError;

  /// 勤務申請
  WorkApplicationState get workApplicationState =>
      throw _privateConstructorUsedError;

  /// 休暇申請
  LeaveApplicationState get leaveApplicationState =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApplicationStateCopyWith<ApplicationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationStateCopyWith<$Res> {
  factory $ApplicationStateCopyWith(
          ApplicationState value, $Res Function(ApplicationState) then) =
      _$ApplicationStateCopyWithImpl<$Res>;
  $Res call(
      {bool isScrolling,
      WorkApplicationState workApplicationState,
      LeaveApplicationState leaveApplicationState});

  $WorkApplicationStateCopyWith<$Res> get workApplicationState;
  $LeaveApplicationStateCopyWith<$Res> get leaveApplicationState;
}

/// @nodoc
class _$ApplicationStateCopyWithImpl<$Res>
    implements $ApplicationStateCopyWith<$Res> {
  _$ApplicationStateCopyWithImpl(this._value, this._then);

  final ApplicationState _value;
  // ignore: unused_field
  final $Res Function(ApplicationState) _then;

  @override
  $Res call({
    Object? isScrolling = freezed,
    Object? workApplicationState = freezed,
    Object? leaveApplicationState = freezed,
  }) {
    return _then(_value.copyWith(
      isScrolling: isScrolling == freezed
          ? _value.isScrolling
          : isScrolling // ignore: cast_nullable_to_non_nullable
              as bool,
      workApplicationState: workApplicationState == freezed
          ? _value.workApplicationState
          : workApplicationState // ignore: cast_nullable_to_non_nullable
              as WorkApplicationState,
      leaveApplicationState: leaveApplicationState == freezed
          ? _value.leaveApplicationState
          : leaveApplicationState // ignore: cast_nullable_to_non_nullable
              as LeaveApplicationState,
    ));
  }

  @override
  $WorkApplicationStateCopyWith<$Res> get workApplicationState {
    return $WorkApplicationStateCopyWith<$Res>(_value.workApplicationState,
        (value) {
      return _then(_value.copyWith(workApplicationState: value));
    });
  }

  @override
  $LeaveApplicationStateCopyWith<$Res> get leaveApplicationState {
    return $LeaveApplicationStateCopyWith<$Res>(_value.leaveApplicationState,
        (value) {
      return _then(_value.copyWith(leaveApplicationState: value));
    });
  }
}

/// @nodoc
abstract class _$ApplicationStateCopyWith<$Res>
    implements $ApplicationStateCopyWith<$Res> {
  factory _$ApplicationStateCopyWith(
          _ApplicationState value, $Res Function(_ApplicationState) then) =
      __$ApplicationStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isScrolling,
      WorkApplicationState workApplicationState,
      LeaveApplicationState leaveApplicationState});

  @override
  $WorkApplicationStateCopyWith<$Res> get workApplicationState;
  @override
  $LeaveApplicationStateCopyWith<$Res> get leaveApplicationState;
}

/// @nodoc
class __$ApplicationStateCopyWithImpl<$Res>
    extends _$ApplicationStateCopyWithImpl<$Res>
    implements _$ApplicationStateCopyWith<$Res> {
  __$ApplicationStateCopyWithImpl(
      _ApplicationState _value, $Res Function(_ApplicationState) _then)
      : super(_value, (v) => _then(v as _ApplicationState));

  @override
  _ApplicationState get _value => super._value as _ApplicationState;

  @override
  $Res call({
    Object? isScrolling = freezed,
    Object? workApplicationState = freezed,
    Object? leaveApplicationState = freezed,
  }) {
    return _then(_ApplicationState(
      isScrolling: isScrolling == freezed
          ? _value.isScrolling
          : isScrolling // ignore: cast_nullable_to_non_nullable
              as bool,
      workApplicationState: workApplicationState == freezed
          ? _value.workApplicationState
          : workApplicationState // ignore: cast_nullable_to_non_nullable
              as WorkApplicationState,
      leaveApplicationState: leaveApplicationState == freezed
          ? _value.leaveApplicationState
          : leaveApplicationState // ignore: cast_nullable_to_non_nullable
              as LeaveApplicationState,
    ));
  }
}

/// @nodoc

class _$_ApplicationState implements _ApplicationState {
  const _$_ApplicationState(
      {this.isScrolling = false,
      required this.workApplicationState,
      required this.leaveApplicationState});

  @JsonKey(defaultValue: false)
  @override

  /// スクロールアニメーション中
  final bool isScrolling;
  @override

  /// 勤務申請
  final WorkApplicationState workApplicationState;
  @override

  /// 休暇申請
  final LeaveApplicationState leaveApplicationState;

  @override
  String toString() {
    return 'ApplicationState(isScrolling: $isScrolling, workApplicationState: $workApplicationState, leaveApplicationState: $leaveApplicationState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ApplicationState &&
            (identical(other.isScrolling, isScrolling) ||
                const DeepCollectionEquality()
                    .equals(other.isScrolling, isScrolling)) &&
            (identical(other.workApplicationState, workApplicationState) ||
                const DeepCollectionEquality().equals(
                    other.workApplicationState, workApplicationState)) &&
            (identical(other.leaveApplicationState, leaveApplicationState) ||
                const DeepCollectionEquality().equals(
                    other.leaveApplicationState, leaveApplicationState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isScrolling) ^
      const DeepCollectionEquality().hash(workApplicationState) ^
      const DeepCollectionEquality().hash(leaveApplicationState);

  @JsonKey(ignore: true)
  @override
  _$ApplicationStateCopyWith<_ApplicationState> get copyWith =>
      __$ApplicationStateCopyWithImpl<_ApplicationState>(this, _$identity);
}

abstract class _ApplicationState implements ApplicationState {
  const factory _ApplicationState(
          {bool isScrolling,
          required WorkApplicationState workApplicationState,
          required LeaveApplicationState leaveApplicationState}) =
      _$_ApplicationState;

  @override

  /// スクロールアニメーション中
  bool get isScrolling => throw _privateConstructorUsedError;
  @override

  /// 勤務申請
  WorkApplicationState get workApplicationState =>
      throw _privateConstructorUsedError;
  @override

  /// 休暇申請
  LeaveApplicationState get leaveApplicationState =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ApplicationStateCopyWith<_ApplicationState> get copyWith =>
      throw _privateConstructorUsedError;
}
