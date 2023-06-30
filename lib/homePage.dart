// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:location/location.dart';
import 'package:myapp/widgets/custom_icon_button.dart';
import 'package:myapp/widgets/location_card.dart';
import 'package:myapp/widgets/nearby_places.dart';
import 'package:myapp/widgets/recommended_places.dart';
import 'package:myapp/widgets/tourist_places.dart';
import 'userInput/theme.dart';
import 'package:page_transition/page_transition.dart';
import 'surpriseme/surpriseMain.dart';
import 'layout/buttomNavi.dart';
import 'package:flutter_translate/flutter_translate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int trans = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(116, 29, 74,1.0),
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 12.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  trans = trans * -1;
                  print(trans);
                });
              },
              child: Icon(Icons.translate),
            ),
          ),
        ],
        title: trans > 0 ? Text("早上好！") : Text("Good Morning"),
      ),
      body: ListView(
        padding: EdgeInsets.all(14.0),
        children: [
          LocationCard(
            trans: trans,
          ),
          SizedBox(
            height: 15,
          ),
          TouristPlaces(
            trans: trans,
          ),
          SizedBox(
            height: 10,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       "Recommendation",
          //       style: Theme.of(context).textTheme.headline6,
          //     ),
          //     TextButton(onPressed: () {}, child: Text("View All"))
          //   ],
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // RecommendedPlaces(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                trans < 0 ? "Nearby From You" : "附近的地点",
                style: Theme.of(context).textTheme.headline6,
              ),
              TextButton(onPressed: () {}, child: Text("View All"))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          NearbyPlaces(
            trans: trans,
          )
        ],
      ),
      bottomNavigationBar: ButtomNavi(),
    );
  }
}
