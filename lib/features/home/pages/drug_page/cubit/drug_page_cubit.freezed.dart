// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  int? get notificationId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  DateTime? get expDate => throw _privateConstructorUsedError;

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
      {List<DrugDocumentModel> documents,
      Status status,
      String? errorMessage,
      int? notificationId,
      String? title,
      DateTime? expDate});
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
    Object? notificationId = freezed,
    Object? title = freezed,
    Object? expDate = freezed,
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
      notificationId: freezed == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      expDate: freezed == expDate
          ? _value.expDate
          : expDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      {List<DrugDocumentModel> documents,
      Status status,
      String? errorMessage,
      int? notificationId,
      String? title,
      DateTime? expDate});
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
    Object? notificationId = freezed,
    Object? title = freezed,
    Object? expDate = freezed,
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
      notificationId: freezed == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      expDate: freezed == expDate
          ? _value.expDate
          : expDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_DrugPageState implements _DrugPageState {
  _$_DrugPageState(
      {required final List<DrugDocumentModel> documents,
      required this.status,
      required this.errorMessage,
      this.notificationId,
      this.title,
      this.expDate})
      : _documents = documents;

  final List<DrugDocumentModel> _documents;
  @override
  List<DrugDocumentModel> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  final Status status;
  @override
  final String? errorMessage;
  @override
  final int? notificationId;
  @override
  final String? title;
  @override
  final DateTime? expDate;

  @override
  String toString() {
    return 'DrugPageState(documents: $documents, status: $status, errorMessage: $errorMessage, notificationId: $notificationId, title: $title, expDate: $expDate)';
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
                other.errorMessage == errorMessage) &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.expDate, expDate) || other.expDate == expDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_documents),
      status,
      errorMessage,
      notificationId,
      title,
      expDate);

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
      required final String? errorMessage,
      final int? notificationId,
      final String? title,
      final DateTime? expDate}) = _$_DrugPageState;

  @override
  List<DrugDocumentModel> get documents;
  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  int? get notificationId;
  @override
  String? get title;
  @override
  DateTime? get expDate;
  @override
  @JsonKey(ignore: true)
  _$$_DrugPageStateCopyWith<_$_DrugPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
