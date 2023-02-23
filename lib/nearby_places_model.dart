// ignore_for_file: public_member_api_docs, sort_constructors_first
class NearbyPlaceModel {
  final String image;
  final String name;
  final String distance;
  NearbyPlaceModel({
    required this.image,
    required this.name,
    required this.distance,
  });
}

List<NearbyPlaceModel> nearbyPlaces = [
  NearbyPlaceModel(
    image: "assets/places/BayfrontPark.jpg",
    name: "Bayfront Park",
    distance: "5 km",
  ),
  NearbyPlaceModel(
    image: "assets/places/ChristieLake.jpg",
    name: "Christie Lake",
    distance: "8 km",
  ),
  NearbyPlaceModel(
      image: "assets/places/CootesParadiseTrail.jpg",
      name: "Cootes Paradise Trail",
      distance: '2 km'),
  NearbyPlaceModel(
    image: "assets/places/GagePark.jpg",
    name: "Gage Park",
    distance: "10 km",
  ),
  NearbyPlaceModel(
    image: "assets/places/TiffanyFalls.jpg",
    name: "Tiffany Falls",
    distance: "15 km",
  ),
  NearbyPlaceModel(
    image: "assets/places/WaterfrontTrail.jpg",
    name: "Waterfront Trail",
    distance: "20 km",
  ),
  NearbyPlaceModel(
    image: "assets/places/DevilPunchbowlFalls.jpg",
    name: "Devil's Punchbowl Falls",
    distance: "22 km",
  ),
];
List<NearbyPlaceModel> nearbyPlacesCN = [
  NearbyPlaceModel(
    image: "assets/places/BayfrontPark.jpg",
    name: "岸前公园",
    distance: "5 km",
  ),
  NearbyPlaceModel(
    image: "assets/places/ChristieLake.jpg",
    name: "克里斯蒂湖",
    distance: "8 km",
  ),
  NearbyPlaceModel(
      image: "assets/places/CootesParadiseTrail.jpg",
      name: "CP 小道",
      distance: '2 km'),
  NearbyPlaceModel(
    image: "assets/places/GagePark.jpg",
    name: "盖奇公园",
    distance: "10 km",
  ),
  NearbyPlaceModel(
    image: "assets/places/TiffanyFalls.jpg",
    name: "蒂芙尼瀑布",
    distance: "15 km",
  ),
  NearbyPlaceModel(
    image: "assets/places/WaterfrontTrail.jpg",
    name: "湖边小道",
    distance: "20 km",
  ),
  NearbyPlaceModel(
    image: "assets/places/DevilPunchbowlFalls.jpg",
    name: "德芙瀑布",
    distance: "22 km",
  ),
];
