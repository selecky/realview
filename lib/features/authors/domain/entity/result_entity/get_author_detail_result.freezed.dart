// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_author_detail_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetAuthorDetailResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAuthorDetailResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetAuthorDetailResult()';
}


}

/// @nodoc
class $GetAuthorDetailResultCopyWith<$Res>  {
$GetAuthorDetailResultCopyWith(GetAuthorDetailResult _, $Res Function(GetAuthorDetailResult) __);
}


/// @nodoc


class ResultSuccess implements GetAuthorDetailResult {
  const ResultSuccess({required this.authorDetail});
  

 final  AuthorDetail authorDetail;

/// Create a copy of GetAuthorDetailResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultSuccessCopyWith<ResultSuccess> get copyWith => _$ResultSuccessCopyWithImpl<ResultSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultSuccess&&(identical(other.authorDetail, authorDetail) || other.authorDetail == authorDetail));
}


@override
int get hashCode => Object.hash(runtimeType,authorDetail);

@override
String toString() {
  return 'GetAuthorDetailResult.success(authorDetail: $authorDetail)';
}


}

/// @nodoc
abstract mixin class $ResultSuccessCopyWith<$Res> implements $GetAuthorDetailResultCopyWith<$Res> {
  factory $ResultSuccessCopyWith(ResultSuccess value, $Res Function(ResultSuccess) _then) = _$ResultSuccessCopyWithImpl;
@useResult
$Res call({
 AuthorDetail authorDetail
});




}
/// @nodoc
class _$ResultSuccessCopyWithImpl<$Res>
    implements $ResultSuccessCopyWith<$Res> {
  _$ResultSuccessCopyWithImpl(this._self, this._then);

  final ResultSuccess _self;
  final $Res Function(ResultSuccess) _then;

/// Create a copy of GetAuthorDetailResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? authorDetail = null,}) {
  return _then(ResultSuccess(
authorDetail: null == authorDetail ? _self.authorDetail : authorDetail // ignore: cast_nullable_to_non_nullable
as AuthorDetail,
  ));
}


}

/// @nodoc


class ResultFailure implements GetAuthorDetailResult {
  const ResultFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetAuthorDetailResult.failure()';
}


}




// dart format on
