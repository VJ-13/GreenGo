// Importing packages and custom widgets
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:myapp/models/nearby_places_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

enum TransportationOption {
  bus,
  bike,
  walk,
  car,
}
// Defining the NearbyPlaces class as a StatefulWidget
class NearbyPlaces extends StatefulWidget {
  final int trans;
  const NearbyPlaces({required this.trans, Key? key}) : super(key: key);
  @override
  _NearbyPlacesState createState() => _NearbyPlacesState();
}

// State class for the NearbyPlaces
class _NearbyPlacesState extends State<NearbyPlaces> {
  TransportationOption? selectedOption;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(nearbyPlaces.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SizedBox(
            height: 120,
            width: double.maxFinite,
            child: Stack(
              children: [
                // Place details
                Card(
                  elevation: 0.4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      // Dialog when the card is tapped
                      _showDialog(context, nearbyPlaces[index], nearbyPlacesCN[index], index);
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

                          // Name, Description, Type
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    // Display the place name based on the translation status
                                    widget.trans < 0
                                        ? nearbyPlaces[index].name
                                        : nearbyPlacesCN[index].name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(nearbyPlaces[index].distance),
                                const SizedBox(height: 5),
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
                      // Display a bookmark icon if the place is bookmarked, otherwise display an outline icon
                      bookmarkedPlaces[index]
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      color: bookmarkedPlaces[index] ? Colors.yellow : Colors.grey,
                    ),
                    onPressed: () {
                      // Toggle the bookmark status when the bookmark icon is pressed
                      bool isBookmarked = !bookmarkedPlaces[index];
                      setState(() {bookmarkedPlaces[index] = isBookmarked;});
                      // Show a SnackBar with a message indicating the bookmark status change
                      String message = isBookmarked
                          ? 'Place bookmarked: ${widget.trans < 0 ? nearbyPlaces[index].name : nearbyPlacesCN[index].name}'
                          : 'Place removed from bookmarks: ${widget.trans < 0 ? nearbyPlaces[index].name : nearbyPlacesCN[index].name}';
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  // Dialog box with information about a selected place.
  void _showDialog(BuildContext context, place, placeCN, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
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

                // Name and Description of the place
                Text(widget.trans < 0
                    ? place.name
                    : placeCN.name,
                    style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(
                    widget.trans < 0
                        ? place.description
                        : placeCN.description,
                    style: TextStyle(fontSize: 14.0)),
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
                SizedBox(height: 15),

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
                        Navigator.of(context).pop();
                        _showDialog(context, place, placeCN, index); // Show the dialog again with the updated selected option
                      }
                    },
                    items: TransportationOption.values.map((option) {
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
                SizedBox(height: 10),

                // Buttons to launch Google Maps with directions and information URLs
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
    final String googleMapsUrl = 'https://www.google.com/maps/dir/?api=1&origin=McMaster+University&destination=${Uri
        .encodeComponent(placeName)}&travelmode=$transportMode';
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
