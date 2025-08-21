// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'step_timer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StepTimerState {

// --- Core Status ---
 TimerStatus get status; int get currentStepIndex;// --- Time Tracking ---
// This will now become negative when the step goes overtime
 int get elapsedSecondsInStep;// This will always increment, tracking the true total time
 int get totalElapsedTime;// --- UI-Specific Derived Data ---
// Calculated from totalElapsedTime, so it always moves forward
 double get overallProgress; TimerColorStatus get timerColor;
/// Create a copy of StepTimerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StepTimerStateCopyWith<StepTimerState> get copyWith => _$StepTimerStateCopyWithImpl<StepTimerState>(this as StepTimerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StepTimerState&&(identical(other.status, status) || other.status == status)&&(identical(other.currentStepIndex, currentStepIndex) || other.currentStepIndex == currentStepIndex)&&(identical(other.elapsedSecondsInStep, elapsedSecondsInStep) || other.elapsedSecondsInStep == elapsedSecondsInStep)&&(identical(other.totalElapsedTime, totalElapsedTime) || other.totalElapsedTime == totalElapsedTime)&&(identical(other.overallProgress, overallProgress) || other.overallProgress == overallProgress)&&(identical(other.timerColor, timerColor) || other.timerColor == timerColor));
}


@override
int get hashCode => Object.hash(runtimeType,status,currentStepIndex,elapsedSecondsInStep,totalElapsedTime,overallProgress,timerColor);

@override
String toString() {
  return 'StepTimerState(status: $status, currentStepIndex: $currentStepIndex, elapsedSecondsInStep: $elapsedSecondsInStep, totalElapsedTime: $totalElapsedTime, overallProgress: $overallProgress, timerColor: $timerColor)';
}


}

/// @nodoc
abstract mixin class $StepTimerStateCopyWith<$Res>  {
  factory $StepTimerStateCopyWith(StepTimerState value, $Res Function(StepTimerState) _then) = _$StepTimerStateCopyWithImpl;
@useResult
$Res call({
 TimerStatus status, int currentStepIndex, int elapsedSecondsInStep, int totalElapsedTime, double overallProgress, TimerColorStatus timerColor
});




}
/// @nodoc
class _$StepTimerStateCopyWithImpl<$Res>
    implements $StepTimerStateCopyWith<$Res> {
  _$StepTimerStateCopyWithImpl(this._self, this._then);

  final StepTimerState _self;
  final $Res Function(StepTimerState) _then;

/// Create a copy of StepTimerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? currentStepIndex = null,Object? elapsedSecondsInStep = null,Object? totalElapsedTime = null,Object? overallProgress = null,Object? timerColor = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TimerStatus,currentStepIndex: null == currentStepIndex ? _self.currentStepIndex : currentStepIndex // ignore: cast_nullable_to_non_nullable
as int,elapsedSecondsInStep: null == elapsedSecondsInStep ? _self.elapsedSecondsInStep : elapsedSecondsInStep // ignore: cast_nullable_to_non_nullable
as int,totalElapsedTime: null == totalElapsedTime ? _self.totalElapsedTime : totalElapsedTime // ignore: cast_nullable_to_non_nullable
as int,overallProgress: null == overallProgress ? _self.overallProgress : overallProgress // ignore: cast_nullable_to_non_nullable
as double,timerColor: null == timerColor ? _self.timerColor : timerColor // ignore: cast_nullable_to_non_nullable
as TimerColorStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [StepTimerState].
extension StepTimerStatePatterns on StepTimerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StepTimerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StepTimerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StepTimerState value)  $default,){
final _that = this;
switch (_that) {
case _StepTimerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StepTimerState value)?  $default,){
final _that = this;
switch (_that) {
case _StepTimerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TimerStatus status,  int currentStepIndex,  int elapsedSecondsInStep,  int totalElapsedTime,  double overallProgress,  TimerColorStatus timerColor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StepTimerState() when $default != null:
return $default(_that.status,_that.currentStepIndex,_that.elapsedSecondsInStep,_that.totalElapsedTime,_that.overallProgress,_that.timerColor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TimerStatus status,  int currentStepIndex,  int elapsedSecondsInStep,  int totalElapsedTime,  double overallProgress,  TimerColorStatus timerColor)  $default,) {final _that = this;
switch (_that) {
case _StepTimerState():
return $default(_that.status,_that.currentStepIndex,_that.elapsedSecondsInStep,_that.totalElapsedTime,_that.overallProgress,_that.timerColor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TimerStatus status,  int currentStepIndex,  int elapsedSecondsInStep,  int totalElapsedTime,  double overallProgress,  TimerColorStatus timerColor)?  $default,) {final _that = this;
switch (_that) {
case _StepTimerState() when $default != null:
return $default(_that.status,_that.currentStepIndex,_that.elapsedSecondsInStep,_that.totalElapsedTime,_that.overallProgress,_that.timerColor);case _:
  return null;

}
}

}

/// @nodoc


class _StepTimerState implements StepTimerState {
  const _StepTimerState({required this.status, required this.currentStepIndex, required this.elapsedSecondsInStep, required this.totalElapsedTime, required this.overallProgress, required this.timerColor});
  

// --- Core Status ---
@override final  TimerStatus status;
@override final  int currentStepIndex;
// --- Time Tracking ---
// This will now become negative when the step goes overtime
@override final  int elapsedSecondsInStep;
// This will always increment, tracking the true total time
@override final  int totalElapsedTime;
// --- UI-Specific Derived Data ---
// Calculated from totalElapsedTime, so it always moves forward
@override final  double overallProgress;
@override final  TimerColorStatus timerColor;

/// Create a copy of StepTimerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StepTimerStateCopyWith<_StepTimerState> get copyWith => __$StepTimerStateCopyWithImpl<_StepTimerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StepTimerState&&(identical(other.status, status) || other.status == status)&&(identical(other.currentStepIndex, currentStepIndex) || other.currentStepIndex == currentStepIndex)&&(identical(other.elapsedSecondsInStep, elapsedSecondsInStep) || other.elapsedSecondsInStep == elapsedSecondsInStep)&&(identical(other.totalElapsedTime, totalElapsedTime) || other.totalElapsedTime == totalElapsedTime)&&(identical(other.overallProgress, overallProgress) || other.overallProgress == overallProgress)&&(identical(other.timerColor, timerColor) || other.timerColor == timerColor));
}


@override
int get hashCode => Object.hash(runtimeType,status,currentStepIndex,elapsedSecondsInStep,totalElapsedTime,overallProgress,timerColor);

@override
String toString() {
  return 'StepTimerState(status: $status, currentStepIndex: $currentStepIndex, elapsedSecondsInStep: $elapsedSecondsInStep, totalElapsedTime: $totalElapsedTime, overallProgress: $overallProgress, timerColor: $timerColor)';
}


}

