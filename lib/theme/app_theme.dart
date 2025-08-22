// lib/theme/app_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// 1. DEFINE YOUR COLORS
const Color kMainBackgroundColor = Color(0xff0e1118);
const Color kPrimarySurfaceColor = Color(0xff181b21);
const Color kPrimaryAccentColor = Color(0xffdb7a2b);
const Color kSecondarySurfaceColor = Color(0xff2b2e33);
const Color kSubtleTextColor = Color(0xFF888481);

// 2. CREATE THE ThemeData OBJECT
final ThemeData appTheme = ThemeData.dark().copyWith(
  //============================================================================
  // CORE COLORS
  //============================================================================
  scaffoldBackgroundColor: kMainBackgroundColor,
  primaryColor: kPrimaryAccentColor,
  cardColor: kPrimarySurfaceColor,
  colorScheme: const ColorScheme.dark(
    primary: kPrimaryAccentColor,       // Big buttons, selected items
    background: kMainBackgroundColor,   // Main screen background
    surface: kPrimarySurfaceColor,      // Cards, AppBars, TextFields
    secondary: kSecondarySurfaceColor,    // Tags, borders, selected tabs
    onPrimary: Colors.white,            // Text on big buttons
    onBackground: Colors.white,
    onSurface: Colors.white,
    onSecondary: Colors.white,
  ),

  //============================================================================
  // TEXT THEME
  //============================================================================
  textTheme: TextTheme(
    // Sliver Title: 36, Big Font Family
    displayLarge: GoogleFonts.hedvigLettersSerif(fontSize: 36, fontWeight: FontWeight.w400),
    
    // Title/Separators: 24, Big Font Family
    headlineMedium: GoogleFonts.hedvigLettersSerif(fontSize: 24, fontWeight: FontWeight.w400),
    
    // Greeting Title: 22, Big Font Family
    headlineSmall: GoogleFonts.hedvigLettersSerif(fontSize: 22, fontWeight: FontWeight.w400),

    // Card Title: 16, Normal Font Family
    titleMedium: GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.w600),

    // Normal Text: 14, Normal Font Family
    bodyMedium: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w400),
    
    // Secondary Text: 12, Normal Font Family
    bodySmall: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w400, color: kSubtleTextColor),
    
    // Tags Text: 9, Normal Font Family
    labelSmall: GoogleFonts.nunito(fontSize: 9, color: Colors.white),
  ),

  //============================================================================
  // COMPONENT THEMES
  //============================================================================
  appBarTheme: const AppBarTheme(
    backgroundColor: kPrimarySurfaceColor,
    elevation: 5,
    centerTitle: true,
  ),

  cardTheme: CardThemeData(
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    color: kPrimarySurfaceColor,
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
  ),
  
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kPrimaryAccentColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w600),
    ),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kPrimaryAccentColor,
    foregroundColor: Colors.white,
  ),

  iconTheme: const IconThemeData(
    size: 24, // Normal icon size
    color: Colors.white70,
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: kPrimarySurfaceColor,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    hintStyle: GoogleFonts.nunito(color: kSubtleTextColor, fontSize: 14, fontWeight: FontWeight.w600),
    prefixIconColor: kSubtleTextColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
  ),
);