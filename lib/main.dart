import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/welcomePage.dart';
import 'welcomeRay.dart';

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
      home: WelcomeR(),
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFCCE8FF),
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)),
    );
  }
}
