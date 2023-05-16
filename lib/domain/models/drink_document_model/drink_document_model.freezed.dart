// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drink_document_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DrinkDocumentModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get expDate => throw _privateConstructorUsedError;
  int get notificationId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DrinkDocumentModelCopyWith<DrinkDocumentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrinkDocumentModelCopyWith<$Res> {
  factory $DrinkDocumentModelCopyWith(
          DrinkDocumentModel value, $Res Function(DrinkDocumentModel) then) =
      _$DrinkDocumentModelCopyWithImpl<$Res, DrinkDocumentModel>;
  @useResult
  $Res call({String id, String title, DateTime expDate, int notificationId});
}

/// @nodoc
class _$DrinkDocumentModelCopyWithImpl<$Res, $Val extends DrinkDocumentModel>
    implements $DrinkDocumentModelCopyWith<$Res> {
  _$DrinkDocumentModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_DrinkDocumentModelCopyWith<$Res>
    implements $DrinkDocumentModelCopyWith<$Res> {
  factory _$$_DrinkDocumentModelCopyWith(_$_DrinkDocumentModel value,
          $Res Function(_$_DrinkDocumentModel) then) =
      __$$_DrinkDocumentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, DateTime expDate, int notificationId});
}

/// @nodoc
class __$$_DrinkDocumentModelCopyWithImpl<$Res>
    extends _$DrinkDocumentModelCopyWithImpl<$Res, _$_DrinkDocumentModel>
    implements _$$_DrinkDocumentModelCopyWith<$Res> {
  __$$_DrinkDocumentModelCopyWithImpl(
      _$_DrinkDocumentModel _value, $Res Function(_$_DrinkDocumentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? expDate = null,
    Object? notificationId = null,
  }) {
    return _then(_$_DrinkDocumentModel(
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

class _$_DrinkDocumentModel extends _DrinkDocumentModel {
  _$_DrinkDocumentModel(
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
    return 'DrinkDocumentModel(id: $id, title: $title, expDate: $expDate, notificationId: $notificationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DrinkDocumentModel &&
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
  _$$_DrinkDocumentModelCopyWith<_$_DrinkDocumentModel> get copyWith =>
      __$$_DrinkDocumentModelCopyWithImpl<_$_DrinkDocumentModel>(
          this, _$identity);
}

abstract class _DrinkDocumentModel extends DrinkDocumentModel {
  factory _DrinkDocumentModel(
      {required final String id,
      required final String title,
      required final DateTime expDate,
      required final int notificationId}) = _$_DrinkDocumentModel;
  _DrinkDocumentModel._() : super._();

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
  _$$_DrinkDocumentModelCopyWith<_$_DrinkDocumentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
