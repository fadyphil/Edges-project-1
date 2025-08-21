import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_project_1/data/models/enums.dart';

part 'step_timer_state.freezed.dart';


@freezed
abstract class StepTimerState with _$StepTimerState {
  const factory StepTimerState({
    // --- Core Status ---
    required TimerStatus status,
    required int currentStepIndex,

    // --- Time Tracking ---
    // This will now become negative when the step goes overtime
    required int elapsedSecondsInStep, 
    // This will always increment, tracking the true total time
    required int totalElapsedTime,       

    // --- UI-Specific Derived Data ---
    // Calculated from totalElapsedTime, so it always moves forward
    required double overallProgress,    
    required TimerColorStatus timerColor, 
  }) = _StepTimerState;
}