/// @nodoc
abstract mixin class _$StepTimerStateCopyWith<$Res> implements $StepTimerStateCopyWith<$Res> {
  factory _$StepTimerStateCopyWith(_StepTimerState value, $Res Function(_StepTimerState) _then) = __$StepTimerStateCopyWithImpl;
@override @useResult
$Res call({
 TimerStatus status, int currentStepIndex, int elapsedSecondsInStep, int totalElapsedTime, double overallProgress, TimerColorStatus timerColor
});




}
/// @nodoc
class __$StepTimerStateCopyWithImpl<$Res>
    implements _$StepTimerStateCopyWith<$Res> {
  __$StepTimerStateCopyWithImpl(this._self, this._then);

  final _StepTimerState _self;
  final $Res Function(_StepTimerState) _then;

/// Create a copy of StepTimerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? currentStepIndex = null,Object? elapsedSecondsInStep = null,Object? totalElapsedTime = null,Object? overallProgress = null,Object? timerColor = null,}) {
  return _then(_StepTimerState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TimerStatus,currentStepIndex: null == currentStepIndex ? _self.currentStepIndex : currentStepIndex // ignore: cast_nullable_to_non_nullable
as int,elapsedSecondsInStep: null == elapsedSecondsInStep ? _self.elapsedSecondsInStep : elapsedSecondsInStep // ignore: cast_nullable_to_non_nullable
as int,totalElapsedTime: null == totalElapsedTime ? _self.totalElapsedTime : totalElapsedTime // ignore: cast_nullable_to_non_nullable
as int,overallProgress: null == overallProgress ? _self.overallProgress : overallProgress // ignore: cast_nullable_to_non_nullable
as double,timerColor: null == timerColor ? _self.timerColor : timerColor // ignore: cast_nullable_to_non_nullable
as TimerColorStatus,
  ));
}


}

// dart format on
