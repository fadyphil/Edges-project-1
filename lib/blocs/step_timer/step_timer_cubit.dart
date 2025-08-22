import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_1/data/models/enums.dart';
import 'package:mini_project_1/data/models/recipe_model.dart';
import 'package:mini_project_1/data/models/step_model.dart';
import 'step_timer_state.dart';

class StepTimerCubit extends Cubit<StepTimerState> {
  final Recipe recipe;
  final double userfactor ;
  Timer? _timer;

  StepTimerCubit( {required this.recipe, required this.userfactor })
      : super(
          StepTimerState(
            currentStepIndex: 0,
            // CHANGE: The timer for each step now starts at 0.
            elapsedSecondsInStep: 0, 
            totalElapsedTime: 0,
            status: TimerStatus.initial,
            timerColor: TimerColorStatus.normal,
            overallProgress: 0.0,
          ),
        );

  // --- PUBLIC ACTIONS (Called from the UI) ---

  void startTimer() {
    if (state.status == TimerStatus.running) return;
    _startTicker();
  }

  void pauseTimer() {
    _timer?.cancel();
    emit(state.copyWith(status: TimerStatus.paused));
  }
  
  void completeStepAndMoveToNext() {
    final nextIndex = state.currentStepIndex + 1;

    if (nextIndex < recipe.steps.length) {
      _timer?.cancel();
      emit(state.copyWith(
        currentStepIndex: nextIndex,
        // CHANGE: Reset the step timer back to 0 for the new step.
        elapsedSecondsInStep: 0, 
        status: TimerStatus.initial,
        timerColor: TimerColorStatus.normal,
      ));
    } else {
      finishRecipe();
    }
  }

  void finishRecipe() {
    _timer?.cancel();
    emit(state.copyWith(status: TimerStatus.finished));
  }

  // --- PRIVATE LOGIC ---

  void _startTicker() {
    emit(state.copyWith(status: TimerStatus.running));
    _timer = Timer.periodic(const Duration(seconds: 1), _onTick);
  }

  void _onTick(Timer timer) {
    // --- TIME CALCULATIONS (NOW INCREMENTING) ---
    final newElapsedSecondsInStep = state.elapsedSecondsInStep + 1;
    final newTotalElapsedTime = state.totalElapsedTime + 1;
    
    // --- DERIVED STATE CALCULATIONS ---
    final overallProgress = newTotalElapsedTime / recipe.totalBaseTimeInSeconds;
    // The color logic is now based on the elapsed time for the current step.
    final timerColor = _calculateTimerColor(newElapsedSecondsInStep, state.currentStepIndex,userfactor );

    // --- EMIT NEW STATE ---
    emit(state.copyWith(
      elapsedSecondsInStep: newElapsedSecondsInStep,
      totalElapsedTime: newTotalElapsedTime,
      overallProgress: overallProgress.clamp(0.0, 1.0),
      timerColor: timerColor,
    ));
  }
  
  // --- REWRITTEN LOGIC for the color calculation ---
  TimerColorStatus _calculateTimerColor(int elapsedSeconds, int currentStepIndex, double userfactor) {
    // Get the data for the current step from our source of truth (the recipe model).
    final Step currentStep = recipe.steps[currentStepIndex];
    final double baseTime = currentStep.baseTimeInSeconds*userfactor;
    final int acceptanceMargin = recipe.acceptanceMarginInSeconds;

    // If we are still within the recommended time, the color is normal.
    if (elapsedSeconds <= baseTime) {
      return TimerColorStatus.normal;
    }
    
    // We are now in overtime. Calculate how much.
    final double overtimeSeconds = elapsedSeconds - baseTime;

    // If the overtime is within the acceptance margin, the color is orange.
    if (overtimeSeconds <= acceptanceMargin) {
      return TimerColorStatus.acceptanceMargin;
    }
    
    // We have exceeded the acceptance margin. The color is red.
    return TimerColorStatus.overtime;
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }



  double get finalelapsedTime => state.totalElapsedTime.toDouble();
}

