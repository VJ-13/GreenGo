import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:myapp/profile/title.dart';

import '../layout/buttomNavi.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              ProfileTile(
                icon: Ionicons.language_outline,
                title: "Language",
                onTap: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              ProfileTile(
                icon: Ionicons.chatbox_ellipses_outline,
                title: "Feedback",
                onTap: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              ProfileTile(
                icon: Ionicons.bookmark_outline,
                title: "Favourites",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    bottomNavigationBar: ButtomNavi()
    );
  }
}