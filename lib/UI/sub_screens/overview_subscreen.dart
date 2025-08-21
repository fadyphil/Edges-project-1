import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/data/models/enums.dart';
import 'package:mini_project_1/data/models/recipe_model.dart';


List<Widget> buildOverviewSlivers(Recipe recipe, num userfactor) {
  return [
    SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: _buildOverviewContent(recipe, userfactor),
      ),
    ),
    _buildIngredientsList(recipe),
    SliverToBoxAdapter(child: const SizedBox(height: 16)),
    SliverToBoxAdapter(child: SvgPicture.asset('assets/images/separator.svg')),
    SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Text(
          'Nutrition',
          style: GoogleFonts.hedvigLettersSerif(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ),
    SliverToBoxAdapter(
      child: _buildNutritionFacts(recipe),
    ),
  ];
}

// All helper functions below remain the same, but they are now
// private helper functions for the public `buildOverviewSlivers` function above.

SliverList _buildIngredientsList(Recipe recipe) {
  // ... (no changes needed here)
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
                  style: GoogleFonts.nunito(
                    color: Color(0xFF888481),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  recipe.ingredients[index].unit.name[0].toUpperCase() + recipe.ingredients[index].unit.name.substring(1),
                  style: GoogleFonts.nunito(
                    color: Color(0xFF888481),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            Text(recipe.ingredients[index].name,
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ))
          ],
        ),
      );
    },
    separatorBuilder: (context, index) => const SizedBox(height: 8),
  );
}

Widget _buildOverviewContent(Recipe recipe, num userfactor) {
  // ... (no changes needed here, just ensure Row's `children` don't have spacing issues)
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(height: 16),
      Row(
        children: [
          Expanded(child: _buildInfoCard('timer', "Total time", '${(recipe.totalBaseTimeInSeconds / 60 * userfactor).ceil()} Minutes')),
          const SizedBox(width: 8),
          Expanded(child: _buildInfoCard('steps', "Steps", '${recipe.stepCount} Steps')),
        ],
      ),
      const SizedBox(height: 8),
      Row(
        children: [
          Expanded(
              child: _buildInfoCard('difficulty', "Difficulty", recipe.difficulty.name,
                  painter: _buildDifficultyDots(recipe.difficulty))),
          const SizedBox(width: 8),
          Expanded(child: _buildInfoCard('acceptance_margin', "Acceptance Margin", '${recipe.acceptanceMarginInSeconds ~/ 60} Minutes')),
        ],
      ),
      const SizedBox(height: 16),
      SvgPicture.asset('assets/images/separator.svg'),
      const SizedBox(height: 16),
      Text(
        "\" ${recipe.description}",
        style: GoogleFonts.nunito(
          color: Colors.grey.shade400,
          fontSize: 14,
          fontStyle: FontStyle.italic,
          height: 1.5,
        ),
      ),
      const SizedBox(height: 16),
      SvgPicture.asset('assets/images/separator.svg'),
      const SizedBox(height: 16),
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Ingredients',
          style: GoogleFonts.hedvigLettersSerif(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      const SizedBox(height: 16),
    ],
  );
}

Widget _buildInfoCard(String icon, String title, String value, {Widget? painter}) {
  // Fix for Row issue
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
                // Removed spacing, use SizedBox instead
                children: [
                  Text(title, style: TextStyle(color: Color(0xFF888481), fontSize: 12)),
                  const SizedBox(width: 4),
                  if (painter != null) painter,
                ],
              ),
              Text(value, style: GoogleFonts.nunito(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14)),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _buildDifficultyDots(RecipeDifficulty difficulty) {
  // ... (No changes here, but fixed the spacing issue in _buildInfoCard)
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
        child: _buildDots(index < activeDots),
      );
    }),
  );
}


// ... (The rest of your helper functions _buildDots, _buildNutritionFacts, etc. can stay here without changes)
// ... I've included them above for completeness


 
  Widget  _buildDots(bool isActive){
    return CircleAvatar(
      
      radius: 1,
    backgroundColor: isActive? Color(0xFFD76261):Colors.grey,
    
    ) ;
  }


Widget _buildNutritionFacts(Recipe recipe) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16,8,16,8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF181B21)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      
        children: [
          _buildFactCol(recipe.nutrition.calories, 'Calories', 'kcal'),
          _buildStickSeparator(),
          _buildFactCol(recipe.nutrition.protein, 'Protein', 'g'),
          _buildStickSeparator(),
          _buildFactCol(recipe.nutrition.carbs, 'Carbohydrates', 'g'),
        ],
      ),
    ) ;
    }



Widget  _buildFactCol (int nutrition, String title  , String unit){
  return Column(
    children: [
      Text(
        title, style: GoogleFonts.nunito(
          color: Color(0xFF888481), fontSize: 12, fontWeight: FontWeight.w400,
        ),
      ),
      const SizedBox(height: 4),
      Row(
        children: [
          Text(
            nutrition.toString()  , style: GoogleFonts.nunito(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400,
            ),
          ),
          Text(unit,style: GoogleFonts.hedvigLettersSerif(
          color: Color(0xFF888481), fontSize: 12, fontWeight: FontWeight.w400,
        ),)
        ],
      )
    ],
  );
}    



Widget _buildStickSeparator() {
    return Container(
      width: 1,
      height: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF2B2E33).withOpacity(0),
            const Color(0xFF2B2E33).withOpacity(0.93),
            const Color(0xFF2B2E33).withOpacity(1),
            const Color(0xFF2B2E33).withOpacity(0.93),
            const Color(0xFF2B2E33).withOpacity(0),
          ],
          stops: const [0.0, 0.2, 0.5, 0.8, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }