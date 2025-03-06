// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_authors_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetAuthorsResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAuthorsResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetAuthorsResult()';
}


}

/// @nodoc
class $GetAuthorsResultCopyWith<$Res>  {
$GetAuthorsResultCopyWith(GetAuthorsResult _, $Res Function(GetAuthorsResult) __);
}


/// @nodoc


class ResultSuccess implements GetAuthorsResult {
  const ResultSuccess({required this.authorsData});
  

 final  AuthorsData authorsData;

/// Create a copy of GetAuthorsResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultSuccessCopyWith<ResultSuccess> get copyWith => _$ResultSuccessCopyWithImpl<ResultSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultSuccess&&(identical(other.authorsData, authorsData) || other.authorsData == authorsData));
}


@override
int get hashCode => Object.hash(runtimeType,authorsData);

@override
String toString() {
  return 'GetAuthorsResult.success(authorsData: $authorsData)';
}


}

/// @nodoc
abstract mixin class $ResultSuccessCopyWith<$Res> implements $GetAuthorsResultCopyWith<$Res> {
  factory $ResultSuccessCopyWith(ResultSuccess value, $Res Function(ResultSuccess) _then) = _$ResultSuccessCopyWithImpl;
@useResult
$Res call({
 AuthorsData authorsData
});




}
/// @nodoc
class _$ResultSuccessCopyWithImpl<$Res>
    implements $ResultSuccessCopyWith<$Res> {
  _$ResultSuccessCopyWithImpl(this._self, this._then);

  final ResultSuccess _self;
  final $Res Function(ResultSuccess) _then;

/// Create a copy of GetAuthorsResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? authorsData = null,}) {
  return _then(ResultSuccess(
authorsData: null == authorsData ? _self.authorsData : authorsData // ignore: cast_nullable_to_non_nullable
as AuthorsData,
  ));
}


}

/// @nodoc


class ResultFailure implements GetAuthorsResult {
  const ResultFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetAuthorsResult.failure()';
}


}




// dart format on
