// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expenses_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExpensesPageState {
  List<ExpensesDocumentModel> get documents =>
      throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExpensesPageStateCopyWith<ExpensesPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpensesPageStateCopyWith<$Res> {
  factory $ExpensesPageStateCopyWith(
          ExpensesPageState value, $Res Function(ExpensesPageState) then) =
      _$ExpensesPageStateCopyWithImpl<$Res, ExpensesPageState>;
  @useResult
  $Res call(
      {List<ExpensesDocumentModel> documents,
      Status status,
      String? errorMessage});
}

/// @nodoc
class _$ExpensesPageStateCopyWithImpl<$Res, $Val extends ExpensesPageState>
    implements $ExpensesPageStateCopyWith<$Res> {
  _$ExpensesPageStateCopyWithImpl(this._value, this._then);

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
              as List<ExpensesDocumentModel>,
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
abstract class _$$_ExpensesPageStateCopyWith<$Res>
    implements $ExpensesPageStateCopyWith<$Res> {
  factory _$$_ExpensesPageStateCopyWith(_$_ExpensesPageState value,
          $Res Function(_$_ExpensesPageState) then) =
      __$$_ExpensesPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ExpensesDocumentModel> documents,
      Status status,
      String? errorMessage});
}

/// @nodoc
class __$$_ExpensesPageStateCopyWithImpl<$Res>
    extends _$ExpensesPageStateCopyWithImpl<$Res, _$_ExpensesPageState>
    implements _$$_ExpensesPageStateCopyWith<$Res> {
  __$$_ExpensesPageStateCopyWithImpl(
      _$_ExpensesPageState _value, $Res Function(_$_ExpensesPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documents = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_ExpensesPageState(
      documents: null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<ExpensesDocumentModel>,
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

class _$_ExpensesPageState implements _ExpensesPageState {
  _$_ExpensesPageState(
      {required final List<ExpensesDocumentModel> documents,
      required this.status,
      required this.errorMessage})
      : _documents = documents;

  final List<ExpensesDocumentModel> _documents;
  @override
  List<ExpensesDocumentModel> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  final Status status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ExpensesPageState(documents: $documents, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExpensesPageState &&
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
  _$$_ExpensesPageStateCopyWith<_$_ExpensesPageState> get copyWith =>
      __$$_ExpensesPageStateCopyWithImpl<_$_ExpensesPageState>(
          this, _$identity);
}

abstract class _ExpensesPageState implements ExpensesPageState {
  factory _ExpensesPageState(
      {required final List<ExpensesDocumentModel> documents,
      required final Status status,
      required final String? errorMessage}) = _$_ExpensesPageState;

  @override
  List<ExpensesDocumentModel> get documents;
  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ExpensesPageStateCopyWith<_$_ExpensesPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
