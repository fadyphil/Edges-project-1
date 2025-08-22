import 'package:flutter/material.dart';
import 'package:mini_project_1/UI/widgets/step_type_tag.dart';
import 'package:mini_project_1/data/models/recipe_model.dart';

class TimelineBar extends StatelessWidget {
  final Recipe recipe;
  final num userfactor;
  const TimelineBar({
    super.key,
    required this.recipe, required this.userfactor,
  });




  // The colors are now part of this specific widget's styling.
  static const Color prepColor = Color(0xFF239D66);
  static const Color cookColor = Color(0xFFDB7A2B);

  @override
  Widget build(BuildContext context) {
    final int prepTimeMinutes = (recipe.prepTimeInSeconds / 60 * userfactor).ceil();
    final int cookingTimeMinutes = (recipe.cookingTimeInSeconds / 60 * userfactor).ceil();
    final int totalTime = prepTimeMinutes + cookingTimeMinutes;
    final double prepPercentage = totalTime > 0 ? prepTimeMinutes / totalTime : 0;

    return Column(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('TimeLine', style:Theme.of(context).textTheme.headlineMedium),

            Wrap(
              spacing: 50,
              runSpacing: 8,
              children: [
                StepTypeTag(type: 'Prep'.toLowerCase(), extranumber: prepTimeMinutes,),
                StepTypeTag(type: 'Cooking'.toLowerCase(), extranumber: cookingTimeMinutes,),
              ],
            ),
  
            if (totalTime > 0) _buildTimelineBar(recipe, userfactor, prepColor, cookColor, prepPercentage),
           const SizedBox(height: 8),
          ],
        );
  }
}

Widget _buildTimelineBar(Recipe recipe, num userfactor ,Color prepColor, Color cookColor, double prepPercentage){
   
    // This is the exact logic from your old _buildTimelineBar function.
    const double blendRange = 0.05;
    final double stop1 = (prepPercentage - blendRange).clamp(0.0, 1.0);
    final double stop2 = (prepPercentage + blendRange).clamp(0.0, 1.0);
  return Container(
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
        gradient: LinearGradient(
          colors: [
            prepColor.withOpacity(0.2),
            prepColor.withOpacity(0.2),
            cookColor.withOpacity(0.2),
            cookColor.withOpacity(0.2),
          ],
          stops: [0.0, stop1, stop2, 1.0],
        ),
      ),
    );
}