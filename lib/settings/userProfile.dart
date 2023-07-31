// Importing packages and custom widgets
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:myapp/settings/title.dart';
import 'favourites_page.dart';
import '../buttomNavi.dart';

// Defining the SettingsPage class as a StatefulWidget
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

// State class for the SettingsPage
class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // Language Option
              SettingTitle(
                icon: Ionicons.language_outline,
                title: "Language",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LanguageScreen()),
                  );
                },
              ),
              const SizedBox(height: 30),

              // Feedback Option
              SettingTitle(
                icon: Ionicons.chatbox_ellipses_outline,
                title: "Feedback",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedbackScreen()),
                  );
                },
              ),
              const SizedBox(height: 30), // Empty space for visual spacing

              // Favourites Option
              SettingTitle(
                icon: Ionicons.bookmark_outline,
                title: "Favourites",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FavouritesPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavi.Bottom(),
    );
  }
}

// Defining the LanguageScreen as a StatefulWidget
class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

// State class for the LanguageScreen
class _LanguageScreenState extends State<LanguageScreen> {
  // Variable to keep track of the selected language
  String selectedLanguage = '';

  @override
  Widget build(BuildContext context) {
    // List of available languages
    final List<String> languages = [
      'English',
      'Spanish',
      'French',
      'German',
      'Italian',
      'Chinese',
      'Japanese',
      'Korean',
      'Russian',
      'Arabic',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Language'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Click the button on the top right corner of the home screen to switch the language',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final language = languages[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: selectedLanguage == language ? Color.fromRGBO(255,191,104,1.0) : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        language,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      tileColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          selectedLanguage = language;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Stateless class for the FeedbackScreen
class FeedbackScreen extends StatelessWidget {
  // Three controllers to handle user input for name, email, and feedback.
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [

            // Name
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Email
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Comments
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: TextField(
                  controller: feedbackController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Comments',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Send button
            ElevatedButton(
              onPressed: () {
                // When the button is pressed, the feedback data (name, email, and comments)
                // is retrieved from the corresponding text controllers.
                String name = nameController.text;
                String email = emailController.text;
                String feedback = feedbackController.text;

                // After processing the feedback, the text fields are cleared to reset them.
                nameController.clear();
                emailController.clear();
                feedbackController.clear();
              },
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}

