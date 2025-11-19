// ignore_for_file: file_names

import 'package:tutedude_flutter_assignment_02/intro_screen.dart';
import 'package:flutter/material.dart';

/// Root widget of the application.
/// Configures global MaterialApp settings and sets the entry screen.
class MyApp extends StatelessWidget {
  /// Creates the [MyApp] widget.
  /// The [key] parameter is passed to the superclass.
  const MyApp({super.key});

  /// Builds the [MaterialApp] that defines the app's theme and initial route.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Removes the debug banner in the top-right corner.
      debugShowCheckedModeBanner: false,
      // Defines the default visual styling for the app.
      theme: ThemeData(
        // Sets the background color for all [Scaffold] widgets.
        scaffoldBackgroundColor: Color.fromRGBO(228, 228, 228, 1),
      ),
      // The first screen displayed when the app launches.
      home: IntroScreen(),
    );
  }
}