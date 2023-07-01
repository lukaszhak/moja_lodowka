// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fridge_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FridgePageState {
  List<FridgeDocumentModel> get documents => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  int? get notificationId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  DateTime? get expDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FridgePageStateCopyWith<FridgePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FridgePageStateCopyWith<$Res> {
  factory $FridgePageStateCopyWith(
          FridgePageState value, $Res Function(FridgePageState) then) =
      _$FridgePageStateCopyWithImpl<$Res, FridgePageState>;
  @useResult
  $Res call(
      {List<FridgeDocumentModel> documents,
      Status status,
      String? errorMessage,
      int? notificationId,
      String? title,
      DateTime? expDate});
}

/// @nodoc
class _$FridgePageStateCopyWithImpl<$Res, $Val extends FridgePageState>
    implements $FridgePageStateCopyWith<$Res> {
  _$FridgePageStateCopyWithImpl(this._value, this._then);

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
              as List<FridgeDocumentModel>,
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
abstract class _$$_FridgePageStateCopyWith<$Res>
    implements $FridgePageStateCopyWith<$Res> {
  factory _$$_FridgePageStateCopyWith(
          _$_FridgePageState value, $Res Function(_$_FridgePageState) then) =
      __$$_FridgePageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<FridgeDocumentModel> documents,
      Status status,
      String? errorMessage,
      int? notificationId,
      String? title,
      DateTime? expDate});
}

/// @nodoc
class __$$_FridgePageStateCopyWithImpl<$Res>
    extends _$FridgePageStateCopyWithImpl<$Res, _$_FridgePageState>
    implements _$$_FridgePageStateCopyWith<$Res> {
  __$$_FridgePageStateCopyWithImpl(
      _$_FridgePageState _value, $Res Function(_$_FridgePageState) _then)
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
    return _then(_$_FridgePageState(
      documents: null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<FridgeDocumentModel>,
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

class _$_FridgePageState implements _FridgePageState {
  _$_FridgePageState(
      {required final List<FridgeDocumentModel> documents,
      required this.status,
      required this.errorMessage,
      this.notificationId,
      this.title,
      this.expDate})
      : _documents = documents;

  final List<FridgeDocumentModel> _documents;
  @override
  List<FridgeDocumentModel> get documents {
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
    return 'FridgePageState(documents: $documents, status: $status, errorMessage: $errorMessage, notificationId: $notificationId, title: $title, expDate: $expDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FridgePageState &&
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
  _$$_FridgePageStateCopyWith<_$_FridgePageState> get copyWith =>
      __$$_FridgePageStateCopyWithImpl<_$_FridgePageState>(this, _$identity);
}

abstract class _FridgePageState implements FridgePageState {
  factory _FridgePageState(
      {required final List<FridgeDocumentModel> documents,
      required final Status status,
      required final String? errorMessage,
      final int? notificationId,
      final String? title,
      final DateTime? expDate}) = _$_FridgePageState;

  @override
  List<FridgeDocumentModel> get documents;
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
  _$$_FridgePageStateCopyWith<_$_FridgePageState> get copyWith =>
      throw _privateConstructorUsedError;
}
