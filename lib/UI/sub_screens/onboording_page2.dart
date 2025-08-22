import 'package:flutter/material.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 50,),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: textTheme.displayLarge?.copyWith(fontSize: 40),
              children: [
                const TextSpan(text: 'Cook, Compete, '),
                TextSpan(
                  text: 'Conquer',
                  style: TextStyle(color: colorScheme.primary),
                ),
              ],
            ),
          ),
          const SizedBox(height: 100),
          _buildFeatureListItem(
            context,
            icon: Icons.timer_outlined,
            title: 'Time Each Step',
            subtitle: 'Follow recipe steps with built-in timers',
          ),
          _buildFeatureListItem(
            context,
            icon: Icons.emoji_events_outlined,
            title: 'Beat The Clock',
            subtitle: 'Match or beat expected cooking times',
          ),
          _buildFeatureListItem(
            context,
            icon: Icons.bar_chart_outlined,
            title: 'Track Progress',
            subtitle: 'See your improvement over time',
          ),
        
        ],
      ),
    );
  }

  Widget _buildFeatureListItem(BuildContext context, {required IconData icon, required String title, required String subtitle}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.secondary.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Theme.of(context).colorScheme.primary, size: 28)),
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
        ],
      ),
    );
  }
}