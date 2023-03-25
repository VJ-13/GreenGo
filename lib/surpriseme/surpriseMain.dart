import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/layout/lay2.dart';
import 'package:myapp/globals.dart' as globas;
import 'dart:math';
import 'package:myapp/layout/buttomNavi.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:myapp/globals.dart' as global;

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
            TextButton.icon(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: Colors.black, width: 3))),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(20))),
                icon: Lottie.asset('assets/lot/surp.json', height: 35),
                label: Text(
                  "Surprise Me",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                onPressed: () {
                  global.rng = Random().nextInt(global.parkInfo.length);
                  showDia(
                      globas.parkInfo[globas.rng][1],
                      globas.parkInfo[globas.rng][0],
                      globas.parkInfo[globas.rng][2],
                      globas.parkInfo[globas.rng][5],
                      globas.parkInfo[globas.rng][3]);
                }),
            const Spacer()
          ],
        ),
      ),
      bottomNavigationBar: ButtomNavi(),
    );
  }

  showDia(title, img, contents, url, butIcon) {
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 300),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation, secondaryAnimation) {
          return Container();
        },
        transitionBuilder: (context, a1, a2, widgets) {
          return Transform.scale(
              scale: a1.value,
              child: Opacity(
                  opacity: a1.value,
                  child: SimpleDialog(
                    contentPadding: const EdgeInsets.all(8),
                    shape: Border.all(
                      width: 4,
                      style: BorderStyle.solid,
                      color: Colors.white,
                    ),
                    title: Row(
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "honey",
                          ),
                        ),
                      ],
                    ),
                    children: [
                      Image(image: AssetImage(img)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        contents,
                      ),
                      ElevatedButton.icon(
                          icon: butIcon,
                          onPressed: (() {
                            _launchURL(url);
                          }),
                          label: const Text(
                            "More Info",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "honey"),
                          ))
                    ],
                  )));
        });
  }

  _launchURL(url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
