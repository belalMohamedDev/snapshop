// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState()';
}


}

/// @nodoc
class $HomeStateCopyWith<$Res>  {
$HomeStateCopyWith(HomeState _, $Res Function(HomeState) __);
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _SlidersLoading value)?  slidersLoading,TResult Function( _SlidersSuccess value)?  slidersSuccess,TResult Function( _SlidersFailure value)?  slidersFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _SlidersLoading() when slidersLoading != null:
return slidersLoading(_that);case _SlidersSuccess() when slidersSuccess != null:
return slidersSuccess(_that);case _SlidersFailure() when slidersFailure != null:
return slidersFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _SlidersLoading value)  slidersLoading,required TResult Function( _SlidersSuccess value)  slidersSuccess,required TResult Function( _SlidersFailure value)  slidersFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _SlidersLoading():
return slidersLoading(_that);case _SlidersSuccess():
return slidersSuccess(_that);case _SlidersFailure():
return slidersFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _SlidersLoading value)?  slidersLoading,TResult? Function( _SlidersSuccess value)?  slidersSuccess,TResult? Function( _SlidersFailure value)?  slidersFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _SlidersLoading() when slidersLoading != null:
return slidersLoading(_that);case _SlidersSuccess() when slidersSuccess != null:
return slidersSuccess(_that);case _SlidersFailure() when slidersFailure != null:
return slidersFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  slidersLoading,TResult Function( SliderModel sliderModel,  int currentIndex)?  slidersSuccess,TResult Function( ApiErrorModel error)?  slidersFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _SlidersLoading() when slidersLoading != null:
return slidersLoading();case _SlidersSuccess() when slidersSuccess != null:
return slidersSuccess(_that.sliderModel,_that.currentIndex);case _SlidersFailure() when slidersFailure != null:
return slidersFailure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  slidersLoading,required TResult Function( SliderModel sliderModel,  int currentIndex)  slidersSuccess,required TResult Function( ApiErrorModel error)  slidersFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _SlidersLoading():
return slidersLoading();case _SlidersSuccess():
return slidersSuccess(_that.sliderModel,_that.currentIndex);case _SlidersFailure():
return slidersFailure(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  slidersLoading,TResult? Function( SliderModel sliderModel,  int currentIndex)?  slidersSuccess,TResult? Function( ApiErrorModel error)?  slidersFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _SlidersLoading() when slidersLoading != null:
return slidersLoading();case _SlidersSuccess() when slidersSuccess != null:
return slidersSuccess(_that.sliderModel,_that.currentIndex);case _SlidersFailure() when slidersFailure != null:
return slidersFailure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements HomeState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.initial()';
}


}




/// @nodoc


class _SlidersLoading implements HomeState {
  const _SlidersLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SlidersLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.slidersLoading()';
}


}




/// @nodoc


class _SlidersSuccess implements HomeState {
  const _SlidersSuccess({required this.sliderModel, this.currentIndex = 0});
  

 final  SliderModel sliderModel;
@JsonKey() final  int currentIndex;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SlidersSuccessCopyWith<_SlidersSuccess> get copyWith => __$SlidersSuccessCopyWithImpl<_SlidersSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SlidersSuccess&&(identical(other.sliderModel, sliderModel) || other.sliderModel == sliderModel)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex));
}


@override
int get hashCode => Object.hash(runtimeType,sliderModel,currentIndex);

@override
String toString() {
  return 'HomeState.slidersSuccess(sliderModel: $sliderModel, currentIndex: $currentIndex)';
}


}

/// @nodoc
abstract mixin class _$SlidersSuccessCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$SlidersSuccessCopyWith(_SlidersSuccess value, $Res Function(_SlidersSuccess) _then) = __$SlidersSuccessCopyWithImpl;
@useResult
$Res call({
 SliderModel sliderModel, int currentIndex
});




}
/// @nodoc
class __$SlidersSuccessCopyWithImpl<$Res>
    implements _$SlidersSuccessCopyWith<$Res> {
  __$SlidersSuccessCopyWithImpl(this._self, this._then);

  final _SlidersSuccess _self;
  final $Res Function(_SlidersSuccess) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sliderModel = null,Object? currentIndex = null,}) {
  return _then(_SlidersSuccess(
sliderModel: null == sliderModel ? _self.sliderModel : sliderModel // ignore: cast_nullable_to_non_nullable
as SliderModel,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SlidersFailure implements HomeState {
  const _SlidersFailure(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SlidersFailureCopyWith<_SlidersFailure> get copyWith => __$SlidersFailureCopyWithImpl<_SlidersFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SlidersFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'HomeState.slidersFailure(error: $error)';
}


}

/// @nodoc
abstract mixin class _$SlidersFailureCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$SlidersFailureCopyWith(_SlidersFailure value, $Res Function(_SlidersFailure) _then) = __$SlidersFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class __$SlidersFailureCopyWithImpl<$Res>
    implements _$SlidersFailureCopyWith<$Res> {
  __$SlidersFailureCopyWithImpl(this._self, this._then);

  final _SlidersFailure _self;
  final $Res Function(_SlidersFailure) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_SlidersFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
