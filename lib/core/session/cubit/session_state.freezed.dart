// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionState()';
}


}

/// @nodoc
class $SessionStateCopyWith<$Res>  {
$SessionStateCopyWith(SessionState _, $Res Function(SessionState) __);
}


/// Adds pattern-matching-related methods to [SessionState].
extension SessionStatePatterns on SessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Active value)?  active,TResult Function( _Inactive value)?  inactive,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Active() when active != null:
return active(_that);case _Inactive() when inactive != null:
return inactive(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Active value)  active,required TResult Function( _Inactive value)  inactive,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Active():
return active(_that);case _Inactive():
return inactive(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Active value)?  active,TResult? Function( _Inactive value)?  inactive,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Active() when active != null:
return active(_that);case _Inactive() when inactive != null:
return inactive(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( UserEntity user,  String companyId)?  active,TResult Function()?  inactive,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Active() when active != null:
return active(_that.user,_that.companyId);case _Inactive() when inactive != null:
return inactive();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( UserEntity user,  String companyId)  active,required TResult Function()  inactive,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Active():
return active(_that.user,_that.companyId);case _Inactive():
return inactive();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( UserEntity user,  String companyId)?  active,TResult? Function()?  inactive,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Active() when active != null:
return active(_that.user,_that.companyId);case _Inactive() when inactive != null:
return inactive();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SessionState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionState.initial()';
}


}




/// @nodoc


class _Active implements SessionState {
  const _Active({required this.user, required this.companyId});
  

 final  UserEntity user;
 final  String companyId;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActiveCopyWith<_Active> get copyWith => __$ActiveCopyWithImpl<_Active>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Active&&(identical(other.user, user) || other.user == user)&&(identical(other.companyId, companyId) || other.companyId == companyId));
}


@override
int get hashCode => Object.hash(runtimeType,user,companyId);

@override
String toString() {
  return 'SessionState.active(user: $user, companyId: $companyId)';
}


}

/// @nodoc
abstract mixin class _$ActiveCopyWith<$Res> implements $SessionStateCopyWith<$Res> {
  factory _$ActiveCopyWith(_Active value, $Res Function(_Active) _then) = __$ActiveCopyWithImpl;
@useResult
$Res call({
 UserEntity user, String companyId
});




}
/// @nodoc
class __$ActiveCopyWithImpl<$Res>
    implements _$ActiveCopyWith<$Res> {
  __$ActiveCopyWithImpl(this._self, this._then);

  final _Active _self;
  final $Res Function(_Active) _then;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? companyId = null,}) {
  return _then(_Active(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Inactive implements SessionState {
  const _Inactive();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Inactive);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionState.inactive()';
}


}




// dart format on
