// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'drug_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DrugPageState {
  List<DrugDocumentModel> get documents => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DrugPageStateCopyWith<DrugPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrugPageStateCopyWith<$Res> {
  factory $DrugPageStateCopyWith(
          DrugPageState value, $Res Function(DrugPageState) then) =
      _$DrugPageStateCopyWithImpl<$Res, DrugPageState>;
  @useResult
  $Res call(
      {List<DrugDocumentModel> documents, Status status, String? errorMessage});
}

/// @nodoc
class _$DrugPageStateCopyWithImpl<$Res, $Val extends DrugPageState>
    implements $DrugPageStateCopyWith<$Res> {
  _$DrugPageStateCopyWithImpl(this._value, this._then);

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
              as List<DrugDocumentModel>,
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
abstract class _$$_DrugPageStateCopyWith<$Res>
    implements $DrugPageStateCopyWith<$Res> {
  factory _$$_DrugPageStateCopyWith(
          _$_DrugPageState value, $Res Function(_$_DrugPageState) then) =
      __$$_DrugPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DrugDocumentModel> documents, Status status, String? errorMessage});
}

/// @nodoc
class __$$_DrugPageStateCopyWithImpl<$Res>
    extends _$DrugPageStateCopyWithImpl<$Res, _$_DrugPageState>
    implements _$$_DrugPageStateCopyWith<$Res> {
  __$$_DrugPageStateCopyWithImpl(
      _$_DrugPageState _value, $Res Function(_$_DrugPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documents = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_DrugPageState(
      documents: null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<DrugDocumentModel>,
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

class _$_DrugPageState implements _DrugPageState {
  _$_DrugPageState(
      {required final List<DrugDocumentModel> documents,
      required this.status,
      required this.errorMessage})
      : _documents = documents;

  final List<DrugDocumentModel> _documents;
  @override
  List<DrugDocumentModel> get documents {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  final Status status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'DrugPageState(documents: $documents, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DrugPageState &&
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
  _$$_DrugPageStateCopyWith<_$_DrugPageState> get copyWith =>
      __$$_DrugPageStateCopyWithImpl<_$_DrugPageState>(this, _$identity);
}

abstract class _DrugPageState implements DrugPageState {
  factory _DrugPageState(
      {required final List<DrugDocumentModel> documents,
      required final Status status,
      required final String? errorMessage}) = _$_DrugPageState;

  @override
  List<DrugDocumentModel> get documents;
  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_DrugPageStateCopyWith<_$_DrugPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
