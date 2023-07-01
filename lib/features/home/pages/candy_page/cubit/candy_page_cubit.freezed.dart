// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'candy_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CandyPageState {
  List<CandyDocumentModel> get documents => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  int? get notificationId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  DateTime? get expDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CandyPageStateCopyWith<CandyPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandyPageStateCopyWith<$Res> {
  factory $CandyPageStateCopyWith(
          CandyPageState value, $Res Function(CandyPageState) then) =
      _$CandyPageStateCopyWithImpl<$Res, CandyPageState>;
  @useResult
  $Res call(
      {List<CandyDocumentModel> documents,
      Status status,
      String? errorMessage,
      int? notificationId,
      String? title,
      DateTime? expDate});
}

/// @nodoc
class _$CandyPageStateCopyWithImpl<$Res, $Val extends CandyPageState>
    implements $CandyPageStateCopyWith<$Res> {
  _$CandyPageStateCopyWithImpl(this._value, this._then);

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
              as List<CandyDocumentModel>,
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
abstract class _$$_CandyPageStateCopyWith<$Res>
    implements $CandyPageStateCopyWith<$Res> {
  factory _$$_CandyPageStateCopyWith(
          _$_CandyPageState value, $Res Function(_$_CandyPageState) then) =
      __$$_CandyPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CandyDocumentModel> documents,
      Status status,
      String? errorMessage,
      int? notificationId,
      String? title,
      DateTime? expDate});
}

/// @nodoc
class __$$_CandyPageStateCopyWithImpl<$Res>
    extends _$CandyPageStateCopyWithImpl<$Res, _$_CandyPageState>
    implements _$$_CandyPageStateCopyWith<$Res> {
  __$$_CandyPageStateCopyWithImpl(
      _$_CandyPageState _value, $Res Function(_$_CandyPageState) _then)
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
    return _then(_$_CandyPageState(
      documents: null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<CandyDocumentModel>,
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

class _$_CandyPageState implements _CandyPageState {
  _$_CandyPageState(
      {required final List<CandyDocumentModel> documents,
      required this.status,
      required this.errorMessage,
      this.notificationId,
      this.title,
      this.expDate})
      : _documents = documents;

  final List<CandyDocumentModel> _documents;
  @override
  List<CandyDocumentModel> get documents {
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
    return 'CandyPageState(documents: $documents, status: $status, errorMessage: $errorMessage, notificationId: $notificationId, title: $title, expDate: $expDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CandyPageState &&
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
  _$$_CandyPageStateCopyWith<_$_CandyPageState> get copyWith =>
      __$$_CandyPageStateCopyWithImpl<_$_CandyPageState>(this, _$identity);
}

abstract class _CandyPageState implements CandyPageState {
  factory _CandyPageState(
      {required final List<CandyDocumentModel> documents,
      required final Status status,
      required final String? errorMessage,
      final int? notificationId,
      final String? title,
      final DateTime? expDate}) = _$_CandyPageState;

  @override
  List<CandyDocumentModel> get documents;
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
  _$$_CandyPageStateCopyWith<_$_CandyPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
