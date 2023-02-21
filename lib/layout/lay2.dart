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
    return InputChip(
      selectedColor: Colors.lightGreenAccent.shade200,
      selected: tagSelected,
      padding: EdgeInsets.all(0.5),
      onPressed: () {
        globals.ChosenTags.add(widget.label);
        setState(() {
          tagSelected = !tagSelected;
        });
      },
      label: Text(widget.label),
      avatar: CircleAvatar(
        backgroundImage: AssetImage(widget.img),
      ),
      backgroundColor: Colors.white,
      elevation: 0.4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
