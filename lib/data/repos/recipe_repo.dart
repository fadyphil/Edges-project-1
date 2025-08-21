import 'package:mini_project_1/data/models/models.dart';

// -------------------
// 1. The Interface (The Contract) - Now Synchronous
// -------------------
/// Defines the contract for fetching recipe data.
abstract class IRecipeRepository {
  /// Fetches the complete list of all available recipes synchronously.
  List<Recipe> fetchAllRecipes();
}

// -------------------
// 2. The Concrete Implementation (The Dummy Data Source) - Now Synchronous
// -------------------
/// This is a dummy implementation that returns a hardcoded list of recipes instantly.
class RecipeRepository implements IRecipeRepository {
  @override
  List<Recipe> fetchAllRecipes() {
    // No Future, no async, no delay. It returns the data immediately.
    return _dummyRecipes;
  }

  // A private list containing our sample recipe data.
  static final List<Recipe> _dummyRecipes = [
    // --- Recipe 1: Chicken Alfredo ---
    Recipe(
      id: 'chicken-alfredo',
      name: 'Chicken Alfredo',
      description: 'A creamy and classic pasta dish that is a favorite for all ages. Simple to make and endlessly satisfying.',
      imagePath: 'assets/images/chickenAlfredo.jpeg',
      tags: ['Chicken', 'Pasta', 'Creamy'],
      mealType: MealBase.meat,
      difficulty: RecipeDifficulty.intermediate,
      acceptanceMarginInSeconds: 300, // 5 minutes
      nutrition: const Nutrition(calories: 820, protein: 46, carbs: 54),
      ingredients: [
        const Ingredient(name: 'Fettuccine Pasta', quantity: 250, unit: MeasurementUnit.gram),
        const Ingredient(name: 'Chicken Breast', quantity: 500, unit: MeasurementUnit.gram),
        const Ingredient(name: 'Heavy Cream', quantity: 1, unit: MeasurementUnit.cup),
        const Ingredient(name: 'Parmesan Cheese', quantity: 0.5, unit: MeasurementUnit.cup),
        const Ingredient(name: 'Garlic', quantity: 2, unit: MeasurementUnit.clove),
      ],
      steps: [
        const Step(title: 'Boil Pasta', description: 'Cook fettuccine according to package directions.', baseTimeInSeconds: 600, type: StepType.cooking),
        const Step(title: 'Prep Chicken', description: 'Cut chicken breast into bite-sized pieces and season with salt and pepper.', baseTimeInSeconds: 300, type: StepType.prep),
        const Step(title: 'Cook Chicken', description: 'In a large skillet, cook chicken pieces until golden brown and cooked through.', baseTimeInSeconds: 480, type: StepType.cooking),
        const Step(title: 'Make Sauce', description: 'Sauté minced garlic, then add heavy cream and bring to a simmer. Stir in Parmesan cheese until melted.', baseTimeInSeconds: 420, type: StepType.cooking),
        const Step(title: 'Combine', description: 'Add the cooked pasta and chicken to the sauce. Toss to combine and serve immediately.', baseTimeInSeconds: 120, type: StepType.cooking),
      ],
    ),

    // --- Recipe 2: Veggie Fried Rice ---
    Recipe(
      id: 'veggie-fried-rice',
      name: 'Veggie Fried Rice',
      description: 'A quick and easy fried rice recipe packed with vegetables. Perfect for a weeknight meal using leftover rice.',
      imagePath: 'assets/images/veggiFriedRice.jpg',
      tags: ['Rice', 'Vegetable', 'Quick'],
      mealType: MealBase.veggi,
      difficulty: RecipeDifficulty.beginner,
      acceptanceMarginInSeconds: 180, // 3 minutes
      nutrition: const Nutrition(calories: 450, protein: 15, carbs: 75),
      ingredients: [
        const Ingredient(name: 'Cooked Rice', quantity: 3, unit: MeasurementUnit.cup),
        const Ingredient(name: 'Soy Sauce', quantity: 3, unit: MeasurementUnit.tablespoon),
        const Ingredient(name: 'Mixed Vegetables (frozen)', quantity: 1.5, unit: MeasurementUnit.cup),
        const Ingredient(name: 'Sesame Oil', quantity: 1, unit: MeasurementUnit.teaspoon),
        const Ingredient(name: 'Eggs', quantity: 2, unit: MeasurementUnit.piece),
      ],
      steps: [
        const Step(title: 'Scramble Eggs', description: 'In a large wok or skillet, scramble the eggs and set aside.', baseTimeInSeconds: 180, type: StepType.cooking , note: 'just a note for testing'),
        const Step(title: 'Sauté Vegetables', description: 'Add vegetables to the wok and stir-fry until tender-crisp.', baseTimeInSeconds: 300, type: StepType.cooking),
        const Step(title: 'Combine and Fry', description: 'Add the rice, soy sauce, and sesame oil. Stir-fry for 3-5 minutes until heated through.', baseTimeInSeconds: 300, type: StepType.cooking),
        const Step(title: 'Finish', description: 'Stir in the scrambled eggs and serve hot.', baseTimeInSeconds: 60, type: StepType.cooking),
      ],
    ),
  ];
}