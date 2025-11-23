import 'package:tutedude_flutter_assignment_04/home_page.dart';
import 'package:flutter/material.dart';

/// The root widget of the Random Quote Generator application.
///
/// [MyApp] is a [StatelessWidget] that configures the top-level
/// [MaterialApp] with a theme and sets [MyHomePage] as the home screen.
class MyApp extends StatelessWidget {
  /// Creates an instance of [MyApp].
  ///
  /// The [key] parameter is passed to the superclass for widget identification
  /// in the widget tree.
  const MyApp({super.key});

  /// Builds the widget tree for this app.
  ///
  /// Returns a [MaterialApp] configured with:
  /// - A title of 'Random Quote Generator'
  /// - A light-blue scaffold background color
  /// - A deep-purple-based color scheme
  /// - [MyHomePage] as the initial route
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Quote Generator',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 189, 194, 223),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}