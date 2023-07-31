// Importing packages and custom widgets
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:myapp/models/nearby_places_model.dart';
import 'package:myapp/home/nearby_places.dart';
import 'package:url_launcher/url_launcher_string.dart';

// Defining the FavouritesPage class as a StatefulWidget
class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});
  @override
  _FavouritesPageState createState() => _FavouritesPageState();

}

// State class for the FavouritesPage
class _FavouritesPageState extends State<FavouritesPage> {
  List<NearbyPlaceModel> favouritePlaces = [];
  TransportationOption? selectedOption;

  @override
  void initState() {
    super.initState();

    // Populate the favouritePlaces list using bookmarkedPlaces list
    for (int i = 0; i < bookmarkedPlaces.length; i++) {
      if (bookmarkedPlaces[i]) {
        favouritePlaces.add(nearbyPlaces[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: ListView.builder(
        itemCount: favouritePlaces.length,
        itemBuilder: (context, index) {
          // The function that builds each item in the ListView.
          return Padding(
            padding: const EdgeInsets.only(
                bottom: 15, top: 15, left: 5, right: 5),
            child: SizedBox(
              height: 120,
              width: double.maxFinite,
              child: Stack(
                children: [
                  // A Card that displays the details of each favourite place.
                  Card(
                    elevation: 0.4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        _showDialog(context, nearbyPlaces[index], index);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [

                            // Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                nearbyPlaces[index].image,
                                height: double.maxFinite,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),

                            // Name, Distance, Type
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      nearbyPlaces[index].name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(nearbyPlaces[index].distance),
                                  SizedBox(height: 5),
                                  Text(nearbyPlaces[index].type)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Bookmark icon
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: IconButton(
                      icon: Icon(
                        bookmarkedPlaces[index]
                            ? Icons.bookmark // If the place is bookmarked, show a filled bookmark icon.
                            : Icons.bookmark_border, // Otherwise, show an outline bookmark icon.
                        color: bookmarkedPlaces[index] ? Colors.yellow : Colors.grey, // Customize the color as needed.
                      ),
                      onPressed: () {
                        // Function to toggle the bookmarked state when the bookmark icon is pressed.
                        setState(() {
                          bookmarkedPlaces[index] = !bookmarkedPlaces[index];
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
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