// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdateProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProfileState()';
}


}

/// @nodoc
class $UpdateProfileStateCopyWith<$Res>  {
$UpdateProfileStateCopyWith(UpdateProfileState _, $Res Function(UpdateProfileState) __);
}


/// Adds pattern-matching-related methods to [UpdateProfileState].
extension UpdateProfileStatePatterns on UpdateProfileState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _UpdateProfileLoading value)?  updateProfileLoading,TResult Function( _UpdateProfileSuccess value)?  updateProfileSuccess,TResult Function( _UpdateProfileFailure value)?  updateProfileFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _UpdateProfileLoading() when updateProfileLoading != null:
return updateProfileLoading(_that);case _UpdateProfileSuccess() when updateProfileSuccess != null:
return updateProfileSuccess(_that);case _UpdateProfileFailure() when updateProfileFailure != null:
return updateProfileFailure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _UpdateProfileLoading value)  updateProfileLoading,required TResult Function( _UpdateProfileSuccess value)  updateProfileSuccess,required TResult Function( _UpdateProfileFailure value)  updateProfileFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _UpdateProfileLoading():
return updateProfileLoading(_that);case _UpdateProfileSuccess():
return updateProfileSuccess(_that);case _UpdateProfileFailure():
return updateProfileFailure(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _UpdateProfileLoading value)?  updateProfileLoading,TResult? Function( _UpdateProfileSuccess value)?  updateProfileSuccess,TResult? Function( _UpdateProfileFailure value)?  updateProfileFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _UpdateProfileLoading() when updateProfileLoading != null:
return updateProfileLoading(_that);case _UpdateProfileSuccess() when updateProfileSuccess != null:
return updateProfileSuccess(_that);case _UpdateProfileFailure() when updateProfileFailure != null:
return updateProfileFailure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  updateProfileLoading,TResult Function( ApiSuccessGeneralModel data)?  updateProfileSuccess,TResult Function( ApiErrorModel error)?  updateProfileFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _UpdateProfileLoading() when updateProfileLoading != null:
return updateProfileLoading();case _UpdateProfileSuccess() when updateProfileSuccess != null:
return updateProfileSuccess(_that.data);case _UpdateProfileFailure() when updateProfileFailure != null:
return updateProfileFailure(_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  updateProfileLoading,required TResult Function( ApiSuccessGeneralModel data)  updateProfileSuccess,required TResult Function( ApiErrorModel error)  updateProfileFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _UpdateProfileLoading():
return updateProfileLoading();case _UpdateProfileSuccess():
return updateProfileSuccess(_that.data);case _UpdateProfileFailure():
return updateProfileFailure(_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  updateProfileLoading,TResult? Function( ApiSuccessGeneralModel data)?  updateProfileSuccess,TResult? Function( ApiErrorModel error)?  updateProfileFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _UpdateProfileLoading() when updateProfileLoading != null:
return updateProfileLoading();case _UpdateProfileSuccess() when updateProfileSuccess != null:
return updateProfileSuccess(_that.data);case _UpdateProfileFailure() when updateProfileFailure != null:
return updateProfileFailure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements UpdateProfileState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProfileState.initial()';
}


}




/// @nodoc


class _UpdateProfileLoading implements UpdateProfileState {
  const _UpdateProfileLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProfileState.updateProfileLoading()';
}


}




/// @nodoc


class _UpdateProfileSuccess implements UpdateProfileState {
  const _UpdateProfileSuccess(this.data);
  

 final  ApiSuccessGeneralModel data;

/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfileSuccessCopyWith<_UpdateProfileSuccess> get copyWith => __$UpdateProfileSuccessCopyWithImpl<_UpdateProfileSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfileSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'UpdateProfileState.updateProfileSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfileSuccessCopyWith<$Res> implements $UpdateProfileStateCopyWith<$Res> {
  factory _$UpdateProfileSuccessCopyWith(_UpdateProfileSuccess value, $Res Function(_UpdateProfileSuccess) _then) = __$UpdateProfileSuccessCopyWithImpl;
@useResult
$Res call({
 ApiSuccessGeneralModel data
});




}
/// @nodoc
class __$UpdateProfileSuccessCopyWithImpl<$Res>
    implements _$UpdateProfileSuccessCopyWith<$Res> {
  __$UpdateProfileSuccessCopyWithImpl(this._self, this._then);

  final _UpdateProfileSuccess _self;
  final $Res Function(_UpdateProfileSuccess) _then;

/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_UpdateProfileSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ApiSuccessGeneralModel,
  ));
}


}

/// @nodoc


class _UpdateProfileFailure implements UpdateProfileState {
  const _UpdateProfileFailure(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfileFailureCopyWith<_UpdateProfileFailure> get copyWith => __$UpdateProfileFailureCopyWithImpl<_UpdateProfileFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfileFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'UpdateProfileState.updateProfileFailure(error: $error)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfileFailureCopyWith<$Res> implements $UpdateProfileStateCopyWith<$Res> {
  factory _$UpdateProfileFailureCopyWith(_UpdateProfileFailure value, $Res Function(_UpdateProfileFailure) _then) = __$UpdateProfileFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class __$UpdateProfileFailureCopyWithImpl<$Res>
    implements _$UpdateProfileFailureCopyWith<$Res> {
  __$UpdateProfileFailureCopyWithImpl(this._self, this._then);

  final _UpdateProfileFailure _self;
  final $Res Function(_UpdateProfileFailure) _then;

/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_UpdateProfileFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
