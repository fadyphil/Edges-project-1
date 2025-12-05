# Culinary Companion (Edges-project-1)

> **A robust Flutter application designed to master the BLoC pattern and Clean Architecture principles.**

---

## 💡 About The Project

**Culinary Companion** is a recipe discovery and cooking challenge application built with a laser focus on scalable app architecture.

As my inaugural Flutter project ("Edges-project-1"), the primary objective was not just to build a functional UI, but to strictly separate business logic from the presentation layer. By strictly adhering to the **BLoC (Business Logic Component)** pattern, this project demonstrates how to handle complex state flows—including asynchronous data fetching, local caching, and reactive UI updates—in a clean, testable manner.

This repository serves as a proof-of-concept for my ability to implement production-grade state management and routing in Flutter.

---

## 📸 Screenshots

| Explore Screen | Recipe Details |
|:---:|:---:|
|<img src="assets/images/explore-screen-NEW.gif" width="220" /> |<img src="assets/images/recipe-screen.gif" width="220" /> |


---

## 🛠 Tech Stack

I carefully selected a modern tech stack to ensure type safety, immutability, and performance.

* **Framework**: [Flutter](https://flutter.dev/) (Dart 3)
* **State Management**: [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) (Cubit flavor) for predictable state changes.
* **Immutability**: [`freezed`](https://pub.dev/packages/freezed) for generating immutable state unions and data classes.
* **Navigation**: [`auto_route`](https://pub.dev/packages/auto_route) for strictly typed, declarative routing.
* **Networking**: [`dio`](https://pub.dev/packages/dio) for robust HTTP requests and interceptors.
* **Data Parsing**: [`json_serializable`](https://pub.dev/packages/json_serializable) for efficient JSON serialization.
* **Local Storage**: [`shared_preferences`](https://pub.dev/packages/shared_preferences) & Custom Caching logic.
* **Assets**: `flutter_svg` & `google_fonts` for a polished UI.

---

## 🚀 Key Features

* **Explore & Discover**: Browse a curated list of recipes with the ability to toggle between **Grid** and **List** layouts.
* **Smart Filtering**: Client-side filtering of recipes based on search queries and dynamic tags (e.g., "Breakfast", "Easy").
* **Daily Challenge**: A logic-driven "Recipe of the Day" computed deterministically based on the date.
* **Favorites System**: Persist beloved recipes locally for quick access.
* **Cooking History**: Track recently viewed or cooked recipes.
* **Robust Error Handling**: Graceful UI states for loading, errors, and empty datasets.

---

## 💻 Code Highlight: Logic-Driven State

One of the cleanest patterns in this project is the use of **computed properties on Freezed states**. Instead of cluttering the UI with logic, the State itself exposes getters that derive data.

Below is a snippet from `ExploreState`. Notice how `todaysChallenge` and `filteredRecipes` are calculated dynamically based on the current state union, keeping the UI code purely declarative.

```dart
// lib/blocs/explore/explore_state.dart

@freezed
abstract class ExploreState with _$ExploreState {
  const ExploreState._();

  const factory ExploreState.initial() = _Initial;
  const factory ExploreState.loading() = _Loading;
  const factory ExploreState.loaded({
    required List<Recipe> allRecipes,
    @Default('') String searchQuery,
    @Default({}) final Set<String> selectedTags,
    // ... other fields
  }) = _Loaded;

  /// Calculates the "Today's Challenge" recipe on the fly.
  /// Returns null if data isn't loaded, preventing UI crashes.
  Recipe? get todaysChallenge {
    return when(
      initial: () => null,
      loading: () => null,
      loaded: (allRecipes, _, __, ___, ____) {
        if (allRecipes.isEmpty) return null;
        
        // Deterministic daily rotation logic
        final dayOfYear = DateTime.now().day;
        final challengeIndex = dayOfYear % allRecipes.length;
        return allRecipes[challengeIndex];
      },
      error: (message) => null,
    );
  }
}
````

-----

## 📂 Project Structure

The project follows a **Layered Architecture**, separating concerns into Data, Business Logic, and UI.

```text
lib/
├── blocs/           # State Management (Cubits & Freezed States)
│   ├── explore/     # Logic for the Explore screen
│   ├── favourited/  # Logic for user favorites
│   └── historyy/    # Logic for tracking user history
├── data/            # Data Layer
│   ├── api/         # API Services & Interceptors
│   ├── models/      # Data Transfer Objects (DTOs) & Entities
│   └── repos/       # Repositories (Abstraction over data sources)
├── ui/              # Presentation Layer
│   ├── screens/     # Full-page screens
│   └── widgets/     # Reusable UI components
├── routes/          # AutoRoute configuration
├── theme/           # App-wide styling and themes
└── main.dart        # Entry point
```

-----

## 🔌 Installation

1.  **Clone the repository:**

    ```bash
    git clone [https://github.com/fadyphil/Edges-project-1.git](https://github.com/fadyphil/Edges-project-1.git)
    cd Edges-project-1
    ```

2.  **Install Dependencies:**

    ```bash
    flutter pub get
    ```

3.  **Run Code Generation:**
    This project uses `build_runner` for Freezed and AutoRoute.

    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4.  **Run the App:**

    ```bash
    flutter run
    ```

-----

*Crafted with ❤️ and Flutter.*

```
