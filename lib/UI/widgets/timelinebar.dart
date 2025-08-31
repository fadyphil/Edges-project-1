// lib/UI/widgets/timelinebar.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_1/UI/widgets/step_type_tag.dart';
import 'package:mini_project_1/blocs/user/user_cubit.dart';
import 'package:mini_project_1/data/models/recipe_model.dart';

class TimelineBar extends StatelessWidget {
  final Recipe recipe;
  final Color? timerColor;
  
  // NEW: We now need the current step's index and its progress.
  final int? currentStepIndex;
  final int? elapsedSecondsInStep;

  const TimelineBar({
    super.key,
    required this.recipe,
    this.currentStepIndex,
    this.elapsedSecondsInStep,
    this.timerColor,
  });

  static const Color prepColor = Color(0xFF239D66);
  static const Color cookColor = Color(0xFFDB7A2B);

  @override
  Widget build(BuildContext context) {
    final userfactor =context.watch<UserCubit>().getUsersFactor();
    final int prepTimeMinutes = (recipe.prepTimeInSeconds / 60 * userfactor).ceil();
    final int cookingTimeMinutes = (recipe.cookingTimeInSeconds / 60 * userfactor).ceil();

    // --- 1. CALCULATE THE SIZE OF EACH STEP'S "CHUNK" ---
    final int totalSteps = recipe.steps.length;
    if (totalSteps == 0) return const SizedBox.shrink(); // Avoid division by zero
    
    // Get the full available width for the timeline bar
    final double totalWidth = MediaQuery.of(context).size.width - 32;
    // Calculate the width allocated to each step
    final double widthPerStep = totalWidth / totalSteps;

    // --- 2. CALCULATE THE INDICATOR'S POSITION ---
    double indicatorPosition = 0;
    
    // Only calculate a position if we are actively timing a step.
    if (currentStepIndex != null && elapsedSecondsInStep != null) {
      // Get the time for the current step
      final currentStep = recipe.steps[currentStepIndex!];
      final num currentStepTotalTime = currentStep.baseTimeInSeconds * userfactor;

      // Calculate progress within the current step (0.0 to 1.0)
      double progressInCurrentStep = currentStepTotalTime > 0 
          ? elapsedSecondsInStep! / currentStepTotalTime 
          : 0.0;
      progressInCurrentStep = progressInCurrentStep.clamp(0.0, 1.0);

      // Calculate the final position using the logic we defined
      final double basePosition = currentStepIndex! * widthPerStep;
      final double progressPosition = progressInCurrentStep * widthPerStep;
      indicatorPosition = basePosition + progressPosition;

      // Clamp the final value to prevent any minor floating point overflows
      indicatorPosition = indicatorPosition.clamp(0.0, totalWidth);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('TimeLine', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            StepTypeTag(type: 'Prep'.toLowerCase(), extranumber: prepTimeMinutes),
            StepTypeTag(type: 'Cooking'.toLowerCase(), extranumber: cookingTimeMinutes),
          ],
        ),
        const SizedBox(height: 8),
        Stack(
          clipBehavior: Clip.none,
          children: [
            _buildTimelineBar(recipe, userfactor, prepColor, cookColor),
            // Only show the indicator if we are actively timing.
            if (currentStepIndex != null)
              Positioned(
                left: indicatorPosition,
                top: -5,
                child: _buildIndictorStep(timerColor!),
              ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

// Helper widgets _buildTimelineBar and _buildIndictorStep remain the same
Widget _buildTimelineBar(Recipe recipe, num userfactor, Color prepColor, Color cookColor) {
  final int totalTime = recipe.prepTimeInSeconds + recipe.cookingTimeInSeconds;
  final double prepPercentage = totalTime > 0 ? recipe.prepTimeInSeconds / totalTime : 0;
  
  const double blendRange = 0.05;
  final double stop1 = (prepPercentage - blendRange).clamp(0.0, 1.0);
  final double stop2 = (prepPercentage + blendRange).clamp(0.0, 1.0);

  return Container(
    height: 20,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: Colors.white.withValues(alpha: .1), width: 1),
      gradient: LinearGradient(
        colors: [
          prepColor.withValues(alpha: .2),
          prepColor.withValues(alpha: .2),
          cookColor.withValues(alpha: .2),
          cookColor.withValues(alpha: .2),
        ],
        stops: [0.0, stop1, stop2, 1.0],
      ),
    ),
  );
}

Widget _buildIndictorStep(Color timerColor) {
  return Container(
    height: 30,
    width: 2,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: timerColor,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: .5),
          blurRadius: 4,
          offset: const Offset(1, 1),
        )
      ],
    ),
  );
}