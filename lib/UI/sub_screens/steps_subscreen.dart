import 'package:flutter/material.dart' hide Step;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/UI/widgets/timelinebar.dart';
import 'package:mini_project_1/UI/widgets/step_card.dart';
import '../../data/models/recipe_model.dart';


List<Widget> buildTimelineAndStepsSlivers(Recipe recipe, num userfactor) {

  return [
    // 1. A sliver that contains the timeline UI (tags and bar).
    SliverToBoxAdapter(
      child: TimelineBar(recipe: recipe, userfactor: userfactor),
    ),
     SliverToBoxAdapter(child: SvgPicture.asset('assets/images/separator.svg')),
     SliverToBoxAdapter(child: const SizedBox(height: 16)),
    // 2. The sliver list containing all the steps.
    _buildStepsSlivers(recipe, userfactor),
    SliverToBoxAdapter(child: const SizedBox(height: 70)),
    
  ];
}


SliverList _buildStepsSlivers(Recipe recipe,num userfactor) {
    // Assuming recipe.steps is a List<String>
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final step = recipe.steps[index];
          return StepCard(index: index, step: step, userfactor: userfactor,);
          },
        childCount: recipe.steps.length,
      ),

    );
  }







Widget  buildStepType(String type, {num? extranumber}){
  Color color;
  Color textColor;
  if(type=='cooking'){
    color= const Color(0xFFDB7A2B).withValues(alpha:  0.2);
    textColor  = const Color(0xFFDB7A2B);
  }else {
     color= const Color(0xFF239D66).withValues(alpha:  0.2);
     textColor= const Color(0xFF239D66);
  }
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),

    ),
    child: Row(
      spacing: 4,
      mainAxisSize: MainAxisSize.min,
      
      children: [
        CircleAvatar(
          radius: 4,
          backgroundColor: textColor,
        ),
        Text(type[0].toUpperCase() + type.substring(1).toLowerCase(), style: GoogleFonts.nunito(
          color: textColor, fontSize: 14, fontWeight: FontWeight.w600,
        ),),
        if(extranumber!=null) Text('- ${extranumber.toString()}m', style: TextStyle(
          color: textColor, fontSize: 14, fontWeight: FontWeight.w600,
        ),)
      ],
    ),
  );
}

