// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherPageState {
  WeatherModel? get model => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherPageStateCopyWith<WeatherPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherPageStateCopyWith<$Res> {
  factory $WeatherPageStateCopyWith(
          WeatherPageState value, $Res Function(WeatherPageState) then) =
      _$WeatherPageStateCopyWithImpl<$Res, WeatherPageState>;
  @useResult
  $Res call({WeatherModel? model, Status status, String? errorMessage});
}

/// @nodoc
class _$WeatherPageStateCopyWithImpl<$Res, $Val extends WeatherPageState>
    implements $WeatherPageStateCopyWith<$Res> {
  _$WeatherPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as WeatherModel?,
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
abstract class _$$_WeatherPageStateCopyWith<$Res>
    implements $WeatherPageStateCopyWith<$Res> {
  factory _$$_WeatherPageStateCopyWith(
          _$_WeatherPageState value, $Res Function(_$_WeatherPageState) then) =
      __$$_WeatherPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WeatherModel? model, Status status, String? errorMessage});
}

/// @nodoc
class __$$_WeatherPageStateCopyWithImpl<$Res>
    extends _$WeatherPageStateCopyWithImpl<$Res, _$_WeatherPageState>
    implements _$$_WeatherPageStateCopyWith<$Res> {
  __$$_WeatherPageStateCopyWithImpl(
      _$_WeatherPageState _value, $Res Function(_$_WeatherPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_WeatherPageState(
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as WeatherModel?,
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

class _$_WeatherPageState implements _WeatherPageState {
  _$_WeatherPageState({this.model, required this.status, this.errorMessage});

  @override
  final WeatherModel? model;
  @override
  final Status status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'WeatherPageState(model: $model, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherPageState &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model, status, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherPageStateCopyWith<_$_WeatherPageState> get copyWith =>
      __$$_WeatherPageStateCopyWithImpl<_$_WeatherPageState>(this, _$identity);
}

abstract class _WeatherPageState implements WeatherPageState {
  factory _WeatherPageState(
      {final WeatherModel? model,
      required final Status status,
      final String? errorMessage}) = _$_WeatherPageState;

  @override
  WeatherModel? get model;
  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherPageStateCopyWith<_$_WeatherPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
