import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/UI/sub_screens/overview_subscreen.dart';
import 'package:mini_project_1/UI/sub_screens/steps_subscreen.dart';
import 'package:mini_project_1/UI/widgets/tag_row_builder.dart';
import 'package:mini_project_1/blocs/favourited/favourited_cubit.dart';
import 'package:mini_project_1/blocs/favourited/favourited_state.dart';
import 'package:mini_project_1/blocs/recipe_details/recipe_details_cubit.dart';
import 'package:mini_project_1/blocs/recipe_details/recipe_details_state.dart';
import 'package:mini_project_1/blocs/user/user_cubit.dart';
import 'package:mini_project_1/data/models/enums.dart';
import 'package:mini_project_1/data/models/recipe_model.dart';
import 'package:mini_project_1/routes/app_router.dart';

@RoutePage()
class RecipeDetailsScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailsScreen({super.key, required this.recipe});
  @override
  Widget build(BuildContext context) {
    final userfactor = context.watch<UserCubit>().getUsersFactor();

    return BlocProvider(
      create: (context) => RecipeDetailsCubit(recipe: recipe),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF0E1118),
          body: BlocBuilder<RecipeDetailsCubit, RecipeDetailsState>(
            builder: (context, state) {
              return state.when(
                (currentRecipe, currentTab) => CustomScrollView(
                  slivers: [
                    _buildSliverAppBar(context, currentRecipe),
                    _buildStaticContent(context, currentRecipe, currentTab),
                    
                    // --- THE FIX IS HERE ---
                    
                   _buildTabContent(currentTab, currentRecipe, userfactor),
                    
                    SliverToBoxAdapter(child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: _buildStartButton(context, recipe),
                    ))
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }



Widget _buildTabContent(RecipeTab currentTab, Recipe currentRecipe, num userfactor) {
  if (currentTab == RecipeTab.overview) {
    // Since buildOverviewSlivers returns a list, we need a parent sliver.
    return SliverMainAxisGroup(
      slivers: buildOverviewSlivers(currentRecipe, userfactor),
    );
  } else {
    // The Steps tab already has a single parent sliver (SliverPadding).
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      sliver: SliverMainAxisGroup(
        slivers: buildTimelineAndStepsSlivers(currentRecipe, userfactor),
      ),
    );
  }
}




  SliverAppBar _buildSliverAppBar(BuildContext context, Recipe recipe) {
    final Color tintColor ;
    if(recipe.mealType.name=='meat'){
      tintColor=const Color(0xFFD76261).withOpacity(0.1);
    }else{
      tintColor  = const Color(0xFF4ABC96).withOpacity(0.1);
    }
    return SliverAppBar(
    
      expandedHeight: MediaQuery.of(context).size.height * 0.4,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.4), 
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(recipe.name, style: GoogleFonts.hedvigLettersSerif(
                  color: Colors.white, fontSize: 36, fontWeight: FontWeight.w400,
                      )),
              TagRowBuilder(recipe: recipe)
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: tintColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SvgPicture.asset('assets/images/${recipe.mealType.name.toLowerCase()}_base.svg',
              width: 24,
              height: 24
              ))
          ],
        )
      ),
      stretch: true,
      backgroundColor: const Color(0xFF0E1118),
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(

        stretchModes: const [StretchMode.zoomBackground],
        background:  DecoratedBox(
          
            position: DecorationPosition.foreground,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                    const Color(0xFF0E1118),
                    const Color(0xFF0E1118).withOpacity(0.6),
                    Colors.transparent,
                  ],
                  stops: const [0, 0.7, 1],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                )
            ),
            child: Image.asset(recipe.imagePath, fit: BoxFit.cover),
             
            ),
      ),
      title: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildCircleIcon(context, Icons.arrow_back, Icons.arrow_back),
            BlocSelector<FavouritedCubit, FavouritedState, bool>(
              selector: (state) => state.favouritedRecipes.contains(recipe),
             builder: (context, isFavourited) {
              return _buildCircleIcon(context, Icons.favorite, isFavourited?Icons.favorite:Icons.favorite_border_outlined);
            }),
          ],
        ),
      ),
      titleSpacing: 16.0,
    );
  }

  Widget _buildCircleIcon(BuildContext context, IconData icon, IconData altIcon) {
    final isfaved = context.watch<FavouritedCubit>().state.favouritedRecipes.contains(recipe);
    return GestureDetector(
      onTap: () {
        if (icon == Icons.arrow_back) context.router.pop();
        if(altIcon==Icons.favorite||altIcon==Icons.favorite_border_outlined) context.read<FavouritedCubit>().toggleFavourite(recipe);
      },
      
      child: Container(
      padding: const EdgeInsets.all(8),
      // backgroundColor: const Color(0xFF2B2E33).withOpacity(0.1),
      decoration: BoxDecoration(
        color: const Color(0xFF2B2E33).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12)
      ),
      child:
          Icon(isfaved?altIcon:icon, 
        color:icon==Icons.arrow_back?Colors.white:
        (isfaved? Colors.redAccent:Colors.white) )

      ));
  }

  SliverToBoxAdapter _buildStaticContent(
      BuildContext context, Recipe recipe, RecipeTab selectedTab) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        
            SvgPicture.asset('assets/images/separator.svg'),
            const SizedBox(height: 16),
            _buildTabSelector(context, selectedTab),
          ],
        ),
      ),
    );
  }
  
  // These helper methods return lists of Slivers to be added conditionally
  

  
  
  

  Widget _buildTabSelector(BuildContext context, RecipeTab selectedTab) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF181B21),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2B2E33)),
      ),
      child: Row(
        children: [
          _buildTabButton(context, "Overview", RecipeTab.overview, selectedTab),
          _buildTabButton(context, "Steps", RecipeTab.steps, selectedTab),
        ],
      ),
    );
  }

  Widget _buildTabButton(BuildContext context, String title, RecipeTab tab, RecipeTab selectedTab) {
    bool isSelected = selectedTab == tab;
    return Expanded(
      child: GestureDetector(
        onTap: () => context.read<RecipeDetailsCubit>().toggleTab(tab),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF2B2E33) : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),
      ),
    );
  }



  // ... (Keep _buildTags and _buildInfoCard methods as they are) ...
}


Widget _buildStartButton (BuildContext context, Recipe recipe){
  return GestureDetector(
    onTap: () {
      context.router.push(
        StepTimerRoute(recipe: recipe)
      );
    },
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFDB7A2B),
        borderRadius: BorderRadius.circular(14)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Start ', style: GoogleFonts.nunito(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600,),),
          Icon(Icons.play_arrow_rounded , color: Colors.white,size: 24,)
        ],
      ),
    ));
}





