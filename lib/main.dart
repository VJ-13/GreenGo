// Importing packages and custom widgets
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'welcomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      // The initial screen is set to the WelcomePage widget
      home: const WelcomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          // Primary Color
          primary: const Color.fromRGBO(116, 29, 74, 1.0),
        ),
        scaffoldBackgroundColor: const Color.fromRGBO(182, 184, 189, 1.0),
        textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme),
      ),
    );
  }
}
