// ignore_for_file: public_member_api_docs, sort_constructors_first
class RecommendedPlaceModel {
  final String image;
  final String rating;
  final String location;
  RecommendedPlaceModel({
    required this.image,
    required this.rating,
    required this.location,
  });
}

List<RecommendedPlaceModel> recommendedPlaces = [
  RecommendedPlaceModel(
    image: "assets/places/AlbionFalls.jpg",
    rating: "4.5",
    location: "Albion Falls",
  ),
  RecommendedPlaceModel(
    image: "assets/places/BayfrontLake.jpg",
    rating: "4.3",
    location: "Bayfront Lake",
  ),
  RecommendedPlaceModel(
    image: "assets/places/BruceTrail.jpg",
    rating: "4.0",
    location: "Bruce Trail",
  ),
  RecommendedPlaceModel(
    image: "assets/places/UpperKingForestPark.jpg",
    rating: "4.2",
    location: "Upper King's Forest",
  ),
  RecommendedPlaceModel(
    image: "assets/places/LakeJojo.jpg",
    rating: "3.6",
    location: "Lake Jojo",
  ),
];
