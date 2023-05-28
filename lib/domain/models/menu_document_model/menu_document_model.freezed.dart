// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_document_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MenuDocumentModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  QueryDocumentSnapshot<Object?>? get document =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuDocumentModelCopyWith<MenuDocumentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuDocumentModelCopyWith<$Res> {
  factory $MenuDocumentModelCopyWith(
          MenuDocumentModel value, $Res Function(MenuDocumentModel) then) =
      _$MenuDocumentModelCopyWithImpl<$Res, MenuDocumentModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      QueryDocumentSnapshot<Object?>? document});
}

/// @nodoc
class _$MenuDocumentModelCopyWithImpl<$Res, $Val extends MenuDocumentModel>
    implements $MenuDocumentModelCopyWith<$Res> {
  _$MenuDocumentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? document = freezed,
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
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      document: freezed == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as QueryDocumentSnapshot<Object?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MenuDocumentModelCopyWith<$Res>
    implements $MenuDocumentModelCopyWith<$Res> {
  factory _$$_MenuDocumentModelCopyWith(_$_MenuDocumentModel value,
          $Res Function(_$_MenuDocumentModel) then) =
      __$$_MenuDocumentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      QueryDocumentSnapshot<Object?>? document});
}

/// @nodoc
class __$$_MenuDocumentModelCopyWithImpl<$Res>
    extends _$MenuDocumentModelCopyWithImpl<$Res, _$_MenuDocumentModel>
    implements _$$_MenuDocumentModelCopyWith<$Res> {
  __$$_MenuDocumentModelCopyWithImpl(
      _$_MenuDocumentModel _value, $Res Function(_$_MenuDocumentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? document = freezed,
  }) {
    return _then(_$_MenuDocumentModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      document: freezed == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as QueryDocumentSnapshot<Object?>?,
    ));
  }
}

/// @nodoc

class _$_MenuDocumentModel extends _MenuDocumentModel {
  _$_MenuDocumentModel(
      {required this.id,
      required this.title,
      required this.content,
      this.document})
      : super._();

  @override
  final String id;
  @override
  final String title;
  @override
  final String content;
  @override
  final QueryDocumentSnapshot<Object?>? document;

  @override
  String toString() {
    return 'MenuDocumentModel(id: $id, title: $title, content: $content, document: $document)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenuDocumentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.document, document) ||
                other.document == document));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, content, document);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MenuDocumentModelCopyWith<_$_MenuDocumentModel> get copyWith =>
      __$$_MenuDocumentModelCopyWithImpl<_$_MenuDocumentModel>(
          this, _$identity);
}

abstract class _MenuDocumentModel extends MenuDocumentModel {
  factory _MenuDocumentModel(
      {required final String id,
      required final String title,
      required final String content,
      final QueryDocumentSnapshot<Object?>? document}) = _$_MenuDocumentModel;
  _MenuDocumentModel._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  QueryDocumentSnapshot<Object?>? get document;
  @override
  @JsonKey(ignore: true)
  _$$_MenuDocumentModelCopyWith<_$_MenuDocumentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
