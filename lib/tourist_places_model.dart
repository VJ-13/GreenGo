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
