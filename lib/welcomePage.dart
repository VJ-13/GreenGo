//Importing packages and custom widgets
import 'package:flutter/material.dart';
import 'package:myapp/home/homePage.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:lottie/lottie.dart';

// Defining the WelcomePage class as a StatelessWidget
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the device screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Define the contents of the slideshow
    List<List> contents = [
      [
        'assets/icons/spring.png',
        'Enjoy Spring Flower in Hamilton',
        'assets/lot/walk.json',
      ],
      ['assets/img/summer.png', "Enjoy the Sunshine", 'assets/lot/beach.json'],
      [
        'assets/icons/fall.png',
        'Immerse yourself in golden maple',
        'assets/lot/boat.json'
      ],
      ['assets/icons/winter.png', 'Welcome to the north', 'assets/lot/dog.json']
    ];

    return Scaffold(
      // Create an image slideshow
      body: ImageSlideshow(
        width: double.infinity,
        height: double.infinity,
        isLoop: true,
        autoPlayInterval: 4000,
        children: [
          // Create slides based on the contents list
          for (var i = 0; i < contents.length; i++)
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  // Set a overlay on top of the image
                  colorFilter: ColorFilter.mode(
                    Colors.blueGrey.withOpacity(0.45),
                    BlendMode.dstATop,
                  ),
                  image: AssetImage(contents[i][0]),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: height * 0.1,
                    left: width * 0.1,
                    child: Container(
                      width: width * 0.8,
                      height: height * 0.8,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey.shade100.withOpacity(0.68),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Display a Lottie animation
                          Lottie.asset(
                            contents[i][2],
                            height: height * 0.25,
                            fit: BoxFit.fitHeight,
                          ),
                          const SizedBox(height: 30),
                          // Display the text content for the slide
                          Text(
                            contents[i][1],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'hs',
                            ),
                          ),
                          const SizedBox(height: 30),
                          // Get Started button to navigate to the home page
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                              width: double.maxFinite,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Navigate to the home page when the button is pressed
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromRGBO(116, 29, 74, 1.0),
                                  shape: const StadiumBorder(),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 8,
                                  ),
                                ),
                                child: Text(
                                  "Get Started",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'hs',
                                    fontSize: height * 0.03,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
