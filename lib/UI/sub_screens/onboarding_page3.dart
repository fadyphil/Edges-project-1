import 'package:flutter/material.dart';
import 'package:mini_project_1/data/models/enums.dart';
import 'package:mini_project_1/theme/app_theme.dart';

class OnboardingPage3 extends StatefulWidget {
  final TextEditingController nameController;
  final UserCookingLevel? selectedLevel;
  final Function(UserCookingLevel) onLevelSelected;

  const OnboardingPage3({
    super.key,
    required this.nameController,
    required this.selectedLevel,
    required this.onLevelSelected,
  });

  @override
  State<OnboardingPage3> createState() => _OnboardingPage3State();
}

class _OnboardingPage3State extends State<OnboardingPage3> {

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
            controller: widget.nameController,
            decoration: const InputDecoration(
              hintText: 'Enter your name',
            ),
          ),
          
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
    final bool isSelected = widget.selectedLevel == level;
    final colorScheme = Theme.of(context).colorScheme;
    final targetbordercolor = isSelected? colorScheme.primary.withValues(alpha:  0.3) : colorScheme.secondary.withValues(alpha:  0.5);

    return GestureDetector(
      onTap: () => widget.onLevelSelected(level),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.primary.withValues(alpha:  0.1) : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: targetbordercolor,
            width: 1
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