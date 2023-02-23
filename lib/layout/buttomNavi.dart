import 'package:flutter/material.dart';
import 'package:myapp/userInput/theme.dart';
import 'package:page_transition/page_transition.dart';
import 'package:myapp/surpriseme/surpriseMain.dart';
import 'package:ionicons/ionicons.dart';
import 'package:myapp/welcomeRay.dart';
import 'package:myapp/homePage.dart';

class ButtomNavi extends StatefulWidget {
  const ButtomNavi({super.key});

  @override
  State<ButtomNavi> createState() => _ButtomNaviState();
}

class _ButtomNaviState extends State<ButtomNavi> {
  List<Widget> buttonWigt = [SurpriseMe(), HomePage(), ThemeP()];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  duration: const Duration(milliseconds: 500),
                  child: buttonWigt[value]));
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.celebration),
            label: "Surprise",
          ),
          BottomNavigationBarItem(
              icon: Icon(Ionicons.home_outline), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Ionicons.search), label: "Find"),
        ]);
  }
}
