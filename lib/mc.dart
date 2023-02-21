import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'layout/buttomNavi.dart';
import 'package:page_transition/page_transition.dart';
import 'globals.dart' as globals;

class MCMode extends StatefulWidget {
  final List? material;
  final String? title;
  final Widget? pageTo;

  const MCMode(
      {@required this.material,
      @required this.title,
      @required this.pageTo,
      super.key});

  @override
  State<MCMode> createState() => _MCModeState();
}

class _MCModeState extends State<MCMode> {
  double _screenWidth = 0;
  double _screenH = 0;
  List valueCheck = ["Forest", "Lake", "Trail", "Fall"];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenWidth = MediaQuery.of(context).size.width;
    _screenH = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      bottomNavigationBar: ButtomNavi(),
      body: Center(
        child: Column(
          children: [
            for (var i = 0; i < widget.material!.length; i++)
              Container(
                  margin: EdgeInsets.only(top: _screenH / 25),
                  height: _screenH / widget.material!.length / 1.5,
                  width: _screenWidth / 1.3,
                  child: ElevatedButton.icon(
                      style:
                          ButtonStyle(backgroundColor: widget.material![i][1]),
                      onPressed: () {
                        valueCheck.contains(widget.material![i][0])
                            ? setState(
                                () {
                                  globals.userInput = [widget.material![i][0]];
                                },
                              )
                            : setState(
                                () {
                                  globals.userInput.add(widget.material![i][0]);
                                },
                              );
                        Navigator.push(
                            context,
                            PageTransition(
                                duration: const Duration(milliseconds: 500),
                                child: widget.pageTo!,
                                type: PageTransitionType.rightToLeft));
                      },
                      icon: Container(
                        width: _screenWidth / 5,
                        height: _screenH / widget.material!.length / 2.5,
                        child: Lottie.asset(widget.material![i][2],
                            fit: BoxFit.fitWidth),
                      ),
                      label: Text(
                        " " + widget.material![i][0],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "comic",
                            fontSize: _screenH / widget.material!.length / 5),
                      )))
          ],
        ),
      ),
    );
  }
}
