import 'package:flutter/material.dart';
import 'package:myapp/homePage.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:lottie/lottie.dart';

class WelcomeR extends StatelessWidget {
  const WelcomeR({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<List> contents = [
      [
        'assets/icons/WelcomePageIcon.png',
        "Explore and Enjoy places \nin Hamilton",
        'assets/lot/walk.json'
      ],
      [
        'assets/icons/spring.png',
        'Enjoy Spring Flower in Hamilton',
        'assets/lot/bike2.json'
      ],
      [
        'assets/icons/fall.png',
        'Immerse yourself in golden maple',
        'assets/lot/boat.json'
      ],
      ['assets/icons/winter.png', 'Welcome to the north', 'assets/lot/dog.json']
    ];

    return Scaffold(
      body: ImageSlideshow(
          width: double.infinity,
          height: double.infinity,
          isLoop: true,
          autoPlayInterval: 4000,
          children: [
            for (var i = 0; i < contents.length; i++)
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.blueGrey.withOpacity(0.45),
                            BlendMode.dstATop),
                        image: AssetImage(contents[i][0]),
                        fit: BoxFit.fitHeight)),
                child: Stack(
                  children: [
                    Positioned(
                        top: height * 0.1,
                        left: width * 0.1,
                        child: Container(
                          width: width * 0.8,
                          height: height * 0.8,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.grey.shade100.withOpacity(0.68)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Lottie.asset(contents[i][2],
                                  height: height * 0.2, fit: BoxFit.fitHeight),
                              Text(
                                contents[i][1],
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
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54),
                              ),
                              const SizedBox(height: 20),
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
                                    child: Text(
                                      "Get Started",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: height * 0.03),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        shape: StadiumBorder(),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 8)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              )
          ]),
    );
  }
}
