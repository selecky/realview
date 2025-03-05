// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_books_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetBooksResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetBooksResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetBooksResult()';
}


}

/// @nodoc
class $GetBooksResultCopyWith<$Res>  {
$GetBooksResultCopyWith(GetBooksResult _, $Res Function(GetBooksResult) __);
}


/// @nodoc


class ResultSuccess implements GetBooksResult {
  const ResultSuccess({required this.booksData});
  

 final  BooksData booksData;

/// Create a copy of GetBooksResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultSuccessCopyWith<ResultSuccess> get copyWith => _$ResultSuccessCopyWithImpl<ResultSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultSuccess&&(identical(other.booksData, booksData) || other.booksData == booksData));
}


@override
int get hashCode => Object.hash(runtimeType,booksData);

@override
String toString() {
  return 'GetBooksResult.success(booksData: $booksData)';
}


}

/// @nodoc
abstract mixin class $ResultSuccessCopyWith<$Res> implements $GetBooksResultCopyWith<$Res> {
  factory $ResultSuccessCopyWith(ResultSuccess value, $Res Function(ResultSuccess) _then) = _$ResultSuccessCopyWithImpl;
@useResult
$Res call({
 BooksData booksData
});




}
/// @nodoc
class _$ResultSuccessCopyWithImpl<$Res>
    implements $ResultSuccessCopyWith<$Res> {
  _$ResultSuccessCopyWithImpl(this._self, this._then);

  final ResultSuccess _self;
  final $Res Function(ResultSuccess) _then;

/// Create a copy of GetBooksResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? booksData = null,}) {
  return _then(ResultSuccess(
booksData: null == booksData ? _self.booksData : booksData // ignore: cast_nullable_to_non_nullable
as BooksData,
  ));
}


}

/// @nodoc


class ResultFailure implements GetBooksResult {
  const ResultFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetBooksResult.failure()';
}


}




// dart format on
