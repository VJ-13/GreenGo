// Importing packages and custom widgets
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:myapp/surprise/surpriseMain.dart';
import 'package:ionicons/ionicons.dart';
import 'package:myapp/home/homePage.dart';
import 'package:myapp/settings/userProfile.dart';

// Defining the BottomNavi class as a StatefulWidget
class BottomNavi extends StatefulWidget {
  const BottomNavi.Bottom({super.key});
  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

// State class for the BottomNavi StatefulWidget
class _BottomNaviState extends State<BottomNavi> {
  // Variable to keep track of the currently selected index
  int selectedIndex = 0;
  List<Widget> buttonWigt = [const SurpriseMe(), const HomePage(), const SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      // Setting the type of BottomNavigationBar to fixed, so the items remain visible even if there are fewer than three.
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
            child: buttonWigt[index],
          ),
        );
      },

      items: [
        // Surprise page
        BottomNavigationBarItem(
          icon: Icon(
            Icons.celebration_outlined,
            color: selectedIndex == 0 ? Color.fromRGBO(116, 29, 74, 1.0) : null,
          ),
          label: "Surprise",
        ),

        // Home page
        BottomNavigationBarItem(
          icon: Icon(
            Ionicons.home_outline,
            color: selectedIndex == 1 ? Color.fromRGBO(116, 29, 74, 1.0) : null,
          ),
          label: "Home",
        ),

        // TSettings page.
        BottomNavigationBarItem(
          icon: Icon(
            Ionicons.settings_outline,
            color: selectedIndex == 2 ? Color.fromRGBO(116, 29, 74, 1.0) : null,
          ),
          label: "Settings",
        ),
      ],
    );
  }
}

