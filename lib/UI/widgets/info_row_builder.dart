import 'package:flutter/material.dart';
import 'package:mini_project_1/data/models/recipe_model.dart';

// ignore: camel_case_types
class info_row_builder extends StatelessWidget {
  const info_row_builder({
    
    super.key,
    required this.recipe,
    required this.userfactor,
  });

  final Recipe recipe;
  final double userfactor;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Icon(Icons.timer_outlined, color: Color(0xFF888481), size: 12),
        const SizedBox(width: 4),
        Text(
          '${(recipe.totalBaseTimeInSeconds ~/ 60 * userfactor).ceil()} Minutes',
          style:Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(width: 4),
         Text('-', style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(width: 4),
        const Icon(Icons.food_bank_outlined, color: Color(0xFF888481), size: 12),
        const SizedBox(width: 4),
        Text(
          '${recipe.stepCount} Steps',
          style:Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}