import 'package:archlelabswebsite/responsive/layouts.dart';
import 'package:flutter/material.dart';

class Constant{
 static double bigFont94(BuildContext context) {
    return ResponsiveLayout.isSmallScreen(context) ? 56 : 94;
  }
 static double mainHeading(BuildContext context) {
    return ResponsiveLayout.isSmallScreen(context) ? 42 : 64;
  }
   static double headingText(BuildContext context) {
    return ResponsiveLayout.isSmallScreen(context) ? 32 : 56;
  }
    static double textFourtyEight(BuildContext context) {
    return ResponsiveLayout.isSmallScreen(context) ? 24 : 48;
  }
   static double textFourty(BuildContext context) {
    return ResponsiveLayout.isSmallScreen(context) ? 20 : 40;
  }
   static double subheadingText(BuildContext context) {
    return ResponsiveLayout.isSmallScreen(context) ? 22 : 32;
  }
  static double smallbheadingText(BuildContext context) {
    return ResponsiveLayout.isSmallScreen(context) ? 18 : 24;
  }
 static double TextSize20(BuildContext context) {
    return ResponsiveLayout.isSmallScreen(context) ? 16 : 20;
  }
  static double body(BuildContext context) {
    return ResponsiveLayout.isSmallScreen(context) ? 16 : 18;
  }
  static double mediumbody(BuildContext context) {
    return ResponsiveLayout.isSmallScreen(context) ? 14 : 16;
  }
  static double smallbody(BuildContext context) {
    return ResponsiveLayout.isSmallScreen(context) ? 12 : 14;
  }
}