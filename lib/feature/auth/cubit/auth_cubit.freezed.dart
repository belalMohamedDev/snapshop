// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _RegisterSuccess value)?  registerSuccess,TResult Function( _RegisterFailure value)?  registerFailure,TResult Function( _RegisterLoading value)?  registerLoading,TResult Function( _LoginLoading value)?  loginLoading,TResult Function( _LoginSuccess value)?  loginSuccess,TResult Function( _LoginFailure value)?  loginFailure,TResult Function( _ShowPassword value)?  showPassword,TResult Function( _ShowConfirmPassword value)?  showConfirmPassword,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _RegisterSuccess() when registerSuccess != null:
return registerSuccess(_that);case _RegisterFailure() when registerFailure != null:
return registerFailure(_that);case _RegisterLoading() when registerLoading != null:
return registerLoading(_that);case _LoginLoading() when loginLoading != null:
return loginLoading(_that);case _LoginSuccess() when loginSuccess != null:
return loginSuccess(_that);case _LoginFailure() when loginFailure != null:
return loginFailure(_that);case _ShowPassword() when showPassword != null:
return showPassword(_that);case _ShowConfirmPassword() when showConfirmPassword != null:
return showConfirmPassword(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _RegisterSuccess value)  registerSuccess,required TResult Function( _RegisterFailure value)  registerFailure,required TResult Function( _RegisterLoading value)  registerLoading,required TResult Function( _LoginLoading value)  loginLoading,required TResult Function( _LoginSuccess value)  loginSuccess,required TResult Function( _LoginFailure value)  loginFailure,required TResult Function( _ShowPassword value)  showPassword,required TResult Function( _ShowConfirmPassword value)  showConfirmPassword,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _RegisterSuccess():
return registerSuccess(_that);case _RegisterFailure():
return registerFailure(_that);case _RegisterLoading():
return registerLoading(_that);case _LoginLoading():
return loginLoading(_that);case _LoginSuccess():
return loginSuccess(_that);case _LoginFailure():
return loginFailure(_that);case _ShowPassword():
return showPassword(_that);case _ShowConfirmPassword():
return showConfirmPassword(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _RegisterSuccess value)?  registerSuccess,TResult? Function( _RegisterFailure value)?  registerFailure,TResult? Function( _RegisterLoading value)?  registerLoading,TResult? Function( _LoginLoading value)?  loginLoading,TResult? Function( _LoginSuccess value)?  loginSuccess,TResult? Function( _LoginFailure value)?  loginFailure,TResult? Function( _ShowPassword value)?  showPassword,TResult? Function( _ShowConfirmPassword value)?  showConfirmPassword,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _RegisterSuccess() when registerSuccess != null:
return registerSuccess(_that);case _RegisterFailure() when registerFailure != null:
return registerFailure(_that);case _RegisterLoading() when registerLoading != null:
return registerLoading(_that);case _LoginLoading() when loginLoading != null:
return loginLoading(_that);case _LoginSuccess() when loginSuccess != null:
return loginSuccess(_that);case _LoginFailure() when loginFailure != null:
return loginFailure(_that);case _ShowPassword() when showPassword != null:
return showPassword(_that);case _ShowConfirmPassword() when showConfirmPassword != null:
return showConfirmPassword(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( AuthResponse response)?  registerSuccess,TResult Function( ApiErrorModel error)?  registerFailure,TResult Function()?  registerLoading,TResult Function()?  loginLoading,TResult Function( AuthResponse response)?  loginSuccess,TResult Function( ApiErrorModel error)?  loginFailure,TResult Function( bool show)?  showPassword,TResult Function( bool show)?  showConfirmPassword,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _RegisterSuccess() when registerSuccess != null:
return registerSuccess(_that.response);case _RegisterFailure() when registerFailure != null:
return registerFailure(_that.error);case _RegisterLoading() when registerLoading != null:
return registerLoading();case _LoginLoading() when loginLoading != null:
return loginLoading();case _LoginSuccess() when loginSuccess != null:
return loginSuccess(_that.response);case _LoginFailure() when loginFailure != null:
return loginFailure(_that.error);case _ShowPassword() when showPassword != null:
return showPassword(_that.show);case _ShowConfirmPassword() when showConfirmPassword != null:
return showConfirmPassword(_that.show);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( AuthResponse response)  registerSuccess,required TResult Function( ApiErrorModel error)  registerFailure,required TResult Function()  registerLoading,required TResult Function()  loginLoading,required TResult Function( AuthResponse response)  loginSuccess,required TResult Function( ApiErrorModel error)  loginFailure,required TResult Function( bool show)  showPassword,required TResult Function( bool show)  showConfirmPassword,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _RegisterSuccess():
return registerSuccess(_that.response);case _RegisterFailure():
return registerFailure(_that.error);case _RegisterLoading():
return registerLoading();case _LoginLoading():
return loginLoading();case _LoginSuccess():
return loginSuccess(_that.response);case _LoginFailure():
return loginFailure(_that.error);case _ShowPassword():
return showPassword(_that.show);case _ShowConfirmPassword():
return showConfirmPassword(_that.show);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( AuthResponse response)?  registerSuccess,TResult? Function( ApiErrorModel error)?  registerFailure,TResult? Function()?  registerLoading,TResult? Function()?  loginLoading,TResult? Function( AuthResponse response)?  loginSuccess,TResult? Function( ApiErrorModel error)?  loginFailure,TResult? Function( bool show)?  showPassword,TResult? Function( bool show)?  showConfirmPassword,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _RegisterSuccess() when registerSuccess != null:
return registerSuccess(_that.response);case _RegisterFailure() when registerFailure != null:
return registerFailure(_that.error);case _RegisterLoading() when registerLoading != null:
return registerLoading();case _LoginLoading() when loginLoading != null:
return loginLoading();case _LoginSuccess() when loginSuccess != null:
return loginSuccess(_that.response);case _LoginFailure() when loginFailure != null:
return loginFailure(_that.error);case _ShowPassword() when showPassword != null:
return showPassword(_that.show);case _ShowConfirmPassword() when showConfirmPassword != null:
return showConfirmPassword(_that.show);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AuthState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class _RegisterSuccess implements AuthState {
  const _RegisterSuccess(this.response);
  

 final  AuthResponse response;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterSuccessCopyWith<_RegisterSuccess> get copyWith => __$RegisterSuccessCopyWithImpl<_RegisterSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'AuthState.registerSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class _$RegisterSuccessCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$RegisterSuccessCopyWith(_RegisterSuccess value, $Res Function(_RegisterSuccess) _then) = __$RegisterSuccessCopyWithImpl;
@useResult
$Res call({
 AuthResponse response
});




}
/// @nodoc
class __$RegisterSuccessCopyWithImpl<$Res>
    implements _$RegisterSuccessCopyWith<$Res> {
  __$RegisterSuccessCopyWithImpl(this._self, this._then);

  final _RegisterSuccess _self;
  final $Res Function(_RegisterSuccess) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(_RegisterSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as AuthResponse,
  ));
}


}

