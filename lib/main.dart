import 'package:flutter/material.dart';
import 'package:healthcare_chatbot/chat.dart';
// Import the chat screen page
import 'login_page.dart'; // Import the login page
import 'signup_page.dart'; // Import the signup page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health Care Chatbot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => LoginPage(), // Define routes
        '/signup': (context) => SignupPage(), // Signup page route
        '/chat': (context) => ChatPage(
            maintitle:
                'Title', // Replace with the actual title you want to pass
            message:
                'Message', // Replace with the actual message you want to pass
            isSender: true, // Replace with the actual sender value
            time: DateTime.now()), // Chat screen route
      },
    );
  }
}
