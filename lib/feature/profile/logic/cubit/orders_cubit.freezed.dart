// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrdersState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersState()';
}


}

/// @nodoc
class $OrdersStateCopyWith<$Res>  {
$OrdersStateCopyWith(OrdersState _, $Res Function(OrdersState) __);
}


/// Adds pattern-matching-related methods to [OrdersState].
extension OrdersStatePatterns on OrdersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _GetOrdersLoading value)?  getOrdersLoading,TResult Function( _getOrdersSuccess value)?  getOrdersSuccess,TResult Function( _getOrdersFailure value)?  getOrdersFailure,TResult Function( _CancelOrderLoading value)?  cancelOrderLoading,TResult Function( _CancelOrderSuccess value)?  cancelOrderSuccess,TResult Function( _CancelOrderFailure value)?  cancelOrderFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _GetOrdersLoading() when getOrdersLoading != null:
return getOrdersLoading(_that);case _getOrdersSuccess() when getOrdersSuccess != null:
return getOrdersSuccess(_that);case _getOrdersFailure() when getOrdersFailure != null:
return getOrdersFailure(_that);case _CancelOrderLoading() when cancelOrderLoading != null:
return cancelOrderLoading(_that);case _CancelOrderSuccess() when cancelOrderSuccess != null:
return cancelOrderSuccess(_that);case _CancelOrderFailure() when cancelOrderFailure != null:
return cancelOrderFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _GetOrdersLoading value)  getOrdersLoading,required TResult Function( _getOrdersSuccess value)  getOrdersSuccess,required TResult Function( _getOrdersFailure value)  getOrdersFailure,required TResult Function( _CancelOrderLoading value)  cancelOrderLoading,required TResult Function( _CancelOrderSuccess value)  cancelOrderSuccess,required TResult Function( _CancelOrderFailure value)  cancelOrderFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _GetOrdersLoading():
return getOrdersLoading(_that);case _getOrdersSuccess():
return getOrdersSuccess(_that);case _getOrdersFailure():
return getOrdersFailure(_that);case _CancelOrderLoading():
return cancelOrderLoading(_that);case _CancelOrderSuccess():
return cancelOrderSuccess(_that);case _CancelOrderFailure():
return cancelOrderFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _GetOrdersLoading value)?  getOrdersLoading,TResult? Function( _getOrdersSuccess value)?  getOrdersSuccess,TResult? Function( _getOrdersFailure value)?  getOrdersFailure,TResult? Function( _CancelOrderLoading value)?  cancelOrderLoading,TResult? Function( _CancelOrderSuccess value)?  cancelOrderSuccess,TResult? Function( _CancelOrderFailure value)?  cancelOrderFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _GetOrdersLoading() when getOrdersLoading != null:
return getOrdersLoading(_that);case _getOrdersSuccess() when getOrdersSuccess != null:
return getOrdersSuccess(_that);case _getOrdersFailure() when getOrdersFailure != null:
return getOrdersFailure(_that);case _CancelOrderLoading() when cancelOrderLoading != null:
return cancelOrderLoading(_that);case _CancelOrderSuccess() when cancelOrderSuccess != null:
return cancelOrderSuccess(_that);case _CancelOrderFailure() when cancelOrderFailure != null:
return cancelOrderFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  getOrdersLoading,TResult Function( OrdersModel orderModel)?  getOrdersSuccess,TResult Function( ApiErrorModel apiError)?  getOrdersFailure,TResult Function()?  cancelOrderLoading,TResult Function( ApiSuccessGeneralModel? apiSuccessGeneralModel)?  cancelOrderSuccess,TResult Function( ApiErrorModel error)?  cancelOrderFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _GetOrdersLoading() when getOrdersLoading != null:
return getOrdersLoading();case _getOrdersSuccess() when getOrdersSuccess != null:
return getOrdersSuccess(_that.orderModel);case _getOrdersFailure() when getOrdersFailure != null:
return getOrdersFailure(_that.apiError);case _CancelOrderLoading() when cancelOrderLoading != null:
return cancelOrderLoading();case _CancelOrderSuccess() when cancelOrderSuccess != null:
return cancelOrderSuccess(_that.apiSuccessGeneralModel);case _CancelOrderFailure() when cancelOrderFailure != null:
return cancelOrderFailure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  getOrdersLoading,required TResult Function( OrdersModel orderModel)  getOrdersSuccess,required TResult Function( ApiErrorModel apiError)  getOrdersFailure,required TResult Function()  cancelOrderLoading,required TResult Function( ApiSuccessGeneralModel? apiSuccessGeneralModel)  cancelOrderSuccess,required TResult Function( ApiErrorModel error)  cancelOrderFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _GetOrdersLoading():
return getOrdersLoading();case _getOrdersSuccess():
return getOrdersSuccess(_that.orderModel);case _getOrdersFailure():
return getOrdersFailure(_that.apiError);case _CancelOrderLoading():
return cancelOrderLoading();case _CancelOrderSuccess():
return cancelOrderSuccess(_that.apiSuccessGeneralModel);case _CancelOrderFailure():
return cancelOrderFailure(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  getOrdersLoading,TResult? Function( OrdersModel orderModel)?  getOrdersSuccess,TResult? Function( ApiErrorModel apiError)?  getOrdersFailure,TResult? Function()?  cancelOrderLoading,TResult? Function( ApiSuccessGeneralModel? apiSuccessGeneralModel)?  cancelOrderSuccess,TResult? Function( ApiErrorModel error)?  cancelOrderFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _GetOrdersLoading() when getOrdersLoading != null:
return getOrdersLoading();case _getOrdersSuccess() when getOrdersSuccess != null:
return getOrdersSuccess(_that.orderModel);case _getOrdersFailure() when getOrdersFailure != null:
return getOrdersFailure(_that.apiError);case _CancelOrderLoading() when cancelOrderLoading != null:
return cancelOrderLoading();case _CancelOrderSuccess() when cancelOrderSuccess != null:
return cancelOrderSuccess(_that.apiSuccessGeneralModel);case _CancelOrderFailure() when cancelOrderFailure != null:
return cancelOrderFailure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements OrdersState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersState.initial()';
}


}




