// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CalendarStateTearOff {
  const _$CalendarStateTearOff();

  _CalendarState call(
      {CalendarFormat calendarFormat = CalendarFormat.month,
      required DateTime focusedDay,
      required DateTime selectedDay}) {
    return _CalendarState(
      calendarFormat: calendarFormat,
      focusedDay: focusedDay,
      selectedDay: selectedDay,
    );
  }
}

/// @nodoc
const $CalendarState = _$CalendarStateTearOff();

/// @nodoc
mixin _$CalendarState {
  /// カレンダーフォーマット
  CalendarFormat get calendarFormat => throw _privateConstructorUsedError;

  /// フォーカス日
  DateTime get focusedDay => throw _privateConstructorUsedError;

  /// カレンダー選択日
  DateTime get selectedDay => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarStateCopyWith<CalendarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
          CalendarState value, $Res Function(CalendarState) then) =
      _$CalendarStateCopyWithImpl<$Res>;
  $Res call(
      {CalendarFormat calendarFormat,
      DateTime focusedDay,
      DateTime selectedDay});
}

/// @nodoc
class _$CalendarStateCopyWithImpl<$Res>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._value, this._then);

  final CalendarState _value;
  // ignore: unused_field
  final $Res Function(CalendarState) _then;

  @override
  $Res call({
    Object? calendarFormat = freezed,
    Object? focusedDay = freezed,
    Object? selectedDay = freezed,
  }) {
    return _then(_value.copyWith(
      calendarFormat: calendarFormat == freezed
          ? _value.calendarFormat
          : calendarFormat // ignore: cast_nullable_to_non_nullable
              as CalendarFormat,
      focusedDay: focusedDay == freezed
          ? _value.focusedDay
          : focusedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedDay: selectedDay == freezed
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$CalendarStateCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$CalendarStateCopyWith(
          _CalendarState value, $Res Function(_CalendarState) then) =
      __$CalendarStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {CalendarFormat calendarFormat,
      DateTime focusedDay,
      DateTime selectedDay});
}

/// @nodoc
class __$CalendarStateCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res>
    implements _$CalendarStateCopyWith<$Res> {
  __$CalendarStateCopyWithImpl(
      _CalendarState _value, $Res Function(_CalendarState) _then)
      : super(_value, (v) => _then(v as _CalendarState));

  @override
  _CalendarState get _value => super._value as _CalendarState;

  @override
  $Res call({
    Object? calendarFormat = freezed,
    Object? focusedDay = freezed,
    Object? selectedDay = freezed,
  }) {
    return _then(_CalendarState(
      calendarFormat: calendarFormat == freezed
          ? _value.calendarFormat
          : calendarFormat // ignore: cast_nullable_to_non_nullable
              as CalendarFormat,
      focusedDay: focusedDay == freezed
          ? _value.focusedDay
          : focusedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedDay: selectedDay == freezed
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_CalendarState implements _CalendarState {
  const _$_CalendarState(
      {this.calendarFormat = CalendarFormat.month,
      required this.focusedDay,
      required this.selectedDay});

  @JsonKey(defaultValue: CalendarFormat.month)
  @override

  /// カレンダーフォーマット
  final CalendarFormat calendarFormat;
  @override

  /// フォーカス日
  final DateTime focusedDay;
  @override

  /// カレンダー選択日
  final DateTime selectedDay;

  @override
  String toString() {
    return 'CalendarState(calendarFormat: $calendarFormat, focusedDay: $focusedDay, selectedDay: $selectedDay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CalendarState &&
            (identical(other.calendarFormat, calendarFormat) ||
                const DeepCollectionEquality()
                    .equals(other.calendarFormat, calendarFormat)) &&
            (identical(other.focusedDay, focusedDay) ||
                const DeepCollectionEquality()
                    .equals(other.focusedDay, focusedDay)) &&
            (identical(other.selectedDay, selectedDay) ||
                const DeepCollectionEquality()
                    .equals(other.selectedDay, selectedDay)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(calendarFormat) ^
      const DeepCollectionEquality().hash(focusedDay) ^
      const DeepCollectionEquality().hash(selectedDay);

  @JsonKey(ignore: true)
  @override
  _$CalendarStateCopyWith<_CalendarState> get copyWith =>
      __$CalendarStateCopyWithImpl<_CalendarState>(this, _$identity);
}

abstract class _CalendarState implements CalendarState {
  const factory _CalendarState(
      {CalendarFormat calendarFormat,
      required DateTime focusedDay,
      required DateTime selectedDay}) = _$_CalendarState;

  @override

  /// カレンダーフォーマット
  CalendarFormat get calendarFormat => throw _privateConstructorUsedError;
  @override

  /// フォーカス日
  DateTime get focusedDay => throw _privateConstructorUsedError;
  @override

  /// カレンダー選択日
  DateTime get selectedDay => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CalendarStateCopyWith<_CalendarState> get copyWith =>
      throw _privateConstructorUsedError;
}
