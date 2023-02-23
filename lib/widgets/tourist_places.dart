import 'package:flutter/material.dart';
import 'package:myapp/tourist_places_model.dart';

class TouristPlaces extends StatelessWidget {
  final int trans;
  const TouristPlaces({required this.trans, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return trans < 0
              ? Chip(
                  label: Text(touristPlaces[index].name),
                  avatar: CircleAvatar(
                    backgroundImage: AssetImage(touristPlaces[index].image),
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                )
              : Chip(
                  label: Text(touristPlacesCN[index].name),
                  avatar: CircleAvatar(
                    backgroundImage: AssetImage(touristPlacesCN[index].image),
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                );
        },
        separatorBuilder: (context, index) =>
            const Padding(padding: EdgeInsets.only(right: 10)),
        itemCount: touristPlaces.length,
      ),
    );
  }
}
