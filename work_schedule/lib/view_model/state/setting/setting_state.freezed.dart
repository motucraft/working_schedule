// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SettingStateTearOff {
  const _$SettingStateTearOff();

  _SettingState call({bool isDarkTheme = false}) {
    return _SettingState(
      isDarkTheme: isDarkTheme,
    );
  }
}

/// @nodoc
const $SettingState = _$SettingStateTearOff();

/// @nodoc
mixin _$SettingState {
  /// true:ダークテーマ
  bool get isDarkTheme => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingStateCopyWith<SettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingStateCopyWith<$Res> {
  factory $SettingStateCopyWith(
          SettingState value, $Res Function(SettingState) then) =
      _$SettingStateCopyWithImpl<$Res>;
  $Res call({bool isDarkTheme});
}

/// @nodoc
class _$SettingStateCopyWithImpl<$Res> implements $SettingStateCopyWith<$Res> {
  _$SettingStateCopyWithImpl(this._value, this._then);

  final SettingState _value;
  // ignore: unused_field
  final $Res Function(SettingState) _then;

  @override
  $Res call({
    Object? isDarkTheme = freezed,
  }) {
    return _then(_value.copyWith(
      isDarkTheme: isDarkTheme == freezed
          ? _value.isDarkTheme
          : isDarkTheme // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SettingStateCopyWith<$Res>
    implements $SettingStateCopyWith<$Res> {
  factory _$SettingStateCopyWith(
          _SettingState value, $Res Function(_SettingState) then) =
      __$SettingStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isDarkTheme});
}

/// @nodoc
class __$SettingStateCopyWithImpl<$Res> extends _$SettingStateCopyWithImpl<$Res>
    implements _$SettingStateCopyWith<$Res> {
  __$SettingStateCopyWithImpl(
      _SettingState _value, $Res Function(_SettingState) _then)
      : super(_value, (v) => _then(v as _SettingState));

  @override
  _SettingState get _value => super._value as _SettingState;

  @override
  $Res call({
    Object? isDarkTheme = freezed,
  }) {
    return _then(_SettingState(
      isDarkTheme: isDarkTheme == freezed
          ? _value.isDarkTheme
          : isDarkTheme // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SettingState implements _SettingState {
  const _$_SettingState({this.isDarkTheme = false});

  @JsonKey(defaultValue: false)
  @override

  /// true:ダークテーマ
  final bool isDarkTheme;

  @override
  String toString() {
    return 'SettingState(isDarkTheme: $isDarkTheme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SettingState &&
            (identical(other.isDarkTheme, isDarkTheme) ||
                const DeepCollectionEquality()
                    .equals(other.isDarkTheme, isDarkTheme)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(isDarkTheme);

  @JsonKey(ignore: true)
  @override
  _$SettingStateCopyWith<_SettingState> get copyWith =>
      __$SettingStateCopyWithImpl<_SettingState>(this, _$identity);
}

abstract class _SettingState implements SettingState {
  const factory _SettingState({bool isDarkTheme}) = _$_SettingState;

  @override

  /// true:ダークテーマ
  bool get isDarkTheme => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SettingStateCopyWith<_SettingState> get copyWith =>
      throw _privateConstructorUsedError;
}
