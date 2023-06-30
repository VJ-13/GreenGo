import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:myapp/nearby_places_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

enum TransportationOption {
  bus,
  bike,
  walk,
  car,
}

class NearbyPlaces extends StatelessWidget {
  final int trans;
  NearbyPlaces({required this.trans, Key? key}) : super(key: key);
  TransportationOption? selectedOption;
  void _showDialog(BuildContext context, place) {
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
                // Add additional information about the place here,
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
                Text(
                  place.name,
                  style: TextStyle(
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
                DropdownButton<TransportationOption>(
                  value: selectedOption,

                  onChanged: (TransportationOption? option) {
                    if (option != null) {
                      selectedOption = option;
                      Navigator.of(context).pop();
                      _showDialog(context, place); // Show the dialog again with the updated selected option
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
                SizedBox(height: 10),
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

  void _launchMapsUrl(String placeName, TransportationOption transportationOption) async {
    final String transportMode = _getTransportMode(transportationOption);
    final String googleMapsUrl = 'https://www.google.com/maps/dir/?api=1&destination=${Uri.encodeComponent(placeName)}&travelmode=$transportMode';
    if (await canLaunchUrlString(googleMapsUrl)) {
      await launchUrlString(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }

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

  void _launchInfoUrl(String placeName) async {
    String formattedPlaceName = placeName.toLowerCase().replaceAll(' ', '-');
    final String googleUrl = 'https://nature.mcmaster.ca/area/$formattedPlaceName/';
    if (await canLaunchUrlString(googleUrl)) {
      await launchUrlString(googleUrl);
    } else {
      throw 'Could not launch $googleUrl';
    }
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
            child: Card(
              elevation: 0.4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  _showDialog(context, nearbyPlaces[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
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
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                trans < 0
                                    ? nearbyPlaces[index].name
                                    : nearbyPlacesCN[index].name,
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(nearbyPlaces[index].distance),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade700,
                                  size: 16,
                                ),
                                const Text(
                                  "4.5",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}