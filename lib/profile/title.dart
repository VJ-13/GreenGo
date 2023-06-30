import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
          color: Color.fromRGBO(255,191,104,1.0),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: Colors.black),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: onTap,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(Ionicons.chevron_forward_outline),
            ),
          )
        ],
      ),
    );
  }
}