/// @nodoc


class _RegisterFailure implements AuthState {
  const _RegisterFailure(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterFailureCopyWith<_RegisterFailure> get copyWith => __$RegisterFailureCopyWithImpl<_RegisterFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AuthState.registerFailure(error: $error)';
}


}

/// @nodoc
abstract mixin class _$RegisterFailureCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$RegisterFailureCopyWith(_RegisterFailure value, $Res Function(_RegisterFailure) _then) = __$RegisterFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class __$RegisterFailureCopyWithImpl<$Res>
    implements _$RegisterFailureCopyWith<$Res> {
  __$RegisterFailureCopyWithImpl(this._self, this._then);

  final _RegisterFailure _self;
  final $Res Function(_RegisterFailure) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_RegisterFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class _RegisterLoading implements AuthState {
  const _RegisterLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.registerLoading()';
}


}




/// @nodoc


class _LoginLoading implements AuthState {
  const _LoginLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loginLoading()';
}


}




/// @nodoc


class _LoginSuccess implements AuthState {
  const _LoginSuccess(this.response);
  

 final  AuthResponse response;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginSuccessCopyWith<_LoginSuccess> get copyWith => __$LoginSuccessCopyWithImpl<_LoginSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'AuthState.loginSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class _$LoginSuccessCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$LoginSuccessCopyWith(_LoginSuccess value, $Res Function(_LoginSuccess) _then) = __$LoginSuccessCopyWithImpl;
@useResult
$Res call({
 AuthResponse response
});




}
/// @nodoc
class __$LoginSuccessCopyWithImpl<$Res>
    implements _$LoginSuccessCopyWith<$Res> {
  __$LoginSuccessCopyWithImpl(this._self, this._then);

  final _LoginSuccess _self;
  final $Res Function(_LoginSuccess) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(_LoginSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as AuthResponse,
  ));
}


}

