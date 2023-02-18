import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
import 'globals.dart' as gb;

class box_file extends StatefulWidget {
  final String? img;
  final String? title;
  final String? content;
  final double? width;
  final double? height;
  final String? labelName;
  final String? pageto;
  final Icon? buttonIcon;
  final MaterialStateProperty<Color>? but_col;
  box_file(
      {@required this.img,
      @required this.buttonIcon,
      @required this.labelName,
      @required this.but_col,
      @required this.pageto,
      @required this.height,
      @required this.width,
      @required this.content,
      @required this.title,
      Key? key})
      : super(key: key);

  @override
  _box_fileState createState() => _box_fileState();
}

class _box_fileState extends State<box_file> {
  _launchURL(url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 5, color: Colors.white.withOpacity(0.6)),
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.5), BlendMode.dstATop),
              fit: BoxFit.cover,
              image: AssetImage(widget.img!))),
      margin: EdgeInsets.all(widget.height! / 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title!,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: widget.height! / 10,
                color: Colors.grey.shade800,
                fontFamily: "honey"),
          ),
          SizedBox(
            height: widget.height! / 30,
          ),
          Text(
            widget.content!,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: widget.height! / 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
                fontFamily: "comic"),
          ),
          SizedBox(
            height: widget.height! / 15,
          ),
          ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: widget.but_col!,
              ),
              icon: widget.buttonIcon!,
              label: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: widget.height! / 35,
                      horizontal: widget.height! / 22),
                  child: Text(
                    widget.labelName!,
                    style: TextStyle(
                        fontFamily: "comic",
                        fontSize: widget.height! / 17,
                        fontWeight: FontWeight.bold),
                  )),
              onPressed: () {
                _launchURL(widget.pageto!);
                // Navigator.push(
                //     context,
                //     PageTransition(
                //         type: PageTransitionType.fade,
                //         duration: const Duration(milliseconds: 500),
                //         child: widget.pageto!));
              })
        ],
      ),
    );
  }
}

class PicLayout extends StatefulWidget {
  final List? viewimg;
  final String? title;
  const PicLayout({@required this.viewimg, @required this.title, super.key});

  @override
  State<PicLayout> createState() => _PicLayoutState();
}

class _PicLayoutState extends State<PicLayout> {
  double _screenWidth = 0;
  double _screenH = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenWidth = MediaQuery.of(context).size.width;
    _screenH = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title!)),
      backgroundColor: Colors.green.shade300,
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.57,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          children: [
            for (var i = 0; i < widget.viewimg!.length; i++)
              if (widget.viewimg![i][6].contains(gb.userInput[0]))
                box_file(
                  img: widget.viewimg![i][0],
                  title: widget.viewimg![i][1],
                  labelName: widget.viewimg![i][1],
                  width: _screenWidth / 4,
                  height: _screenH / 5,
                  content: widget.viewimg![i][2],
                  buttonIcon: widget.viewimg![i][3],
                  but_col: widget.viewimg![i][4],
                  pageto: widget.viewimg![i][5],
                )
          ],
        ),
      ),
    );
  }
}
