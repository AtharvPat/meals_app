import 'package:flutter/material.dart';

// import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/tabs.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Color.fromARGB(255, 191, 110, 48),
  ),
  // textTheme: GoogleFonts.latoTextTheme(),
);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabsScreen(),
    );
  }
}
