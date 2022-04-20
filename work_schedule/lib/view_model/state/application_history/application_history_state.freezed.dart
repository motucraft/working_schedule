// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'application_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ApplicationHistoryStateTearOff {
  const _$ApplicationHistoryStateTearOff();

  _ApplicationHistoryState call(
      {List<ApplicationModel> applicationHistoryList = const [],
      ApplicationModel? applicationHistory,
      required DateTime monthFilter,
      required TextEditingController textEditingControllerMonthFilter}) {
    return _ApplicationHistoryState(
      applicationHistoryList: applicationHistoryList,
      applicationHistory: applicationHistory,
      monthFilter: monthFilter,
      textEditingControllerMonthFilter: textEditingControllerMonthFilter,
    );
  }
}

/// @nodoc
const $ApplicationHistoryState = _$ApplicationHistoryStateTearOff();

/// @nodoc
mixin _$ApplicationHistoryState {
  /// 申請履歴リスト
  List<ApplicationModel> get applicationHistoryList =>
      throw _privateConstructorUsedError;

  /// 申請履歴
  ApplicationModel? get applicationHistory =>
      throw _privateConstructorUsedError;

  /// Monthフィルター
  DateTime get monthFilter => throw _privateConstructorUsedError;

  /// 勤務日(テキスト)
  TextEditingController get textEditingControllerMonthFilter =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApplicationHistoryStateCopyWith<ApplicationHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationHistoryStateCopyWith<$Res> {
  factory $ApplicationHistoryStateCopyWith(ApplicationHistoryState value,
          $Res Function(ApplicationHistoryState) then) =
      _$ApplicationHistoryStateCopyWithImpl<$Res>;
  $Res call(
      {List<ApplicationModel> applicationHistoryList,
      ApplicationModel? applicationHistory,
      DateTime monthFilter,
      TextEditingController textEditingControllerMonthFilter});

  $ApplicationModelCopyWith<$Res>? get applicationHistory;
}

/// @nodoc
class _$ApplicationHistoryStateCopyWithImpl<$Res>
    implements $ApplicationHistoryStateCopyWith<$Res> {
  _$ApplicationHistoryStateCopyWithImpl(this._value, this._then);

  final ApplicationHistoryState _value;
  // ignore: unused_field
  final $Res Function(ApplicationHistoryState) _then;

  @override
  $Res call({
    Object? applicationHistoryList = freezed,
    Object? applicationHistory = freezed,
    Object? monthFilter = freezed,
    Object? textEditingControllerMonthFilter = freezed,
  }) {
    return _then(_value.copyWith(
      applicationHistoryList: applicationHistoryList == freezed
          ? _value.applicationHistoryList
          : applicationHistoryList // ignore: cast_nullable_to_non_nullable
              as List<ApplicationModel>,
      applicationHistory: applicationHistory == freezed
          ? _value.applicationHistory
          : applicationHistory // ignore: cast_nullable_to_non_nullable
              as ApplicationModel?,
      monthFilter: monthFilter == freezed
          ? _value.monthFilter
          : monthFilter // ignore: cast_nullable_to_non_nullable
              as DateTime,
      textEditingControllerMonthFilter: textEditingControllerMonthFilter ==
              freezed
          ? _value.textEditingControllerMonthFilter
          : textEditingControllerMonthFilter // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }

  @override
  $ApplicationModelCopyWith<$Res>? get applicationHistory {
    if (_value.applicationHistory == null) {
      return null;
    }

    return $ApplicationModelCopyWith<$Res>(_value.applicationHistory!, (value) {
      return _then(_value.copyWith(applicationHistory: value));
    });
  }
}

/// @nodoc
abstract class _$ApplicationHistoryStateCopyWith<$Res>
    implements $ApplicationHistoryStateCopyWith<$Res> {
  factory _$ApplicationHistoryStateCopyWith(_ApplicationHistoryState value,
          $Res Function(_ApplicationHistoryState) then) =
      __$ApplicationHistoryStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<ApplicationModel> applicationHistoryList,
      ApplicationModel? applicationHistory,
      DateTime monthFilter,
      TextEditingController textEditingControllerMonthFilter});

  @override
  $ApplicationModelCopyWith<$Res>? get applicationHistory;
}

/// @nodoc
class __$ApplicationHistoryStateCopyWithImpl<$Res>
    extends _$ApplicationHistoryStateCopyWithImpl<$Res>
    implements _$ApplicationHistoryStateCopyWith<$Res> {
  __$ApplicationHistoryStateCopyWithImpl(_ApplicationHistoryState _value,
      $Res Function(_ApplicationHistoryState) _then)
      : super(_value, (v) => _then(v as _ApplicationHistoryState));

  @override
  _ApplicationHistoryState get _value =>
      super._value as _ApplicationHistoryState;

  @override
  $Res call({
    Object? applicationHistoryList = freezed,
    Object? applicationHistory = freezed,
    Object? monthFilter = freezed,
    Object? textEditingControllerMonthFilter = freezed,
  }) {
    return _then(_ApplicationHistoryState(
      applicationHistoryList: applicationHistoryList == freezed
          ? _value.applicationHistoryList
          : applicationHistoryList // ignore: cast_nullable_to_non_nullable
              as List<ApplicationModel>,
      applicationHistory: applicationHistory == freezed
          ? _value.applicationHistory
          : applicationHistory // ignore: cast_nullable_to_non_nullable
              as ApplicationModel?,
      monthFilter: monthFilter == freezed
          ? _value.monthFilter
          : monthFilter // ignore: cast_nullable_to_non_nullable
              as DateTime,
      textEditingControllerMonthFilter: textEditingControllerMonthFilter ==
              freezed
          ? _value.textEditingControllerMonthFilter
          : textEditingControllerMonthFilter // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _$_ApplicationHistoryState implements _ApplicationHistoryState {
  const _$_ApplicationHistoryState(
      {this.applicationHistoryList = const [],
      this.applicationHistory,
      required this.monthFilter,
      required this.textEditingControllerMonthFilter});

  @JsonKey(defaultValue: const [])
  @override

  /// 申請履歴リスト
  final List<ApplicationModel> applicationHistoryList;
  @override

  /// 申請履歴
  final ApplicationModel? applicationHistory;
  @override

  /// Monthフィルター
  final DateTime monthFilter;
  @override

  /// 勤務日(テキスト)
  final TextEditingController textEditingControllerMonthFilter;

  @override
  String toString() {
    return 'ApplicationHistoryState(applicationHistoryList: $applicationHistoryList, applicationHistory: $applicationHistory, monthFilter: $monthFilter, textEditingControllerMonthFilter: $textEditingControllerMonthFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ApplicationHistoryState &&
            (identical(other.applicationHistoryList, applicationHistoryList) ||
                const DeepCollectionEquality().equals(
                    other.applicationHistoryList, applicationHistoryList)) &&
            (identical(other.applicationHistory, applicationHistory) ||
                const DeepCollectionEquality()
                    .equals(other.applicationHistory, applicationHistory)) &&
            (identical(other.monthFilter, monthFilter) ||
                const DeepCollectionEquality()
                    .equals(other.monthFilter, monthFilter)) &&
            (identical(other.textEditingControllerMonthFilter,
                    textEditingControllerMonthFilter) ||
                const DeepCollectionEquality().equals(
                    other.textEditingControllerMonthFilter,
                    textEditingControllerMonthFilter)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(applicationHistoryList) ^
      const DeepCollectionEquality().hash(applicationHistory) ^
      const DeepCollectionEquality().hash(monthFilter) ^
      const DeepCollectionEquality().hash(textEditingControllerMonthFilter);

  @JsonKey(ignore: true)
  @override
  _$ApplicationHistoryStateCopyWith<_ApplicationHistoryState> get copyWith =>
      __$ApplicationHistoryStateCopyWithImpl<_ApplicationHistoryState>(
          this, _$identity);
}

abstract class _ApplicationHistoryState implements ApplicationHistoryState {
  const factory _ApplicationHistoryState(
          {List<ApplicationModel> applicationHistoryList,
          ApplicationModel? applicationHistory,
          required DateTime monthFilter,
          required TextEditingController textEditingControllerMonthFilter}) =
      _$_ApplicationHistoryState;

  @override

  /// 申請履歴リスト
  List<ApplicationModel> get applicationHistoryList =>
      throw _privateConstructorUsedError;
  @override

  /// 申請履歴
  ApplicationModel? get applicationHistory =>
      throw _privateConstructorUsedError;
  @override

  /// Monthフィルター
  DateTime get monthFilter => throw _privateConstructorUsedError;
  @override

  /// 勤務日(テキスト)
  TextEditingController get textEditingControllerMonthFilter =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ApplicationHistoryStateCopyWith<_ApplicationHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}
