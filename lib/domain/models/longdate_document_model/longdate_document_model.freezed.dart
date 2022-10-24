// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'longdate_document_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LongDateDocumentModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get expDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LongDateDocumentModelCopyWith<LongDateDocumentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LongDateDocumentModelCopyWith<$Res> {
  factory $LongDateDocumentModelCopyWith(LongDateDocumentModel value,
          $Res Function(LongDateDocumentModel) then) =
      _$LongDateDocumentModelCopyWithImpl<$Res, LongDateDocumentModel>;
  @useResult
  $Res call({String id, String title, DateTime expDate});
}

/// @nodoc
class _$LongDateDocumentModelCopyWithImpl<$Res,
        $Val extends LongDateDocumentModel>
    implements $LongDateDocumentModelCopyWith<$Res> {
  _$LongDateDocumentModelCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LongDateDocumentModelCopyWith<$Res>
    implements $LongDateDocumentModelCopyWith<$Res> {
  factory _$$_LongDateDocumentModelCopyWith(_$_LongDateDocumentModel value,
          $Res Function(_$_LongDateDocumentModel) then) =
      __$$_LongDateDocumentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, DateTime expDate});
}

/// @nodoc
class __$$_LongDateDocumentModelCopyWithImpl<$Res>
    extends _$LongDateDocumentModelCopyWithImpl<$Res, _$_LongDateDocumentModel>
    implements _$$_LongDateDocumentModelCopyWith<$Res> {
  __$$_LongDateDocumentModelCopyWithImpl(_$_LongDateDocumentModel _value,
      $Res Function(_$_LongDateDocumentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? expDate = null,
  }) {
    return _then(_$_LongDateDocumentModel(
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
    ));
  }
}

/// @nodoc

class _$_LongDateDocumentModel extends _LongDateDocumentModel {
  _$_LongDateDocumentModel(
      {required this.id, required this.title, required this.expDate})
      : super._();

  @override
  final String id;
  @override
  final String title;
  @override
  final DateTime expDate;

  @override
  String toString() {
    return 'LongDateDocumentModel(id: $id, title: $title, expDate: $expDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LongDateDocumentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.expDate, expDate) || other.expDate == expDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, expDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LongDateDocumentModelCopyWith<_$_LongDateDocumentModel> get copyWith =>
      __$$_LongDateDocumentModelCopyWithImpl<_$_LongDateDocumentModel>(
          this, _$identity);
}

abstract class _LongDateDocumentModel extends LongDateDocumentModel {
  factory _LongDateDocumentModel(
      {required final String id,
      required final String title,
      required final DateTime expDate}) = _$_LongDateDocumentModel;
  _LongDateDocumentModel._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  DateTime get expDate;
  @override
  @JsonKey(ignore: true)
  _$$_LongDateDocumentModelCopyWith<_$_LongDateDocumentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
