import 'package:flutter/material.dart';
import 'package:myapp/homePage.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<List> contents = [
      [
        'assets/icons/WelcomePageIcon.png',
        "Explore and Enjoy places \nin Hamilton"
      ],
      ['assets/icons/spring.png', 'Enjoy Spring Flower in Hamilton'],
      ['assets/icons/fall.png', 'Immerse yourself in golden maple'],
      ['assets/icons/winter.png', 'Welcome to the north']
    ];
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            ImageSlideshow(
                isLoop: true,
                initialPage: 0,
                autoPlayInterval: 4000,
                children: [
                  for (var i = 0; i < contents.length; i++)
                    Image.asset(
                      contents[i][0],
                      height: 350,
                      width: 450,
                      alignment: Alignment.center,
                    )
                ]),
            const SizedBox(height: 60),
            Text(
              contents[0][1],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Add Description",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                  child: Text("Get Started"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: StadiumBorder(),
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 8)),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
