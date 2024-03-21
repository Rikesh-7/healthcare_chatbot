import 'package:flutter/material.dart';
import 'chat_screen.dart'; // Import the chat screen page
import 'login_page.dart'; // Import the login page
import 'signup_page.dart'; // Import the signup page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Care Chatbot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => LoginPage(), // Define routes
        '/signup': (context) => SignupPage(), // Signup page route
        '/chat': (context) => ChatScreen(), // Chat screen route
      },
    );
  }
}
