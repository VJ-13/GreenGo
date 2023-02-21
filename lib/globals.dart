library my_prj.globals;

import 'package:flutter/material.dart';

List userInput = [];
List parkInfo = [
  [
    "assets/img/abfall.jpg",
    "Albion Falls",
    "At 62 ft., Albion Falls is considered to be one of the most beautiful waterfalls in the Hamilton community, whose classic ‘cascade’ waterway features picturesque observation points, leisurely hiking trails, and family-friendly picnic spots.",
    Icon(Icons.waterfall_chart),
    MaterialStateProperty.all(Colors.lightBlueAccent),
    "https://nature.mcmaster.ca/area/albion-falls/",
    ["Fall", "Bike", "Bus", "Hiking"]
  ],
  [
    "assets/img/bfpk.jpg",
    "Bayfront Park",
    "Found along the banks of Lake Ontario, Bayfront Park is a 40-acre park in the West-end of Hamilton Harbour. Connected to the beautiful Hamilton Waterfront Trail, specifically the Desjardins Trail, the park is a great place to start or end a waterfront stroll. ",
    Icon(Icons.padding),
    MaterialStateProperty.all(Colors.blue),
    "https://nature.mcmaster.ca/area/bayfront-park/",
    ["Lake", "Bus", "Bike", "Boating", "Biking"]
  ],
  [
    "assets/img/trail.jpg",
    "Chedoke Radial Trail",
    "The Chedoke Radial Trail is a 2.7-kilometre section of the Bruce Trail that traverses the Niagara Escarpment.",
    Icon(Icons.directions_walk),
    MaterialStateProperty.all(Colors.greenAccent),
    "https://nature.mcmaster.ca/area/chedoke-radial-trail/",
    ["Trail", "Forest", "Bike", "Bus", "Hiking", "Biking"]
  ],
  [
    "assets/img/cfbch.jpg",
    "Confederation Beach Park",
    "Confederation Beach Park is a 93-hectare park owned by the City of Hamilton and managed by the Hamilton Conservation Authority.",
    Icon(Icons.beach_access),
    MaterialStateProperty.all(Colors.lightBlue),
    "https://nature.mcmaster.ca/area/confederation-park/",
    ["Lake", "Car", "Boating", "Biking"]
  ],
  [
    "assets/img/djt.jpg",
    "Desjardins Trail",
    "Open all year round, the Desjardins Canal is a great area for runners, bikers, walkers, rollerbladers, skateboarders and hikers alike!",
    Icon(Icons.light),
    MaterialStateProperty.all(Colors.orange),
    "https://nature.mcmaster.ca/area/desjardins-trail/",
    ["Trail", "Bike", "Car", "Hiking", "Biking"]
  ],
  [
    "assets/img/dpfall.jpg",
    "Devils Punchbowl",
    "Consisting of colourful layers of stratified rock, Devil’s Punchbowl is widely considered to be one of the Escarpment’s most unforgettable sights.",
    Icon(Icons.waterfall_chart_rounded),
    MaterialStateProperty.all(Colors.lightBlue),
    "https://nature.mcmaster.ca/area/devils-punchbowl/",
    ["Fall", "Car", "Hiking"]
  ]
];

class TouristPlacesModel {
  final String name;
  final String image;
  TouristPlacesModel({
    required this.name,
    required this.image,
  });
}

List<TouristPlacesModel> touristPlaces = [
  TouristPlacesModel(name: "Forest", image: "assets/icons/Forest.png"),
  TouristPlacesModel(name: "Lake", image: "assets/icons/Lake.png"),
  TouristPlacesModel(name: "Trail", image: "assets/icons/Trail.png"),
  TouristPlacesModel(name: "Waterfall", image: "assets/icons/Waterfall.png"),
];

List<String> ChosenTags = [];