/// @nodoc


class _GetOrdersLoading implements OrdersState {
  const _GetOrdersLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetOrdersLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersState.getOrdersLoading()';
}


}




/// @nodoc


class _getOrdersSuccess implements OrdersState {
  const _getOrdersSuccess(this.orderModel);
  

 final  OrdersModel orderModel;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$getOrdersSuccessCopyWith<_getOrdersSuccess> get copyWith => __$getOrdersSuccessCopyWithImpl<_getOrdersSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _getOrdersSuccess&&(identical(other.orderModel, orderModel) || other.orderModel == orderModel));
}


@override
int get hashCode => Object.hash(runtimeType,orderModel);

@override
String toString() {
  return 'OrdersState.getOrdersSuccess(orderModel: $orderModel)';
}


}

/// @nodoc
abstract mixin class _$getOrdersSuccessCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory _$getOrdersSuccessCopyWith(_getOrdersSuccess value, $Res Function(_getOrdersSuccess) _then) = __$getOrdersSuccessCopyWithImpl;
@useResult
$Res call({
 OrdersModel orderModel
});




}
/// @nodoc
class __$getOrdersSuccessCopyWithImpl<$Res>
    implements _$getOrdersSuccessCopyWith<$Res> {
  __$getOrdersSuccessCopyWithImpl(this._self, this._then);

  final _getOrdersSuccess _self;
  final $Res Function(_getOrdersSuccess) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderModel = null,}) {
  return _then(_getOrdersSuccess(
null == orderModel ? _self.orderModel : orderModel // ignore: cast_nullable_to_non_nullable
as OrdersModel,
  ));
}


}

/// @nodoc


class _getOrdersFailure implements OrdersState {
  const _getOrdersFailure(this.apiError);
  

