// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_book_detail_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetBookDetailResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetBookDetailResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetBookDetailResult()';
}


}

/// @nodoc
class $GetBookDetailResultCopyWith<$Res>  {
$GetBookDetailResultCopyWith(GetBookDetailResult _, $Res Function(GetBookDetailResult) __);
}


/// @nodoc


class ResultSuccess implements GetBookDetailResult {
  const ResultSuccess({required this.bookDetail});
  

 final  BookDetail bookDetail;

/// Create a copy of GetBookDetailResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultSuccessCopyWith<ResultSuccess> get copyWith => _$ResultSuccessCopyWithImpl<ResultSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultSuccess&&(identical(other.bookDetail, bookDetail) || other.bookDetail == bookDetail));
}


@override
int get hashCode => Object.hash(runtimeType,bookDetail);

@override
String toString() {
  return 'GetBookDetailResult.success(bookDetail: $bookDetail)';
}


}

/// @nodoc
abstract mixin class $ResultSuccessCopyWith<$Res> implements $GetBookDetailResultCopyWith<$Res> {
  factory $ResultSuccessCopyWith(ResultSuccess value, $Res Function(ResultSuccess) _then) = _$ResultSuccessCopyWithImpl;
@useResult
$Res call({
 BookDetail bookDetail
});




}
/// @nodoc
class _$ResultSuccessCopyWithImpl<$Res>
    implements $ResultSuccessCopyWith<$Res> {
  _$ResultSuccessCopyWithImpl(this._self, this._then);

  final ResultSuccess _self;
  final $Res Function(ResultSuccess) _then;

/// Create a copy of GetBookDetailResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bookDetail = null,}) {
  return _then(ResultSuccess(
bookDetail: null == bookDetail ? _self.bookDetail : bookDetail // ignore: cast_nullable_to_non_nullable
as BookDetail,
  ));
}


}

/// @nodoc


class ResultFailure implements GetBookDetailResult {
  const ResultFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetBookDetailResult.failure()';
}


}




// dart format on
