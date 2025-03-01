import 'package:flutter/material.dart';

double getResponsiveHorizontalPadding(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double percentage;
  
  if (screenWidth < 600) { // mobile
    percentage = 2;
  } else if (screenWidth < 1200) { // tablet
    percentage = 5;
  } else { // desktop
    percentage = 10;
  }
  
  return (percentage / 100) * screenWidth;
}

double getResponsiveVerticalPadding(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;

  double percentage;
  
  if (screenWidth < 600) { // mobile
    percentage = 20;
  } else if (screenWidth < 1200) { // tablet
    percentage = 14;
  } else { // desktop
    percentage = 12;
  }
  
  return (percentage / 100) * screenHeight;
}