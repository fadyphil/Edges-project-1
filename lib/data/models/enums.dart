// lib/data/models/enums.dart

/// Defines if a recipe is primarily meat-based or plant-based.
enum MealBase {
  meat,
  veggi,
}

/// Represents the cooking difficulty of a recipe.
enum RecipeDifficulty {
  beginner,
  amateur,
  intermediate,
  advanced,
  seasoned,
}

/// Differentiates between preparation steps and active cooking steps.
enum StepType {
  prep,
  cooking,
}

/// Defines the units for ingredients.
enum MeasurementUnit {
  gram,
  kilogram,
  pound,
  ounce,
  milliliter,
  liter,
  teaspoon,
  tablespoon,
  cup,
  pinch,
  clove,
  piece,
}

/// Represents the user's self-assessed cooking skill level.
enum UserCookingLevel {
  beginner,
  intermediate,
  chef,
}

final  Map<UserCookingLevel,double> timeFactor={
  UserCookingLevel.beginner:1.0,
  UserCookingLevel.intermediate:0.7,
  UserCookingLevel.chef:0.5,
};


enum RecipeTab {
  overview,
  steps,
}


// An enum to simplify the UI's job of picking a color
enum TimerColorStatus { normal, acceptanceMargin, overtime }

// An enum to represent the timer's overall status
enum TimerStatus { initial, running, paused, finished }