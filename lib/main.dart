import 'package:flutter/material.dart';
import 'SignupPage.dart'; // Ensure this file contains the SignUpPage class
import 'page1.dart'; // Ensure this file contains the Page1 class
import 'WelcomePage.dart'; // Ensure this file contains the WelcomePage class
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(), // Ensure WelcomePage is a valid widget
      routes: {
        '/login': (context) => LoginPage(), // Ensure LoginPage is a valid widget
        '/signup': (context) => SignUpPage(), // Ensure SignUpPage is a valid widget
        '/page1': (context) => Page1(), // Ensure Page1 is a valid widget
      },
    );
  }
}
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent.shade100,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png', // Use your PNG logo image
                width: 100.0, // Set the width of the logo
                height: 100.0, // Set the height of the logo
                fit: BoxFit.contain, // Ensures the image is not stretched
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                obscureText: true,
              ),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/page1'); // Navigate to page1
                },
                child: Text('Sign In'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  foregroundColor: Colors.white, // Set the text color to white
                ),
              ),
              SizedBox(height: 20.0),
              Text('or Sign in with'),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/images/gmail.svg',
                      semanticsLabel: 'Google Logo',
                    ),
                    iconSize: 40.0,
                    onPressed: () {
                      // Handle Google sign-in
                    },
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/images/facebook.svg',
                      semanticsLabel: 'Facebook Logo',
                    ),
                    iconSize: 40.0,
                    onPressed: () {
                      // Handle Facebook sign-in
                    },
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/images/twitter.svg',
                      semanticsLabel: 'Twitter Logo',
                    ),
                    iconSize: 40.0,
                    onPressed: () {
                      // Handle Twitter sign-in
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup'); // Navigate to sign-up page
                    },
                    child: Text('Sign up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
