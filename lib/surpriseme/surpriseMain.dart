import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/layout/lay2.dart';
import 'package:myapp/globals.dart' as globas;
import 'primaryIntro.dart';
import 'dart:math';

class SurpriseMe extends StatefulWidget {
  const SurpriseMe({super.key});

  @override
  State<SurpriseMe> createState() => _SurpriseMeState();
}

class _SurpriseMeState extends State<SurpriseMe> {
  var rng = Random().nextInt(globas.parkInfo.length);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(child: Lottie.asset('assets/lot/walk.json')),
            primIntro(
                contents: globas.parkInfo[rng][2],
                title: globas.parkInfo[rng][1],
                themeC: globas.parkInfo[rng][4],
                url: globas.parkInfo[rng][5],
                img: globas.parkInfo[rng][0],
                butIcon: globas.parkInfo[rng][3]),
            Container(
              child: Row(
                children: [
                  for (var i = 0; i < globas.touristPlaces.length; i++)
                    TagIcon(
                        img: globas.touristPlaces[i].image,
                        label: globas.touristPlaces[i].name)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
