// Importing packages and custom widgets
import 'package:flutter/material.dart';
import 'package:myapp/models/tourist_places_model.dart';
import '../models/nearby_places_model.dart';


// Defining the TouristPlaces class as a StatefulWidget
class PlacesTags extends StatefulWidget {
  final int trans;
  const PlacesTags({required this.trans, Key? key}) : super(key: key);
  @override
  State<PlacesTags> createState() => _PlacesTagsState();
}

// State class for the TouristPlaces
class _PlacesTagsState extends State<PlacesTags> {
  List<bool> tagSelectedList = List.generate(touristPlaces.length, (_) => false);
  bool tagSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return widget.trans < 0
              ? InputChip(
            selectedColor: Colors.lightGreenAccent.shade200,
            selected: tagSelectedList[index],
            label: Text(touristPlaces[index].name),
            avatar: CircleAvatar(
              backgroundImage: AssetImage(touristPlaces[index].image),
            ),
            backgroundColor: Colors.white,
            elevation: 0.4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onPressed: () {
              // Toggle the selected state of the chip when pressed
              setState(() {
                tagSelected = true;
                tagSelectedList[index] = !tagSelectedList[index];
              });
            },
          )
              : InputChip(
            selectedColor: Colors.lightGreenAccent.shade200,
            selected: tagSelectedList[index],
            label: Text(touristPlacesCN[index].name),
            avatar: CircleAvatar(
              backgroundImage: AssetImage(touristPlaces[index].image),
            ),
            backgroundColor: Colors.white,
            elevation: 0.4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onPressed: () {
              // Toggle the selected state of the chip when pressed and add the selected place name to ChosenTags list
              setState(() {
                ChosenTags.add(touristPlaces[index].name);
                tagSelectedList[index] = !tagSelectedList[index];
              });
            },
          );
        },
        separatorBuilder: (context, index) => const Padding(padding: EdgeInsets.only(right: 10)),
        itemCount: touristPlaces.length,
      ),
    );
  }
}
