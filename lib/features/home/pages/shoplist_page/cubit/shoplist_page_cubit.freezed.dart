// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shoplist_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShopListPageState {
  List<ShopListDocumentModel> get documents =>
      throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopListPageStateCopyWith<ShopListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopListPageStateCopyWith<$Res> {
  factory $ShopListPageStateCopyWith(
          ShopListPageState value, $Res Function(ShopListPageState) then) =
      _$ShopListPageStateCopyWithImpl<$Res, ShopListPageState>;
  @useResult
  $Res call(
      {List<ShopListDocumentModel> documents,
      Status status,
      String? errorMessage});
}

/// @nodoc
class _$ShopListPageStateCopyWithImpl<$Res, $Val extends ShopListPageState>
    implements $ShopListPageStateCopyWith<$Res> {
  _$ShopListPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documents = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      documents: null == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<ShopListDocumentModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShopListPageStateCopyWith<$Res>
    implements $ShopListPageStateCopyWith<$Res> {
  factory _$$_ShopListPageStateCopyWith(_$_ShopListPageState value,
          $Res Function(_$_ShopListPageState) then) =
      __$$_ShopListPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ShopListDocumentModel> documents,
      Status status,
      String? errorMessage});
}

/// @nodoc
class __$$_ShopListPageStateCopyWithImpl<$Res>
    extends _$ShopListPageStateCopyWithImpl<$Res, _$_ShopListPageState>
    implements _$$_ShopListPageStateCopyWith<$Res> {
  __$$_ShopListPageStateCopyWithImpl(
      _$_ShopListPageState _value, $Res Function(_$_ShopListPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documents = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_ShopListPageState(
      documents: null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<ShopListDocumentModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ShopListPageState implements _ShopListPageState {
  _$_ShopListPageState(
      {required final List<ShopListDocumentModel> documents,
      required this.status,
      required this.errorMessage})
      : _documents = documents;

  final List<ShopListDocumentModel> _documents;
  @override
  List<ShopListDocumentModel> get documents {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  final Status status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ShopListPageState(documents: $documents, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopListPageState &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_documents), status, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShopListPageStateCopyWith<_$_ShopListPageState> get copyWith =>
      __$$_ShopListPageStateCopyWithImpl<_$_ShopListPageState>(
          this, _$identity);
}

abstract class _ShopListPageState implements ShopListPageState {
  factory _ShopListPageState(
      {required final List<ShopListDocumentModel> documents,
      required final Status status,
      required final String? errorMessage}) = _$_ShopListPageState;

  @override
  List<ShopListDocumentModel> get documents;
  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ShopListPageStateCopyWith<_$_ShopListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
