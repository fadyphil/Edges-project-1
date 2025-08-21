// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourited_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavouritedState {

 Set<Recipe> get favouritedRecipes;
/// Create a copy of FavouritedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavouritedStateCopyWith<FavouritedState> get copyWith => _$FavouritedStateCopyWithImpl<FavouritedState>(this as FavouritedState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavouritedState&&const DeepCollectionEquality().equals(other.favouritedRecipes, favouritedRecipes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(favouritedRecipes));

@override
String toString() {
  return 'FavouritedState(favouritedRecipes: $favouritedRecipes)';
}


}

/// @nodoc
abstract mixin class $FavouritedStateCopyWith<$Res>  {
  factory $FavouritedStateCopyWith(FavouritedState value, $Res Function(FavouritedState) _then) = _$FavouritedStateCopyWithImpl;
@useResult
$Res call({
 Set<Recipe> favouritedRecipes
});




}
/// @nodoc
class _$FavouritedStateCopyWithImpl<$Res>
    implements $FavouritedStateCopyWith<$Res> {
  _$FavouritedStateCopyWithImpl(this._self, this._then);

  final FavouritedState _self;
  final $Res Function(FavouritedState) _then;

/// Create a copy of FavouritedState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? favouritedRecipes = null,}) {
  return _then(_self.copyWith(
favouritedRecipes: null == favouritedRecipes ? _self.favouritedRecipes : favouritedRecipes // ignore: cast_nullable_to_non_nullable
as Set<Recipe>,
  ));
}

}


/// Adds pattern-matching-related methods to [FavouritedState].
extension FavouritedStatePatterns on FavouritedState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Loaded value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Loaded() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Loaded value)  $default,){
final _that = this;
switch (_that) {
case _Loaded():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Loaded value)?  $default,){
final _that = this;
switch (_that) {
case _Loaded() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Set<Recipe> favouritedRecipes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loaded() when $default != null:
return $default(_that.favouritedRecipes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Set<Recipe> favouritedRecipes)  $default,) {final _that = this;
switch (_that) {
case _Loaded():
return $default(_that.favouritedRecipes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Set<Recipe> favouritedRecipes)?  $default,) {final _that = this;
switch (_that) {
case _Loaded() when $default != null:
return $default(_that.favouritedRecipes);case _:
  return null;

}
}

}

/// @nodoc


class _Loaded implements FavouritedState {
  const _Loaded({final  Set<Recipe> favouritedRecipes = const {}}): _favouritedRecipes = favouritedRecipes;
  

 final  Set<Recipe> _favouritedRecipes;
@override@JsonKey() Set<Recipe> get favouritedRecipes {
  if (_favouritedRecipes is EqualUnmodifiableSetView) return _favouritedRecipes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_favouritedRecipes);
}


/// Create a copy of FavouritedState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._favouritedRecipes, _favouritedRecipes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_favouritedRecipes));

@override
String toString() {
  return 'FavouritedState(favouritedRecipes: $favouritedRecipes)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $FavouritedStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@override @useResult
$Res call({
 Set<Recipe> favouritedRecipes
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of FavouritedState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? favouritedRecipes = null,}) {
  return _then(_Loaded(
favouritedRecipes: null == favouritedRecipes ? _self._favouritedRecipes : favouritedRecipes // ignore: cast_nullable_to_non_nullable
as Set<Recipe>,
  ));
}


}

// dart format on
