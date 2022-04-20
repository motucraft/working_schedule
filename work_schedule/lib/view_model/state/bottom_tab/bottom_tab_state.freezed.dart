// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'bottom_tab_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BottomTabStateTearOff {
  const _$BottomTabStateTearOff();

  _BottomTabState call({BottomTabType bottomTabType = BottomTabType.Home}) {
    return _BottomTabState(
      bottomTabType: bottomTabType,
    );
  }
}

/// @nodoc
const $BottomTabState = _$BottomTabStateTearOff();

/// @nodoc
mixin _$BottomTabState {
  /// タブタイプ
  BottomTabType get bottomTabType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BottomTabStateCopyWith<BottomTabState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomTabStateCopyWith<$Res> {
  factory $BottomTabStateCopyWith(
          BottomTabState value, $Res Function(BottomTabState) then) =
      _$BottomTabStateCopyWithImpl<$Res>;
  $Res call({BottomTabType bottomTabType});
}

/// @nodoc
class _$BottomTabStateCopyWithImpl<$Res>
    implements $BottomTabStateCopyWith<$Res> {
  _$BottomTabStateCopyWithImpl(this._value, this._then);

  final BottomTabState _value;
  // ignore: unused_field
  final $Res Function(BottomTabState) _then;

  @override
  $Res call({
    Object? bottomTabType = freezed,
  }) {
    return _then(_value.copyWith(
      bottomTabType: bottomTabType == freezed
          ? _value.bottomTabType
          : bottomTabType // ignore: cast_nullable_to_non_nullable
              as BottomTabType,
    ));
  }
}

/// @nodoc
abstract class _$BottomTabStateCopyWith<$Res>
    implements $BottomTabStateCopyWith<$Res> {
  factory _$BottomTabStateCopyWith(
          _BottomTabState value, $Res Function(_BottomTabState) then) =
      __$BottomTabStateCopyWithImpl<$Res>;
  @override
  $Res call({BottomTabType bottomTabType});
}

/// @nodoc
class __$BottomTabStateCopyWithImpl<$Res>
    extends _$BottomTabStateCopyWithImpl<$Res>
    implements _$BottomTabStateCopyWith<$Res> {
  __$BottomTabStateCopyWithImpl(
      _BottomTabState _value, $Res Function(_BottomTabState) _then)
      : super(_value, (v) => _then(v as _BottomTabState));

  @override
  _BottomTabState get _value => super._value as _BottomTabState;

  @override
  $Res call({
    Object? bottomTabType = freezed,
  }) {
    return _then(_BottomTabState(
      bottomTabType: bottomTabType == freezed
          ? _value.bottomTabType
          : bottomTabType // ignore: cast_nullable_to_non_nullable
              as BottomTabType,
    ));
  }
}

/// @nodoc

class _$_BottomTabState implements _BottomTabState {
  const _$_BottomTabState({this.bottomTabType = BottomTabType.Home});

  @JsonKey(defaultValue: BottomTabType.Home)
  @override

  /// タブタイプ
  final BottomTabType bottomTabType;

  @override
  String toString() {
    return 'BottomTabState(bottomTabType: $bottomTabType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BottomTabState &&
            (identical(other.bottomTabType, bottomTabType) ||
                const DeepCollectionEquality()
                    .equals(other.bottomTabType, bottomTabType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(bottomTabType);

  @JsonKey(ignore: true)
  @override
  _$BottomTabStateCopyWith<_BottomTabState> get copyWith =>
      __$BottomTabStateCopyWithImpl<_BottomTabState>(this, _$identity);
}

abstract class _BottomTabState implements BottomTabState {
  const factory _BottomTabState({BottomTabType bottomTabType}) =
      _$_BottomTabState;

  @override

  /// タブタイプ
  BottomTabType get bottomTabType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BottomTabStateCopyWith<_BottomTabState> get copyWith =>
      throw _privateConstructorUsedError;
}
