// Importing packages and custom widgets
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/models/nearby_places_model.dart' as np;
import 'dart:math';
import 'package:myapp/buttomNavi.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../home/nearby_places.dart';
import '../home/place_tags.dart';

// Defining the SurpriseMe class as a StatefulWidget
class SurpriseMe extends StatefulWidget {
  const SurpriseMe({super.key});
  @override
  State<SurpriseMe> createState() => _SurpriseMeState();
}

// State class for the SurpriseMe
class _SurpriseMeState extends State<SurpriseMe> {
  // Variables to hold the selected transportation option
  TransportationOption? selectedOption;
  int trans = -1;
  @override
  Widget build(BuildContext context) {
    // Get the device's width and height to adjust widget sizes accordingly.
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Scaffold is the main UI component that provides a framework for the widget.
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              "Surprise Me With...   ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: height * 0.2,
              width: width * 0.8,
              child: PlacesTags(trans: trans),
            ),

            // Animation of a person walking.
            Container(
              child: Lottie.asset(
                'assets/lot/walk.json',
                height: height * 0.23,
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(height: 20),

            // Surprise Me Button
            TextButton.icon(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.black, width: 3),
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.all(20),
                ),
              ),
              icon: Lottie.asset('assets/lot/surp.json', height: 35),
              label: const Text("Surprise Me", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
              onPressed: () {
                // Generate a random number to select a nearby place.
                int randomNumber = Random().nextInt(np.nearbyPlaces.length);
                // Show a dialog box with details about the randomly selected place.
                _showDialog(context, np.nearbyPlaces[randomNumber], randomNumber);
              },
            ),
            const Spacer(),
          ],
        ),
      ),

      // BottomNavigationBar
      bottomNavigationBar: BottomNavi.Bottom(),
    );
  }

  // Dialog box with information about a selected place.
  void _showDialog(BuildContext context, place, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Place details
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                // Image of the place
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    place.image,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),

                // Name and Description of the place.
                Text(
                  place.name,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  place.description,
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(height: 10),

                // Transportation Options for the place
                Row(
                  children: [
                    Icon(Ionicons.car_outline),
                    SizedBox(width: 10),
                    Text(
                      'Car: ${place.car}',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Ionicons.walk_outline),
                    SizedBox(width: 10),
                    Text(
                      'Walk: ${place.walk}',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Ionicons.bus_outline),
                    SizedBox(width: 10),
                    Text(
                      'Bus: ${place.bus}',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Ionicons.bicycle_outline),
                    SizedBox(width: 10),
                    Text(
                      'Bike: ${place.bike}',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),

                // DropdownButton to select a transportation option
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child:
                  DropdownButton<TransportationOption>(
                    value: selectedOption,
                    onChanged: (TransportationOption? option) {
                      if (option != null) {
                        setState(() {
                          selectedOption = option;
                        });
                        // Close the current dialog and show it again with the updated option.
                        Navigator.of(context).pop();
                        _showDialog(context, place, index);
                      }
                    },
                    items: TransportationOption.values.map((option) {
                      // Generate a DropdownMenuItem for each transportation option.
                      IconData icon;
                      String label;

                      switch (option) {
                        case TransportationOption.bus:
                          icon = Ionicons.bus_outline;
                          label = 'Bus';
                          break;
                        case TransportationOption.bike:
                          icon = Ionicons.bicycle_outline;
                          label = 'Bike';
                          break;
                        case TransportationOption.walk:
                          icon = Ionicons.walk_outline;
                          label = 'Walk';
                          break;
                        case TransportationOption.car:
                          icon = Ionicons.car_outline;
                          label = 'Car';
                          break;
                      }
                      return DropdownMenuItem<TransportationOption>(
                        value: option,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(icon),
                            SizedBox(width: 8),
                            Text(label),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 10),
                // Buttons to launch Google Maps with directions and information URLs.
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _launchMapsUrl(place.name, selectedOption!);
                      },
                      child: Icon(Ionicons.navigate_outline),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        _launchInfoUrl(place.name);
                      },
                      child: Icon(Ionicons.information_circle_outline),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Launch Google Maps URL with the selected transportation option.
  void _launchMapsUrl(String placeName, TransportationOption transportationOption) async {
    final String transportMode = _getTransportMode(transportationOption);
    final String googleMapsUrl = 'https://www.google.com/maps/dir/?api=1&destination=${Uri.encodeComponent(placeName)}&travelmode=$transportMode';
    if (await canLaunchUrlString(googleMapsUrl)) {
      await launchUrlString(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }

  // Get the transport mode for Google Maps based on the selected option.
  String _getTransportMode(TransportationOption transportationOption) {
    switch (transportationOption) {
      case TransportationOption.bus:
        return 'transit';
      case TransportationOption.bike:
        return 'bicycling';
      case TransportationOption.walk:
        return 'walking';
      case TransportationOption.car:
        return 'driving';
    }
  }

  // Launch an nature mcmaster URL for a selected place.
  void _launchInfoUrl(String placeName) async {
    String formattedPlaceName = placeName.toLowerCase().replaceAll(' ', '-');
    final String googleUrl = 'https://nature.mcmaster.ca/area/$formattedPlaceName/';
    if (await canLaunchUrlString(googleUrl)) {
      await launchUrlString(googleUrl);
    } else {
      throw 'Could not launch $googleUrl';
    }
  }
}
