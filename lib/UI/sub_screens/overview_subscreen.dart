import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/blocs/user/user_cubit.dart';
import 'package:mini_project_1/data/models/enums.dart';
import 'package:mini_project_1/data/models/recipe_model.dart';

class OverViewSubScreen extends StatelessWidget {

  const OverViewSubScreen({
    super.key, 
    required this.recipe, 

    });

  final Recipe recipe;


  @override
  Widget build(BuildContext context) {
      return SliverMainAxisGroup(
      slivers: [
    SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: OverViewContent(
          recipe:recipe, 
          ),
      ),
    ),
    IngredientsSliverList(recipe:recipe),
    SliverToBoxAdapter(child: const SizedBox(height: 16)),
    SliverToBoxAdapter(child: SvgPicture.asset('assets/images/separator.svg')),
    SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Text(
          'Nutrition',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    ),
    SliverToBoxAdapter(
      child: NutritionFacts(
        recipe: recipe
        ),
    ),
    SliverToBoxAdapter(child: const SizedBox(height: 80)),
    ]
  );
  }
}

class IngredientsSliverList extends StatelessWidget {

  const IngredientsSliverList({
    super.key, 
    required this.recipe
    });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
    itemCount: recipe.ingredients.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  recipe.ingredients[index].quantity.toInt().toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(width: 4),
                Text(
                  recipe.ingredients[index].unit.name[0].toUpperCase() + recipe.ingredients[index].unit.name.substring(1),
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
            Text(recipe.ingredients[index].name,
                style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
      );
    },
    separatorBuilder: (context, index) => const SizedBox(height: 8),
  );
  }
}

class OverViewContent extends StatelessWidget {

  const OverViewContent({
    super.key, 
    required this.recipe, 
    });

  final Recipe recipe;


  @override
  Widget build(BuildContext context) {
    final userfactor = context.watch<UserCubit>().getUsersFactor();
    return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(height: 16),
      Row(
        children: [

          Expanded(
            child: InfoCard(
              icon: 'timer',
              title: "Total time", 
              value: '${(recipe.totalBaseTimeInSeconds / 60 * userfactor).ceil()} Minutes'
             )
           ),

          const SizedBox(width: 8),

          Expanded(
            child: InfoCard(
              icon:'steps', 
              title: "Steps", 
              value: '${recipe.stepCount} Steps'
                )
              ),
        ],
      ),

      const SizedBox(height: 8),

      Row(

        children: [

          Expanded(
              child: InfoCard(
                icon:'difficulty', 
                title: "Difficulty", 
                value: recipe.difficulty.name,
                drawdots: DifficultyDots(
                  difficulty: recipe.difficulty
                      )
                    )
                  ),

          const SizedBox(width: 8),

          Expanded(
            child: InfoCard(
              icon:'acceptance_margin', 
              title: "Acceptance Margin", 
              value: '${recipe.acceptanceMarginInSeconds ~/ 60} Minutes'
                  )
                ),
          ],
        ),

      const SizedBox(height: 16),

      SvgPicture.asset('assets/images/separator.svg'),

      const SizedBox(height: 16),

      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "\" ${recipe.description}",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
        ),
      ),
      const SizedBox(height: 16),
      SvgPicture.asset('assets/images/separator.svg'),
      const SizedBox(height: 16),
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Ingredients',
          style:Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      const SizedBox(height: 16),
    ],
  );
  }
}

class InfoCard extends StatelessWidget {

  const InfoCard({
    super.key, 
    required this.icon, 
    required this.title, 
    required this.value, 
    this.drawdots
    });

  final String icon;
  final String title;
  final String value;
  final Widget? drawdots;
  

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8), // Added right padding
    decoration: BoxDecoration(
      color: const Color(0xFF181B21),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2C2422),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset('assets/images/$icon.svg'),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(title, style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,),
                  ),
                  const SizedBox(width: 4),
                  if (drawdots != null) drawdots!,
                ],
              ),
              Text(value, 
              style:Theme.of(context).textTheme.bodyMedium ),
            ],
          ),
        )
      ],
    ),
  );
  }
}

class DifficultyDots extends StatelessWidget {
  const DifficultyDots({
    super.key, 
    required this.difficulty
    });

  final RecipeDifficulty difficulty;


  @override
  Widget build(BuildContext context) {
      int activeDots;
  switch (difficulty) {
    case RecipeDifficulty.beginner:
      activeDots = 1;
      break;
    case RecipeDifficulty.amateur:
      activeDots = 2;
      break;
    case RecipeDifficulty.intermediate:
      activeDots = 3;
      break;
    case RecipeDifficulty.advanced:
      activeDots = 4;
      break;
    case RecipeDifficulty.seasoned:
      activeDots = 5;
      break;
  }
  const totalDots = 5;
  return Row(
    children: List.generate(totalDots, (index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        child: Dots(isActive: index < activeDots),
      );
    }),
  );
  }
}

class Dots extends StatelessWidget {
  const Dots({
    super.key, 
    required this.isActive
    });

  final bool isActive;


  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 1,
      backgroundColor: isActive? Color(0xFFD76261):Colors.grey, 
    );
  }
}

class NutritionFacts extends StatelessWidget {
  const NutritionFacts({
    super.key, 
    required this.recipe
    });

    final Recipe recipe;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16,8,16,8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.onSurface,
      ),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [

          Expanded(
            child: FractCol(
              nutrirtion: recipe.nutrition.calories, 
              title: 'Calories', 
              unit:'kcal'
              )),

          const StickSeparator(),

          Expanded(
            child: FractCol(
              nutrirtion: recipe.nutrition.protein, 
              title: 'Protein', 
              unit: 'g'
            )),
          const StickSeparator(),

          Expanded(
            child: FractCol(
            nutrirtion:  recipe.nutrition.carbs, 
            title:  'Carbohydrates', 
            unit: 'g'
            )),
        ],
      ),
    ) ;
  }
}

class FractCol extends StatelessWidget {

  const FractCol({
    super.key, 
    required this.nutrirtion, 
    required this.title, 
    required this.unit
    });

  final int nutrirtion;
  final String title;
  final String unit;


  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      Text(
        title, style: GoogleFonts.nunito(
          color: Color(0xFF888481), fontSize: 12, fontWeight: FontWeight.w400,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      const SizedBox(height: 4),
      Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            nutrirtion.toString()  , style: GoogleFonts.nunito(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(unit,style: GoogleFonts.hedvigLettersSerif(
          color: Color(0xFF888481), fontSize: 12, fontWeight: FontWeight.w400,
        ),
          overflow: TextOverflow.ellipsis,)
        ],
      )
    ],
  ) ;
  }
}

class StickSeparator extends StatelessWidget {
  const StickSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF2B2E33).withValues(alpha: 0),
            const Color(0xFF2B2E33).withValues(alpha:  0.93),
            const Color(0xFF2B2E33).withValues(alpha: 1),
            const Color(0xFF2B2E33).withValues(alpha: 0.93),
            const Color(0xFF2B2E33).withValues(alpha: 0),
          ],
          stops: const [0.0, 0.2, 0.5, 0.8, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}