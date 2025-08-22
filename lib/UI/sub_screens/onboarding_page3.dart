import 'package:flutter/material.dart';
import 'package:mini_project_1/data/models/enums.dart';
import 'package:mini_project_1/theme/app_theme.dart';

class OnboardingPage3 extends StatelessWidget {
  final TextEditingController nameController;
  final UserCookingLevel? selectedLevel;
  final Function(UserCookingLevel) onLevelSelected;

  const OnboardingPage3({
    required this.nameController,
    required this.selectedLevel,
    required this.onLevelSelected,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView(
        
        children: [
          const SizedBox(height: 40,),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: textTheme.displayLarge?.copyWith(fontSize: 40),
              children: [
                const TextSpan(text: "What's Your\n"),
                TextSpan(
                  text: 'Cooking Level?',
                  style: TextStyle(color: colorScheme.primary),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Help us customize your experience and set appropriate challenges',
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(color: kSubtleTextColor),
          ),
          const SizedBox(height: 32),
          _buildLevelOption(
            context,
            level: UserCookingLevel.beginner,
            title: 'Beginner',
            subtitle: 'Just starting',
            icon: Icon(Icons.ice_skating), 
          ),
          _buildLevelOption(
            context,
            level: UserCookingLevel.intermediate,
            title: 'Intermediate',
            subtitle: 'Cooks often, knows a few recipes',
            icon: Icon(Icons.account_balance_rounded),
          ),
          _buildLevelOption(
            context,
            level: UserCookingLevel.chef,
            title: 'Chef',
            subtitle: 'Let me cook!',
            icon: Icon(Icons.restaurant_menu_outlined
            ), 
          ),
          const SizedBox(height: 32),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'Enter your name',
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Widget _buildLevelOption(
    BuildContext context, {
    required UserCookingLevel level,
    required String title,
    required String subtitle,
    required Icon icon,
  }) {
    final bool isSelected = selectedLevel == level;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => onLevelSelected(level),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.primary.withOpacity(0.1) : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? colorScheme.primary : colorScheme.secondary.withOpacity(0.5),
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        child: Row(
          children: [
            icon, // Your custom icon image
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
            AnimatedOpacity(
              opacity: isSelected ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Icon(Icons.check_circle, color: colorScheme.primary),
            )
          ],
        ),
      ),
    );
  }
}