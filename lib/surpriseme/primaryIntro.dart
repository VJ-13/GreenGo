import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lottie/lottie.dart';

class primIntro extends StatefulWidget {
  final String contents;
  final String title;
  final String img;
  final String url;
  final MaterialStateProperty<Color> themeC;
  final Icon butIcon;
  const primIntro(
      {required this.contents,
      required this.title,
      required this.themeC,
      required this.url,
      required this.img,
      required this.butIcon,
      super.key});

  @override
  State<primIntro> createState() => _primIntroState();
}

class _primIntroState extends State<primIntro> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Lottie.asset('assets/lot/surp.json', height: 35),
      label: Text("Surprise Me"),
      onPressed: () {
        showGeneralDialog(
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
                        title: Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "honey",
                          ),
                        ),
                        children: [
                          Image(image: AssetImage(widget.img)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.contents,
                          ),
                          ElevatedButton.icon(
                              icon: widget.butIcon,
                              onPressed: (() {
                                _launchURL(widget.url);
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
      },
    );
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
