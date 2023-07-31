// Importing packages and custom widgets
import 'package:flutter/material.dart';
import 'package:myapp/home/location_card.dart';
import 'package:myapp/home/nearby_places.dart';
import 'package:myapp/home/place_tags.dart';
import '../buttomNavi.dart';

// Defining the HomePage class as a StatefulWidget
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// State class for the HomePage
class _HomePageState extends State<HomePage> {
  // Variable to toggle the translation between languages
  int trans = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar widget for the top app bar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(116, 29, 74, 1.0),
        foregroundColor: Colors.white,
        actions: [
          // InkWell widget for a clickable area in the app bar
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 12.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  // Toggle the translation status when the icon is tapped
                  trans = trans * -1;
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
          // Custom widget LocationCard for user's location
          LocationCard(trans: trans),
          const SizedBox(height: 15),

          // Custom widget TouristPlaces for places tags
          PlacesTags(trans: trans),
          SizedBox(height: 10),

          Text(trans < 0 ? "Nearby From You" : "附近的地点", style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 10,),

          // Custom widget NearbyPlaces for near by places
          NearbyPlaces(trans: trans)
        ],
      ),

      // Bottom navigation bar
      bottomNavigationBar: BottomNavi.Bottom(),
    );
  }
}
