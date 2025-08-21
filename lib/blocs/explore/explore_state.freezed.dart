// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explore_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExploreState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExploreState()';
}


}

/// @nodoc
class $ExploreStateCopyWith<$Res>  {
$ExploreStateCopyWith(ExploreState _, $Res Function(ExploreState) __);
}


/// Adds pattern-matching-related methods to [ExploreState].
extension ExploreStatePatterns on ExploreState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loaded value)  loaded,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loaded():
return loaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loaded value)?  loaded,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( List<Recipe> allRecipes,  String searchQuery,  ExploreViewType viewType)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loaded() when loaded != null:
return loaded(_that.allRecipes,_that.searchQuery,_that.viewType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( List<Recipe> allRecipes,  String searchQuery,  ExploreViewType viewType)  loaded,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loaded():
return loaded(_that.allRecipes,_that.searchQuery,_that.viewType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( List<Recipe> allRecipes,  String searchQuery,  ExploreViewType viewType)?  loaded,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loaded() when loaded != null:
return loaded(_that.allRecipes,_that.searchQuery,_that.viewType);case _:
  return null;

}
}

}

/// @nodoc


class _Initial extends ExploreState {
  const _Initial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExploreState.initial()';
}


}




/// @nodoc


class _Loaded extends ExploreState {
  const _Loaded({required final  List<Recipe> allRecipes, this.searchQuery = '', this.viewType = ExploreViewType.list}): _allRecipes = allRecipes,super._();
  

/// The master list of all recipes from the data source.
 final  List<Recipe> _allRecipes;
/// The master list of all recipes from the data source.
 List<Recipe> get allRecipes {
  if (_allRecipes is EqualUnmodifiableListView) return _allRecipes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allRecipes);
}

/// The current text in the search bar. Defaults to empty.
@JsonKey() final  String searchQuery;
/// The current view mode (list or grid). Defaults to list.
@JsonKey() final  ExploreViewType viewType;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._allRecipes, _allRecipes)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.viewType, viewType) || other.viewType == viewType));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_allRecipes),searchQuery,viewType);

@override
String toString() {
  return 'ExploreState.loaded(allRecipes: $allRecipes, searchQuery: $searchQuery, viewType: $viewType)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $ExploreStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<Recipe> allRecipes, String searchQuery, ExploreViewType viewType
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? allRecipes = null,Object? searchQuery = null,Object? viewType = null,}) {
  return _then(_Loaded(
allRecipes: null == allRecipes ? _self._allRecipes : allRecipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,viewType: null == viewType ? _self.viewType : viewType // ignore: cast_nullable_to_non_nullable
as ExploreViewType,
  ));
}


}

// dart format on
