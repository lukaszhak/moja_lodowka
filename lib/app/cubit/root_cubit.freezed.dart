// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'root_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RootState {
  UserModel? get user => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  bool get obscureText => throw _privateConstructorUsedError;
  bool get isCreatingAccount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RootStateCopyWith<RootState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RootStateCopyWith<$Res> {
  factory $RootStateCopyWith(RootState value, $Res Function(RootState) then) =
      _$RootStateCopyWithImpl<$Res, RootState>;
  @useResult
  $Res call(
      {UserModel? user,
      bool isLoading,
      String errorMessage,
      bool obscureText,
      bool isCreatingAccount});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$RootStateCopyWithImpl<$Res, $Val extends RootState>
    implements $RootStateCopyWith<$Res> {
  _$RootStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? obscureText = null,
    Object? isCreatingAccount = null,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      obscureText: null == obscureText
          ? _value.obscureText
          : obscureText // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreatingAccount: null == isCreatingAccount
          ? _value.isCreatingAccount
          : isCreatingAccount // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RootStateCopyWith<$Res> implements $RootStateCopyWith<$Res> {
  factory _$$_RootStateCopyWith(
          _$_RootState value, $Res Function(_$_RootState) then) =
      __$$_RootStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserModel? user,
      bool isLoading,
      String errorMessage,
      bool obscureText,
      bool isCreatingAccount});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_RootStateCopyWithImpl<$Res>
    extends _$RootStateCopyWithImpl<$Res, _$_RootState>
    implements _$$_RootStateCopyWith<$Res> {
  __$$_RootStateCopyWithImpl(
      _$_RootState _value, $Res Function(_$_RootState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? obscureText = null,
    Object? isCreatingAccount = null,
  }) {
    return _then(_$_RootState(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      obscureText: null == obscureText
          ? _value.obscureText
          : obscureText // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreatingAccount: null == isCreatingAccount
          ? _value.isCreatingAccount
          : isCreatingAccount // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RootState implements _RootState {
  _$_RootState(
      {required this.user,
      required this.isLoading,
      required this.errorMessage,
      required this.obscureText,
      required this.isCreatingAccount});

  @override
  final UserModel? user;
  @override
  final bool isLoading;
  @override
  final String errorMessage;
  @override
  final bool obscureText;
  @override
  final bool isCreatingAccount;

  @override
  String toString() {
    return 'RootState(user: $user, isLoading: $isLoading, errorMessage: $errorMessage, obscureText: $obscureText, isCreatingAccount: $isCreatingAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RootState &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.obscureText, obscureText) ||
                other.obscureText == obscureText) &&
            (identical(other.isCreatingAccount, isCreatingAccount) ||
                other.isCreatingAccount == isCreatingAccount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, isLoading, errorMessage,
      obscureText, isCreatingAccount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RootStateCopyWith<_$_RootState> get copyWith =>
      __$$_RootStateCopyWithImpl<_$_RootState>(this, _$identity);
}

abstract class _RootState implements RootState {
  factory _RootState(
      {required final UserModel? user,
      required final bool isLoading,
      required final String errorMessage,
      required final bool obscureText,
      required final bool isCreatingAccount}) = _$_RootState;

  @override
  UserModel? get user;
  @override
  bool get isLoading;
  @override
  String get errorMessage;
  @override
  bool get obscureText;
  @override
  bool get isCreatingAccount;
  @override
  @JsonKey(ignore: true)
  _$$_RootStateCopyWith<_$_RootState> get copyWith =>
      throw _privateConstructorUsedError;
}
