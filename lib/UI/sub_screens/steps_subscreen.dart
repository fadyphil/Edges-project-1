import 'package:flutter/material.dart' hide Step;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_project_1/UI/widgets/timelinebar.dart';
import 'package:mini_project_1/UI/widgets/step_card.dart';
import '../../data/models/recipe_model.dart';


class TimeLineAndStepsSlivers extends StatelessWidget {

  const TimeLineAndStepsSlivers({
    super.key, 
    required this.recipe
    });

  final Recipe recipe;


  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
    slivers: [
    // 1. A sliver that contains the timeline UI (tags and bar).
    SliverToBoxAdapter(
      child: TimelineBar(recipe: recipe),
    ),
     SliverToBoxAdapter(child: SvgPicture.asset('assets/images/separator.svg')),
     SliverToBoxAdapter(child: const SizedBox(height: 16)),
    // 2. The sliver list containing all the steps.
    StepsSlivers(recipe: recipe),
    SliverToBoxAdapter(child: const SizedBox(height: 70)),
    
  ]
    ); 
  }
}


class StepsSlivers extends StatelessWidget {

  const StepsSlivers({
    super.key, 
    required this.recipe
    });

  final Recipe recipe;


  @override
  Widget build(BuildContext context) {
    // Assuming recipe.steps is a List<String>
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final step = recipe.steps[index];
          return StepCard(index: index, step: step);
          },
        childCount: recipe.steps.length,
      ),

    );
  }
}
