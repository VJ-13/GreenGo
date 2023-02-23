import 'package:flutter/material.dart';
import 'package:myapp/globals.dart' as globals;

class TagIcon extends StatefulWidget {
  final String label;
  final String img;

  const TagIcon({required this.img, required this.label, super.key});

  @override
  State<TagIcon> createState() => _TagIconState();
}

class _TagIconState extends State<TagIcon> {
  bool tagSelected = false;
  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: new Matrix4.identity()..scale(1.1),
        child: InputChip(
          selectedColor: Colors.lightGreenAccent.shade200,
          selected: tagSelected,
          padding: EdgeInsets.only(right: 5, top: 2, bottom: 2),
          onPressed: () {
            globals.ChosenTags.add(widget.label);
            setState(() {
              tagSelected = !tagSelected;
            });
          },
          label: Text(
            widget.label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          avatar: CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(widget.img),
          ),
          backgroundColor: Colors.white,
          elevation: 0.4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ));
  }
}
