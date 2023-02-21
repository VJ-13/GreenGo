// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:myapp/widgets/custom_icon_button.dart';
import 'package:myapp/widgets/location_card.dart';
import 'package:myapp/widgets/nearby_places.dart';
import 'package:myapp/widgets/recommended_places.dart';
import 'package:myapp/widgets/tourist_places.dart';
import 'userInput/theme.dart';
import 'package:page_transition/page_transition.dart';
import 'surpriseme/surpriseMain.dart';
import 'layout/buttomNavi.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> buttonWigt = [ThemeP(), SurpriseMe()];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good Morning"),
            Text(
              "Tom",
              style: Theme.of(context).textTheme.labelMedium,
            )
          ],
        ),
        actions: [
          CustomIconButton(icon: Icon(Ionicons.search_outline)),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 12.0),
            child: CustomIconButton(icon: Icon(Ionicons.notifications_outline)),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(14.0),
        children: [
          LocationCard(),
          SizedBox(
            height: 15,
          ),
          TouristPlaces(),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommendation",
                style: Theme.of(context).textTheme.headline6,
              ),
              TextButton(onPressed: () {}, child: Text("View All"))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          RecommendedPlaces(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Nearby From You",
                style: Theme.of(context).textTheme.headline6,
              ),
              TextButton(onPressed: () {}, child: Text("View All"))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          NearbyPlaces()
        ],
      ),
      bottomNavigationBar: ButtomNavi(),
    );
  }
}
