// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'on_boarding_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnBoardingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnBoardingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnBoardingState()';
}


}

/// @nodoc
class $OnBoardingStateCopyWith<$Res>  {
$OnBoardingStateCopyWith(OnBoardingState _, $Res Function(OnBoardingState) __);
}


/// Adds pattern-matching-related methods to [OnBoardingState].
extension OnBoardingStatePatterns on OnBoardingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( OnboardingPageChange value)?  onboardingPageChange,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case OnboardingPageChange() when onboardingPageChange != null:
return onboardingPageChange(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( OnboardingPageChange value)  onboardingPageChange,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case OnboardingPageChange():
return onboardingPageChange(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( OnboardingPageChange value)?  onboardingPageChange,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case OnboardingPageChange() when onboardingPageChange != null:
return onboardingPageChange(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( int index)?  onboardingPageChange,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case OnboardingPageChange() when onboardingPageChange != null:
return onboardingPageChange(_that.index);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( int index)  onboardingPageChange,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case OnboardingPageChange():
return onboardingPageChange(_that.index);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( int index)?  onboardingPageChange,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case OnboardingPageChange() when onboardingPageChange != null:
return onboardingPageChange(_that.index);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements OnBoardingState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnBoardingState.initial()';
}


}




/// @nodoc


class OnboardingPageChange implements OnBoardingState {
  const OnboardingPageChange(this.index);
  

 final  int index;

/// Create a copy of OnBoardingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingPageChangeCopyWith<OnboardingPageChange> get copyWith => _$OnboardingPageChangeCopyWithImpl<OnboardingPageChange>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingPageChange&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'OnBoardingState.onboardingPageChange(index: $index)';
}


}

/// @nodoc
abstract mixin class $OnboardingPageChangeCopyWith<$Res> implements $OnBoardingStateCopyWith<$Res> {
  factory $OnboardingPageChangeCopyWith(OnboardingPageChange value, $Res Function(OnboardingPageChange) _then) = _$OnboardingPageChangeCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class _$OnboardingPageChangeCopyWithImpl<$Res>
    implements $OnboardingPageChangeCopyWith<$Res> {
  _$OnboardingPageChangeCopyWithImpl(this._self, this._then);

  final OnboardingPageChange _self;
  final $Res Function(OnboardingPageChange) _then;

/// Create a copy of OnBoardingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(OnboardingPageChange(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
