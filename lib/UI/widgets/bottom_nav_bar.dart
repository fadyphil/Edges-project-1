import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// It's now a StatelessWidget!
class CustomBottomNavBar extends StatelessWidget {
  // It needs to know the current index from its parent.
  final int currentIndex;
  // It needs a way to tell its parent when a tab is tapped.
  final Function(int) onTap;
  
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  // Define colors for easy access and modification
  static const Color _selectedColorIcon = Color(0xFFDB7A2B);
  static const Color _selectedLabel = Colors.white;
  static const Color _unselectedColor = Color(0xFF888481);
  static const Color _backgroundColor = Color(0xFF181B21);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
      decoration: BoxDecoration(
        color: _backgroundColor,
       
        border: Border(
          top: BorderSide(
            color: const Color(0xFF2B2E33),
            width: 1.0,
          ),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildNavItem(icon: Icons.restaurant_menu_outlined, label: 'Explore', index: 0, context: context),
          _buildNavItem(icon: Icons.favorite_border, label: 'Favorites', index: 1, context: context),
          _buildNavItem(icon: Icons.bar_chart_outlined, label: 'History', index: 2, context: context),
        ],
      ),
    );
  }

  // This helper is now also part of the stateless widget.
  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required BuildContext context,
  }) {
    // It now uses the `currentIndex` passed from the parent.
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      // The onTap now calls the callback function passed from the parent.
      onTap: () {
        onTap(index);
        
      
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: isSelected ? _selectedColorIcon : Colors.transparent,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Icon(
              icon,
              size: 24,
              color: isSelected ? Colors.white : _unselectedColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.nunito(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isSelected ? _selectedLabel
               : _unselectedColor,
            ),
          ),
        ],
      ),
    );
  }
}