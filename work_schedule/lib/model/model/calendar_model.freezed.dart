// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'calendar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CalendarModelTearOff {
  const _$CalendarModelTearOff();

  _CalendarModel call({List<dynamic> selectedEvents = const []}) {
    return _CalendarModel(
      selectedEvents: selectedEvents,
    );
  }
}

/// @nodoc
const $CalendarModel = _$CalendarModelTearOff();

/// @nodoc
mixin _$CalendarModel {
  List<dynamic> get selectedEvents => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarModelCopyWith<CalendarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarModelCopyWith<$Res> {
  factory $CalendarModelCopyWith(
          CalendarModel value, $Res Function(CalendarModel) then) =
      _$CalendarModelCopyWithImpl<$Res>;
  $Res call({List<dynamic> selectedEvents});
}

/// @nodoc
class _$CalendarModelCopyWithImpl<$Res>
    implements $CalendarModelCopyWith<$Res> {
  _$CalendarModelCopyWithImpl(this._value, this._then);

  final CalendarModel _value;
  // ignore: unused_field
  final $Res Function(CalendarModel) _then;

  @override
  $Res call({
    Object? selectedEvents = freezed,
  }) {
    return _then(_value.copyWith(
      selectedEvents: selectedEvents == freezed
          ? _value.selectedEvents
          : selectedEvents // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$CalendarModelCopyWith<$Res>
    implements $CalendarModelCopyWith<$Res> {
  factory _$CalendarModelCopyWith(
          _CalendarModel value, $Res Function(_CalendarModel) then) =
      __$CalendarModelCopyWithImpl<$Res>;
  @override
  $Res call({List<dynamic> selectedEvents});
}

/// @nodoc
class __$CalendarModelCopyWithImpl<$Res>
    extends _$CalendarModelCopyWithImpl<$Res>
    implements _$CalendarModelCopyWith<$Res> {
  __$CalendarModelCopyWithImpl(
      _CalendarModel _value, $Res Function(_CalendarModel) _then)
      : super(_value, (v) => _then(v as _CalendarModel));

  @override
  _CalendarModel get _value => super._value as _CalendarModel;

  @override
  $Res call({
    Object? selectedEvents = freezed,
  }) {
    return _then(_CalendarModel(
      selectedEvents: selectedEvents == freezed
          ? _value.selectedEvents
          : selectedEvents // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$_CalendarModel implements _CalendarModel {
  const _$_CalendarModel({this.selectedEvents = const []});

  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> selectedEvents;

  @override
  String toString() {
    return 'CalendarModel(selectedEvents: $selectedEvents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CalendarModel &&
            (identical(other.selectedEvents, selectedEvents) ||
                const DeepCollectionEquality()
                    .equals(other.selectedEvents, selectedEvents)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectedEvents);

  @JsonKey(ignore: true)
  @override
  _$CalendarModelCopyWith<_CalendarModel> get copyWith =>
      __$CalendarModelCopyWithImpl<_CalendarModel>(this, _$identity);
}

abstract class _CalendarModel implements CalendarModel {
  const factory _CalendarModel({List<dynamic> selectedEvents}) =
      _$_CalendarModel;

  @override
  List<dynamic> get selectedEvents => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CalendarModelCopyWith<_CalendarModel> get copyWith =>
      throw _privateConstructorUsedError;
}
