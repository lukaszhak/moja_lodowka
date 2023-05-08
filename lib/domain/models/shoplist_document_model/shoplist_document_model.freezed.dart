// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shoplist_document_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShopListDocumentModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get isChecked => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopListDocumentModelCopyWith<ShopListDocumentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopListDocumentModelCopyWith<$Res> {
  factory $ShopListDocumentModelCopyWith(ShopListDocumentModel value,
          $Res Function(ShopListDocumentModel) then) =
      _$ShopListDocumentModelCopyWithImpl<$Res, ShopListDocumentModel>;
  @useResult
  $Res call({String id, String title, bool isChecked});
}

/// @nodoc
class _$ShopListDocumentModelCopyWithImpl<$Res,
        $Val extends ShopListDocumentModel>
    implements $ShopListDocumentModelCopyWith<$Res> {
  _$ShopListDocumentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isChecked = null,
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
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShopListDocumentModelCopyWith<$Res>
    implements $ShopListDocumentModelCopyWith<$Res> {
  factory _$$_ShopListDocumentModelCopyWith(_$_ShopListDocumentModel value,
          $Res Function(_$_ShopListDocumentModel) then) =
      __$$_ShopListDocumentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, bool isChecked});
}

/// @nodoc
class __$$_ShopListDocumentModelCopyWithImpl<$Res>
    extends _$ShopListDocumentModelCopyWithImpl<$Res, _$_ShopListDocumentModel>
    implements _$$_ShopListDocumentModelCopyWith<$Res> {
  __$$_ShopListDocumentModelCopyWithImpl(_$_ShopListDocumentModel _value,
      $Res Function(_$_ShopListDocumentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isChecked = null,
  }) {
    return _then(_$_ShopListDocumentModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ShopListDocumentModel extends _ShopListDocumentModel {
  _$_ShopListDocumentModel(
      {required this.id, required this.title, required this.isChecked})
      : super._();

  @override
  final String id;
  @override
  final String title;
  @override
  final bool isChecked;

  @override
  String toString() {
    return 'ShopListDocumentModel(id: $id, title: $title, isChecked: $isChecked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopListDocumentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, isChecked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShopListDocumentModelCopyWith<_$_ShopListDocumentModel> get copyWith =>
      __$$_ShopListDocumentModelCopyWithImpl<_$_ShopListDocumentModel>(
          this, _$identity);
}

abstract class _ShopListDocumentModel extends ShopListDocumentModel {
  factory _ShopListDocumentModel(
      {required final String id,
      required final String title,
      required final bool isChecked}) = _$_ShopListDocumentModel;
  _ShopListDocumentModel._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  bool get isChecked;
  @override
  @JsonKey(ignore: true)
  _$$_ShopListDocumentModelCopyWith<_$_ShopListDocumentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
