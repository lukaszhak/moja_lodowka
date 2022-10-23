// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_document_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ListDocumentModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListDocumentModelCopyWith<ListDocumentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListDocumentModelCopyWith<$Res> {
  factory $ListDocumentModelCopyWith(
          ListDocumentModel value, $Res Function(ListDocumentModel) then) =
      _$ListDocumentModelCopyWithImpl<$Res, ListDocumentModel>;
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class _$ListDocumentModelCopyWithImpl<$Res, $Val extends ListDocumentModel>
    implements $ListDocumentModelCopyWith<$Res> {
  _$ListDocumentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListDocumentModelCopyWith<$Res>
    implements $ListDocumentModelCopyWith<$Res> {
  factory _$$_ListDocumentModelCopyWith(_$_ListDocumentModel value,
          $Res Function(_$_ListDocumentModel) then) =
      __$$_ListDocumentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class __$$_ListDocumentModelCopyWithImpl<$Res>
    extends _$ListDocumentModelCopyWithImpl<$Res, _$_ListDocumentModel>
    implements _$$_ListDocumentModelCopyWith<$Res> {
  __$$_ListDocumentModelCopyWithImpl(
      _$_ListDocumentModel _value, $Res Function(_$_ListDocumentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$_ListDocumentModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ListDocumentModel extends _ListDocumentModel {
  _$_ListDocumentModel({required this.id, required this.title}) : super._();

  @override
  final String id;
  @override
  final String title;

  @override
  String toString() {
    return 'ListDocumentModel(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListDocumentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListDocumentModelCopyWith<_$_ListDocumentModel> get copyWith =>
      __$$_ListDocumentModelCopyWithImpl<_$_ListDocumentModel>(
          this, _$identity);
}

abstract class _ListDocumentModel extends ListDocumentModel {
  factory _ListDocumentModel(
      {required final String id,
      required final String title}) = _$_ListDocumentModel;
  _ListDocumentModel._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_ListDocumentModelCopyWith<_$_ListDocumentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
