import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_project_1/theme/app_theme.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          SvgPicture.asset('assets/images/onboarding_chef.svg', height: 250),
          const Spacer(flex: 1),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: textTheme.displayLarge?.copyWith(fontSize: 40),
              children: [
                const TextSpan(text: 'Master Your '),
                TextSpan(
                  text: 'Cooking Time',
                  style: TextStyle(color: colorScheme.primary),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Turn cooking into an exciting challenge. Race against time, improve your skills, and become a kitchen champion!',
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(color: kSubtleTextColor, height: 1.5),
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}