/// @nodoc


class _LoginFailure implements AuthState {
  const _LoginFailure(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginFailureCopyWith<_LoginFailure> get copyWith => __$LoginFailureCopyWithImpl<_LoginFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AuthState.loginFailure(error: $error)';
}


}

/// @nodoc
abstract mixin class _$LoginFailureCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$LoginFailureCopyWith(_LoginFailure value, $Res Function(_LoginFailure) _then) = __$LoginFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class __$LoginFailureCopyWithImpl<$Res>
    implements _$LoginFailureCopyWith<$Res> {
  __$LoginFailureCopyWithImpl(this._self, this._then);

  final _LoginFailure _self;
  final $Res Function(_LoginFailure) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_LoginFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class _ShowPassword implements AuthState {
  const _ShowPassword(this.show);
  

 final  bool show;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShowPasswordCopyWith<_ShowPassword> get copyWith => __$ShowPasswordCopyWithImpl<_ShowPassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShowPassword&&(identical(other.show, show) || other.show == show));
}


@override
int get hashCode => Object.hash(runtimeType,show);

@override
String toString() {
  return 'AuthState.showPassword(show: $show)';
}


}

/// @nodoc
abstract mixin class _$ShowPasswordCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$ShowPasswordCopyWith(_ShowPassword value, $Res Function(_ShowPassword) _then) = __$ShowPasswordCopyWithImpl;
@useResult
$Res call({
 bool show
});




}
/// @nodoc
class __$ShowPasswordCopyWithImpl<$Res>
    implements _$ShowPasswordCopyWith<$Res> {
  __$ShowPasswordCopyWithImpl(this._self, this._then);

  final _ShowPassword _self;
  final $Res Function(_ShowPassword) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? show = null,}) {
  return _then(_ShowPassword(
null == show ? _self.show : show // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _ShowConfirmPassword implements AuthState {
  const _ShowConfirmPassword(this.show);
  

 final  bool show;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShowConfirmPasswordCopyWith<_ShowConfirmPassword> get copyWith => __$ShowConfirmPasswordCopyWithImpl<_ShowConfirmPassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShowConfirmPassword&&(identical(other.show, show) || other.show == show));
}


@override
int get hashCode => Object.hash(runtimeType,show);

@override
String toString() {
  return 'AuthState.showConfirmPassword(show: $show)';
}


}

/// @nodoc
abstract mixin class _$ShowConfirmPasswordCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$ShowConfirmPasswordCopyWith(_ShowConfirmPassword value, $Res Function(_ShowConfirmPassword) _then) = __$ShowConfirmPasswordCopyWithImpl;
@useResult
$Res call({
 bool show
});




}
/// @nodoc
class __$ShowConfirmPasswordCopyWithImpl<$Res>
    implements _$ShowConfirmPasswordCopyWith<$Res> {
  __$ShowConfirmPasswordCopyWithImpl(this._self, this._then);

  final _ShowConfirmPassword _self;
  final $Res Function(_ShowConfirmPassword) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? show = null,}) {
  return _then(_ShowConfirmPassword(
null == show ? _self.show : show // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
