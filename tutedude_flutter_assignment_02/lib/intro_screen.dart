import 'package:flutter/material.dart';

/// A simple introductory screen that displays a profile card.
///
/// The card shows a placeholder avatar alongside the developer's name,
/// role, and a short tagline. It is centered on a light-gray background
/// and wrapped in a scrollable container for small-screen safety.
class IntroScreen extends StatelessWidget {
  /// Creates the intro screen.
  ///
  /// The [key] parameter is passed to the superclass constructor
  /// to enable widget identification in the widget tree.
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Tutedude Assignment 02 Learn Flutter")),
        backgroundColor: const Color.fromARGB(70, 137, 133, 133),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(12.0),
              margin: EdgeInsets.all(12.0),
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusGeometry.all(Radius.circular(25.0)),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(192, 192, 192, 1), // silver start
                    Color.fromRGBO(232, 232, 232, 1), // silver end
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2.0,
                    offset: Offset(5.0, 5.0),
                    color: const Color.fromARGB(93, 0, 0, 0),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // LEFT SIDE — PROFILE IMAGE
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.blueAccent,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),

                  SizedBox(width: 20),

                  // RIGHT SIDE — TEXT DETAILS
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sarabjeet Singh",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Flutter Developer",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 8),

                      Container(
                        alignment: Alignment.center,
                        width: 150,
                        child: Text(
                          "Building beautiful UIs with love and Flutter",
                          style: TextStyle(
                            fontSize: 10.0,
                            letterSpacing: 1.1,
                            color: const Color.fromARGB(255, 90, 90, 90),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}