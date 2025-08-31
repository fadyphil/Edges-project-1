import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_1/blocs/user/user_cubit.dart';
import 'package:mini_project_1/data/models/recipe_model.dart';

class InfoRowBuilder extends StatelessWidget {
  const InfoRowBuilder({
    
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final  userfactor = context.watch<UserCubit>().getUsersFactor();
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