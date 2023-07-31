class TouristPlacesModel {
  final String name;
  final String image;
  TouristPlacesModel({
    required this.name,
    required this.image,
  });
}

List<TouristPlacesModel> touristPlaces = [
  TouristPlacesModel(name: "Park", image: "assets/icons/Forest.png"),
  TouristPlacesModel(name: "Lake", image: "assets/icons/Lake.png"),
  TouristPlacesModel(name: "Trail", image: "assets/icons/Trail.png"),
  TouristPlacesModel(name: "Waterfall", image: "assets/icons/Waterfall.png"),
];
List<TouristPlacesModel> touristPlacesCN = [
  TouristPlacesModel(name: "森林", image: "assets/icons/Forest.png"),
  TouristPlacesModel(name: "湖泊", image: "assets/icons/Lake.png"),
  TouristPlacesModel(name: "小径", image: "assets/icons/Trail.png"),
  TouristPlacesModel(name: "瀑布", image: "assets/icons/Waterfall.png"),
];
