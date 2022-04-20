// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'leave_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LeaveTypeModel _$LeaveTypeModelFromJson(Map<String, dynamic> json) {
  return _LeaveTypeModel.fromJson(json);
}

/// @nodoc
class _$LeaveTypeModelTearOff {
  const _$LeaveTypeModelTearOff();

  _LeaveTypeModel call(
      {required String id,
      required String leaveTypeName,
      String comment = ''}) {
    return _LeaveTypeModel(
      id: id,
      leaveTypeName: leaveTypeName,
      comment: comment,
    );
  }

  LeaveTypeModel fromJson(Map<String, Object> json) {
    return LeaveTypeModel.fromJson(json);
  }
}

/// @nodoc
const $LeaveTypeModel = _$LeaveTypeModelTearOff();

/// @nodoc
mixin _$LeaveTypeModel {
  /// 休暇区分ID
  String get id => throw _privateConstructorUsedError;

  /// 休暇区分名称
  String get leaveTypeName => throw _privateConstructorUsedError;

  /// コメント
  String get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaveTypeModelCopyWith<LeaveTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveTypeModelCopyWith<$Res> {
  factory $LeaveTypeModelCopyWith(
          LeaveTypeModel value, $Res Function(LeaveTypeModel) then) =
      _$LeaveTypeModelCopyWithImpl<$Res>;
  $Res call({String id, String leaveTypeName, String comment});
}

/// @nodoc
class _$LeaveTypeModelCopyWithImpl<$Res>
    implements $LeaveTypeModelCopyWith<$Res> {
  _$LeaveTypeModelCopyWithImpl(this._value, this._then);

  final LeaveTypeModel _value;
  // ignore: unused_field
  final $Res Function(LeaveTypeModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? leaveTypeName = freezed,
    Object? comment = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      leaveTypeName: leaveTypeName == freezed
          ? _value.leaveTypeName
          : leaveTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LeaveTypeModelCopyWith<$Res>
    implements $LeaveTypeModelCopyWith<$Res> {
  factory _$LeaveTypeModelCopyWith(
          _LeaveTypeModel value, $Res Function(_LeaveTypeModel) then) =
      __$LeaveTypeModelCopyWithImpl<$Res>;
  @override
  $Res call({String id, String leaveTypeName, String comment});
}

/// @nodoc
class __$LeaveTypeModelCopyWithImpl<$Res>
    extends _$LeaveTypeModelCopyWithImpl<$Res>
    implements _$LeaveTypeModelCopyWith<$Res> {
  __$LeaveTypeModelCopyWithImpl(
      _LeaveTypeModel _value, $Res Function(_LeaveTypeModel) _then)
      : super(_value, (v) => _then(v as _LeaveTypeModel));

  @override
  _LeaveTypeModel get _value => super._value as _LeaveTypeModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? leaveTypeName = freezed,
    Object? comment = freezed,
  }) {
    return _then(_LeaveTypeModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      leaveTypeName: leaveTypeName == freezed
          ? _value.leaveTypeName
          : leaveTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LeaveTypeModel implements _LeaveTypeModel {
  const _$_LeaveTypeModel(
      {required this.id, required this.leaveTypeName, this.comment = ''});

  factory _$_LeaveTypeModel.fromJson(Map<String, dynamic> json) =>
      _$_$_LeaveTypeModelFromJson(json);

  @override

  /// 休暇区分ID
  final String id;
  @override

  /// 休暇区分名称
  final String leaveTypeName;
  @JsonKey(defaultValue: '')
  @override

  /// コメント
  final String comment;

  @override
  String toString() {
    return 'LeaveTypeModel(id: $id, leaveTypeName: $leaveTypeName, comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LeaveTypeModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.leaveTypeName, leaveTypeName) ||
                const DeepCollectionEquality()
                    .equals(other.leaveTypeName, leaveTypeName)) &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality().equals(other.comment, comment)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(leaveTypeName) ^
      const DeepCollectionEquality().hash(comment);

  @JsonKey(ignore: true)
  @override
  _$LeaveTypeModelCopyWith<_LeaveTypeModel> get copyWith =>
      __$LeaveTypeModelCopyWithImpl<_LeaveTypeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LeaveTypeModelToJson(this);
  }
}

abstract class _LeaveTypeModel implements LeaveTypeModel {
  const factory _LeaveTypeModel(
      {required String id,
      required String leaveTypeName,
      String comment}) = _$_LeaveTypeModel;

  factory _LeaveTypeModel.fromJson(Map<String, dynamic> json) =
      _$_LeaveTypeModel.fromJson;

  @override

  /// 休暇区分ID
  String get id => throw _privateConstructorUsedError;
  @override

  /// 休暇区分名称
  String get leaveTypeName => throw _privateConstructorUsedError;
  @override

  /// コメント
  String get comment => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LeaveTypeModelCopyWith<_LeaveTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
