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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
                child: Lottie.asset('assets/lot/walk.json',
                    height: 300, fit: BoxFit.fitHeight)),
            primIntro(
                contents: globas.parkInfo[globas.rng][2],
                title: globas.parkInfo[globas.rng][1],
                themeC: globas.parkInfo[globas.rng][4],
                url: globas.parkInfo[globas.rng][5],
                img: globas.parkInfo[globas.rng][0],
                butIcon: globas.parkInfo[globas.rng][3]),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (var i = 0; i < globas.touristPlaces.length; i++)
                    TagIcon(
                        img: globas.touristPlaces[i].image,
                        label: globas.touristPlaces[i].name)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      bottomNavigationBar: ButtomNavi(),
    );
  }
}
