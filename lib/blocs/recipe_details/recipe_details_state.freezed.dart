// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecipeDetailsState implements DiagnosticableTreeMixin {

 Recipe get recipe; RecipeTab get tab;
/// Create a copy of RecipeDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeDetailsStateCopyWith<RecipeDetailsState> get copyWith => _$RecipeDetailsStateCopyWithImpl<RecipeDetailsState>(this as RecipeDetailsState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RecipeDetailsState'))
    ..add(DiagnosticsProperty('recipe', recipe))..add(DiagnosticsProperty('tab', tab));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeDetailsState&&(identical(other.recipe, recipe) || other.recipe == recipe)&&(identical(other.tab, tab) || other.tab == tab));
}


@override
int get hashCode => Object.hash(runtimeType,recipe,tab);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RecipeDetailsState(recipe: $recipe, tab: $tab)';
}


}

/// @nodoc
abstract mixin class $RecipeDetailsStateCopyWith<$Res>  {
  factory $RecipeDetailsStateCopyWith(RecipeDetailsState value, $Res Function(RecipeDetailsState) _then) = _$RecipeDetailsStateCopyWithImpl;
@useResult
$Res call({
 Recipe recipe, RecipeTab tab
});


$RecipeCopyWith<$Res> get recipe;

}
/// @nodoc
class _$RecipeDetailsStateCopyWithImpl<$Res>
    implements $RecipeDetailsStateCopyWith<$Res> {
  _$RecipeDetailsStateCopyWithImpl(this._self, this._then);

  final RecipeDetailsState _self;
  final $Res Function(RecipeDetailsState) _then;

/// Create a copy of RecipeDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipe = null,Object? tab = null,}) {
  return _then(_self.copyWith(
recipe: null == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as Recipe,tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as RecipeTab,
  ));
}
/// Create a copy of RecipeDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeCopyWith<$Res> get recipe {
  
  return $RecipeCopyWith<$Res>(_self.recipe, (value) {
    return _then(_self.copyWith(recipe: value));
  });
}
}


/// Adds pattern-matching-related methods to [RecipeDetailsState].
extension RecipeDetailsStatePatterns on RecipeDetailsState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Recipe recipe,  RecipeTab tab)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loaded() when $default != null:
return $default(_that.recipe,_that.tab);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Recipe recipe,  RecipeTab tab)  $default,) {final _that = this;
switch (_that) {
case _Loaded():
return $default(_that.recipe,_that.tab);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Recipe recipe,  RecipeTab tab)?  $default,) {final _that = this;
switch (_that) {
case _Loaded() when $default != null:
return $default(_that.recipe,_that.tab);case _:
  return null;

}
}

}

/// @nodoc


class _Loaded with DiagnosticableTreeMixin implements RecipeDetailsState {
  const _Loaded({required this.recipe, this.tab = RecipeTab.overview});
  

@override final  Recipe recipe;
@override@JsonKey() final  RecipeTab tab;

/// Create a copy of RecipeDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RecipeDetailsState'))
    ..add(DiagnosticsProperty('recipe', recipe))..add(DiagnosticsProperty('tab', tab));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.recipe, recipe) || other.recipe == recipe)&&(identical(other.tab, tab) || other.tab == tab));
}


@override
int get hashCode => Object.hash(runtimeType,recipe,tab);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RecipeDetailsState(recipe: $recipe, tab: $tab)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $RecipeDetailsStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@override @useResult
$Res call({
 Recipe recipe, RecipeTab tab
});


@override $RecipeCopyWith<$Res> get recipe;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of RecipeDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipe = null,Object? tab = null,}) {
  return _then(_Loaded(
recipe: null == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as Recipe,tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as RecipeTab,
  ));
}

/// Create a copy of RecipeDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeCopyWith<$Res> get recipe {
  
  return $RecipeCopyWith<$Res>(_self.recipe, (value) {
    return _then(_self.copyWith(recipe: value));
  });
}
}

// dart format on
