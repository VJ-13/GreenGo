import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/layout/lay2.dart';
import 'package:myapp/globals.dart' as globas;
import 'primaryIntro.dart';
import 'package:myapp/layout/buttomNavi.dart';

class SurpriseMe extends StatefulWidget {
  const SurpriseMe({super.key});

  @override
  State<SurpriseMe> createState() => _SurpriseMeState();
}

class _SurpriseMeState extends State<SurpriseMe> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              "Surprise Me With...   ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'honey',
                  fontWeight: FontWeight.bold,
                  fontSize: height * 0.055),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: height * 0.2,
              width: width * 0.8,
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 15,
                children: [
                  for (var i = 0; i < globas.touristPlaces.length; i++)
                    TagIcon(
                        img: globas.touristPlaces[i].image,
                        label: globas.touristPlaces[i].name)
                ],
              ),
            ),
            Container(
                child: Lottie.asset('assets/lot/walk.json',
                    height: height * 0.23, fit: BoxFit.fitHeight)),
            const SizedBox(
              height: 20,
            ),
            primIntro(
                contents: globas.parkInfo[globas.rng][2],
                title: globas.parkInfo[globas.rng][1],
                themeC: globas.parkInfo[globas.rng][4],
                url: globas.parkInfo[globas.rng][5],
                img: globas.parkInfo[globas.rng][0],
                butIcon: globas.parkInfo[globas.rng][3]),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: ButtomNavi(),
    );
  }
}
