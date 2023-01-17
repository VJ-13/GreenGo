import 'package:flutter/material.dart';
import 'package:myapp/homePage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Spacer(),
              Image.asset(
                'assets/icons/WelcomePageIcon.png',
                height: 350,
                width: 450,
                alignment: Alignment.center,
              ),
              const SizedBox(height: 60),
              const Text(
                "Explore and Enjoy places \nin Hamilton",
                textAlign: TextAlign.center,
                style: TextStyle(
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
      )),
    );
  }
}
