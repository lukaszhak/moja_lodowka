// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fridge_document_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FridgeDocumentModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get expDate => throw _privateConstructorUsedError;
  int get notificationId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FridgeDocumentModelCopyWith<FridgeDocumentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FridgeDocumentModelCopyWith<$Res> {
  factory $FridgeDocumentModelCopyWith(
          FridgeDocumentModel value, $Res Function(FridgeDocumentModel) then) =
      _$FridgeDocumentModelCopyWithImpl<$Res, FridgeDocumentModel>;
  @useResult
  $Res call({String id, String title, DateTime expDate, int notificationId});
}

/// @nodoc
class _$FridgeDocumentModelCopyWithImpl<$Res, $Val extends FridgeDocumentModel>
    implements $FridgeDocumentModelCopyWith<$Res> {
  _$FridgeDocumentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? expDate = null,
    Object? notificationId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      expDate: null == expDate
          ? _value.expDate
          : expDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FridgeDocumentModelCopyWith<$Res>
    implements $FridgeDocumentModelCopyWith<$Res> {
  factory _$$_FridgeDocumentModelCopyWith(_$_FridgeDocumentModel value,
          $Res Function(_$_FridgeDocumentModel) then) =
      __$$_FridgeDocumentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, DateTime expDate, int notificationId});
}

/// @nodoc
class __$$_FridgeDocumentModelCopyWithImpl<$Res>
    extends _$FridgeDocumentModelCopyWithImpl<$Res, _$_FridgeDocumentModel>
    implements _$$_FridgeDocumentModelCopyWith<$Res> {
  __$$_FridgeDocumentModelCopyWithImpl(_$_FridgeDocumentModel _value,
      $Res Function(_$_FridgeDocumentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? expDate = null,
    Object? notificationId = null,
  }) {
    return _then(_$_FridgeDocumentModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      expDate: null == expDate
          ? _value.expDate
          : expDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FridgeDocumentModel extends _FridgeDocumentModel {
  _$_FridgeDocumentModel(
      {required this.id,
      required this.title,
      required this.expDate,
      required this.notificationId})
      : super._();

  @override
  final String id;
  @override
  final String title;
  @override
  final DateTime expDate;
  @override
  final int notificationId;

  @override
  String toString() {
    return 'FridgeDocumentModel(id: $id, title: $title, expDate: $expDate, notificationId: $notificationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FridgeDocumentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.expDate, expDate) || other.expDate == expDate) &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, expDate, notificationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FridgeDocumentModelCopyWith<_$_FridgeDocumentModel> get copyWith =>
      __$$_FridgeDocumentModelCopyWithImpl<_$_FridgeDocumentModel>(
          this, _$identity);
}

abstract class _FridgeDocumentModel extends FridgeDocumentModel {
  factory _FridgeDocumentModel(
      {required final String id,
      required final String title,
      required final DateTime expDate,
      required final int notificationId}) = _$_FridgeDocumentModel;
  _FridgeDocumentModel._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  DateTime get expDate;
  @override
  int get notificationId;
  @override
  @JsonKey(ignore: true)
  _$$_FridgeDocumentModelCopyWith<_$_FridgeDocumentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
