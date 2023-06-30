import 'package:flutter/material.dart';
import 'package:myapp/userInput/theme.dart';
import 'package:page_transition/page_transition.dart';
import 'package:myapp/surpriseme/surpriseMain.dart';
import 'package:ionicons/ionicons.dart';
import 'package:myapp/welcomeRay.dart';
import 'package:myapp/homePage.dart';
import 'package:myapp/profile/userProfile.dart';

class ButtomNavi extends StatefulWidget {
  const ButtomNavi({super.key});

  @override
  State<ButtomNavi> createState() => _ButtomNaviState();
}

class _ButtomNaviState extends State<ButtomNavi> {
  int selectedIndex = 0;
  List<Widget> buttonWigt = [SurpriseMe(), HomePage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  duration: const Duration(milliseconds: 500),
                  child: buttonWigt[index])

          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
                Icons.celebration_outlined,
                color: selectedIndex == 0 ? Color.fromRGBO(116, 29, 74,1.0) : null),            label: "Surprise",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  Ionicons.home_outline,
                  color: selectedIndex == 1 ? Color.fromRGBO(116, 29, 74,1.0) : null),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Ionicons.person_outline,
                color: selectedIndex == 2 ? Color.fromRGBO(116, 29, 74,1.0) : null),
              label: "Profile"),
        ]);
  }
}