 final  ApiErrorModel apiError;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$getOrdersFailureCopyWith<_getOrdersFailure> get copyWith => __$getOrdersFailureCopyWithImpl<_getOrdersFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _getOrdersFailure&&(identical(other.apiError, apiError) || other.apiError == apiError));
}


@override
int get hashCode => Object.hash(runtimeType,apiError);

@override
String toString() {
  return 'OrdersState.getOrdersFailure(apiError: $apiError)';
}


}

/// @nodoc
abstract mixin class _$getOrdersFailureCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory _$getOrdersFailureCopyWith(_getOrdersFailure value, $Res Function(_getOrdersFailure) _then) = __$getOrdersFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiError
});




}
/// @nodoc
class __$getOrdersFailureCopyWithImpl<$Res>
    implements _$getOrdersFailureCopyWith<$Res> {
  __$getOrdersFailureCopyWithImpl(this._self, this._then);

  final _getOrdersFailure _self;
  final $Res Function(_getOrdersFailure) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiError = null,}) {
  return _then(_getOrdersFailure(
null == apiError ? _self.apiError : apiError // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class _CancelOrderLoading implements OrdersState {
  const _CancelOrderLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CancelOrderLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersState.cancelOrderLoading()';
}


}




/// @nodoc


class _CancelOrderSuccess implements OrdersState {
  const _CancelOrderSuccess({this.apiSuccessGeneralModel});
  

 final  ApiSuccessGeneralModel? apiSuccessGeneralModel;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CancelOrderSuccessCopyWith<_CancelOrderSuccess> get copyWith => __$CancelOrderSuccessCopyWithImpl<_CancelOrderSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CancelOrderSuccess&&(identical(other.apiSuccessGeneralModel, apiSuccessGeneralModel) || other.apiSuccessGeneralModel == apiSuccessGeneralModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiSuccessGeneralModel);

@override
String toString() {
  return 'OrdersState.cancelOrderSuccess(apiSuccessGeneralModel: $apiSuccessGeneralModel)';
}


}

/// @nodoc
abstract mixin class _$CancelOrderSuccessCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory _$CancelOrderSuccessCopyWith(_CancelOrderSuccess value, $Res Function(_CancelOrderSuccess) _then) = __$CancelOrderSuccessCopyWithImpl;
@useResult
$Res call({
 ApiSuccessGeneralModel? apiSuccessGeneralModel
});




}
/// @nodoc
class __$CancelOrderSuccessCopyWithImpl<$Res>
    implements _$CancelOrderSuccessCopyWith<$Res> {
  __$CancelOrderSuccessCopyWithImpl(this._self, this._then);

  final _CancelOrderSuccess _self;
  final $Res Function(_CancelOrderSuccess) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiSuccessGeneralModel = freezed,}) {
  return _then(_CancelOrderSuccess(
apiSuccessGeneralModel: freezed == apiSuccessGeneralModel ? _self.apiSuccessGeneralModel : apiSuccessGeneralModel // ignore: cast_nullable_to_non_nullable
as ApiSuccessGeneralModel?,
  ));
}


}

/// @nodoc


class _CancelOrderFailure implements OrdersState {
  const _CancelOrderFailure(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CancelOrderFailureCopyWith<_CancelOrderFailure> get copyWith => __$CancelOrderFailureCopyWithImpl<_CancelOrderFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CancelOrderFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'OrdersState.cancelOrderFailure(error: $error)';
}


}

/// @nodoc
abstract mixin class _$CancelOrderFailureCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory _$CancelOrderFailureCopyWith(_CancelOrderFailure value, $Res Function(_CancelOrderFailure) _then) = __$CancelOrderFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class __$CancelOrderFailureCopyWithImpl<$Res>
    implements _$CancelOrderFailureCopyWith<$Res> {
  __$CancelOrderFailureCopyWithImpl(this._self, this._then);

  final _CancelOrderFailure _self;
  final $Res Function(_CancelOrderFailure) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_CancelOrderFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
