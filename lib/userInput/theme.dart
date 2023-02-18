import 'package:flutter/material.dart';
import 'package:myapp/mc.dart';
import 'transport.dart';

//https://www.theguardian.com/environment/2019/jun/08/forest-bathing-japanese-practice-in-west-wellbeing forest
//https://www.sandiegouniontribune.com/communities/eassets-county/story/2020-11-02/lakeside-getting-some-long-needed-upgrades lake side
//https://www.frommers.com/slideshows/848417-10-spectacular-and-stirring-waterfall-hikes-in-the-usa waterfall
class ThemeP extends StatefulWidget {
  const ThemeP({super.key});

  @override
  State<ThemeP> createState() => _ThemePState();
}

class _ThemePState extends State<ThemeP> {
  List viewimg = [
    [
      "Forest",
      MaterialStateProperty.all(Color.fromARGB(255, 191, 240, 192)),
      "assets/lot/forest.json"
    ],
    [
      "Lake",
      MaterialStateProperty.all(Colors.lightBlueAccent),
      "assets/lot/lake.json"
    ],
    [
      "Fall",
      MaterialStateProperty.all(Colors.blue),
      "assets/lot/waterfall.json"
    ],
    [
      "Trail",
      MaterialStateProperty.all(Color.fromARGB(255, 255, 244, 144)),
      "assets/lot/hiking.json"
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return MCMode(material: viewimg, title: "Theme", pageTo: TransTools());
  }
}
