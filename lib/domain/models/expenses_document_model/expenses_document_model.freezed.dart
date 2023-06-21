// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expenses_document_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExpensesDocumentModel {
  String get category => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get expensesDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExpensesDocumentModelCopyWith<ExpensesDocumentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpensesDocumentModelCopyWith<$Res> {
  factory $ExpensesDocumentModelCopyWith(ExpensesDocumentModel value,
          $Res Function(ExpensesDocumentModel) then) =
      _$ExpensesDocumentModelCopyWithImpl<$Res, ExpensesDocumentModel>;
  @useResult
  $Res call(
      {String category,
      num amount,
      String id,
      String title,
      DateTime expensesDate});
}

/// @nodoc
class _$ExpensesDocumentModelCopyWithImpl<$Res,
        $Val extends ExpensesDocumentModel>
    implements $ExpensesDocumentModelCopyWith<$Res> {
  _$ExpensesDocumentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? amount = null,
    Object? id = null,
    Object? title = null,
    Object? expensesDate = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      expensesDate: null == expensesDate
          ? _value.expensesDate
          : expensesDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExpensesDocumentModelCopyWith<$Res>
    implements $ExpensesDocumentModelCopyWith<$Res> {
  factory _$$_ExpensesDocumentModelCopyWith(_$_ExpensesDocumentModel value,
          $Res Function(_$_ExpensesDocumentModel) then) =
      __$$_ExpensesDocumentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String category,
      num amount,
      String id,
      String title,
      DateTime expensesDate});
}

/// @nodoc
class __$$_ExpensesDocumentModelCopyWithImpl<$Res>
    extends _$ExpensesDocumentModelCopyWithImpl<$Res, _$_ExpensesDocumentModel>
    implements _$$_ExpensesDocumentModelCopyWith<$Res> {
  __$$_ExpensesDocumentModelCopyWithImpl(_$_ExpensesDocumentModel _value,
      $Res Function(_$_ExpensesDocumentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? amount = null,
    Object? id = null,
    Object? title = null,
    Object? expensesDate = null,
  }) {
    return _then(_$_ExpensesDocumentModel(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      expensesDate: null == expensesDate
          ? _value.expensesDate
          : expensesDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_ExpensesDocumentModel extends _ExpensesDocumentModel {
  _$_ExpensesDocumentModel(
      {required this.category,
      required this.amount,
      required this.id,
      required this.title,
      required this.expensesDate})
      : super._();

  @override
  final String category;
  @override
  final num amount;
  @override
  final String id;
  @override
  final String title;
  @override
  final DateTime expensesDate;

  @override
  String toString() {
    return 'ExpensesDocumentModel(category: $category, amount: $amount, id: $id, title: $title, expensesDate: $expensesDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExpensesDocumentModel &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.expensesDate, expensesDate) ||
                other.expensesDate == expensesDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, category, amount, id, title, expensesDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExpensesDocumentModelCopyWith<_$_ExpensesDocumentModel> get copyWith =>
      __$$_ExpensesDocumentModelCopyWithImpl<_$_ExpensesDocumentModel>(
          this, _$identity);
}

abstract class _ExpensesDocumentModel extends ExpensesDocumentModel {
  factory _ExpensesDocumentModel(
      {required final String category,
      required final num amount,
      required final String id,
      required final String title,
      required final DateTime expensesDate}) = _$_ExpensesDocumentModel;
  _ExpensesDocumentModel._() : super._();

  @override
  String get category;
  @override
  num get amount;
  @override
  String get id;
  @override
  String get title;
  @override
  DateTime get expensesDate;
  @override
  @JsonKey(ignore: true)
  _$$_ExpensesDocumentModelCopyWith<_$_ExpensesDocumentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
