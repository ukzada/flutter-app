import 'package:flutter/material.dart';
import 'page1.dart'; // Import your existing Page1 file here

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blue[900], // Dark Blue
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Page1()), // Navigate to Page1 when the arrow is pressed
            );
          },
        ),
      ),
      body: Column(
        children: [
          // Profile Picture Section
          Container(
            height: 100,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/me.jpeg'), // Add your profile image here
                ),
              ],
            ),
          ),
          // Settings and Support Options Section
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SettingsOption(
                    icon: Icons.person,
                    text: 'Personal Details',
                    onTap: () {
                      // Navigate to Personal Details Page or handle the tap action
                    },
                  ),
                  SettingsOption(
                    icon: Icons.payment,
                    text: 'Payment Method',
                    onTap: () {
                      // Navigate to Payment Method Page or handle the tap action
                    },
                  ),
                  SettingsOption(
                    icon: Icons.language,
                    text: 'Language',
                    onTap: () {
                      // Navigate to Language Settings Page or handle the tap action
                    },
                  ),
                  SettingsOption(
                    icon: Icons.dark_mode,
                    text: 'Dark Theme',
                    onTap: () {
                      // Handle Dark Theme toggle or navigate to related settings
                    },
                  ),
                  SizedBox(height: 30),
                  SupportOption(
                    icon: Icons.help_center,
                    text: 'Help Center',
                    onTap: () {
                      // Navigate to Help Center Page or handle the tap action
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Selected index for the profile icon
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
      ),
    );
  }
}

class SettingsOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  SettingsOption({required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.black),
          ],
        ),
      ),
    );
  }
}

class SupportOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  SupportOption({required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8), // Adjusted margin to balance space
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black),
            SizedBox(width: 16),
            Flexible( // This allows the text to wrap or resize to avoid overflow
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
