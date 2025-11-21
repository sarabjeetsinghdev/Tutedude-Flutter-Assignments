// ignore_for_file: camel_case_types

import 'package:tutedude_flutter_assignment_03/quotes.dart';
import 'package:flutter/material.dart';
import 'dart:math';

/// The main home page widget that displays a random quote generator.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _myhomepage();
}

/// The state class for [MyHomePage].
/// Manages the current quote displayed and handles quote generation.
class _myhomepage extends State<MyHomePage> {
  /// The currently displayed quote.
  /// Defaults to a prompt message until the user generates a quote.
  String quote = "Click to generate";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tutedude Assignment 03 Learn Flutter')),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Container(
            height: 200,
            width: 550,
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 119, 128, 189),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(5.0, 5.0),
                  color: Colors.black,
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Animated text widget that fades in/out when the quote changes.
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: FadeTransition(opacity: animation, child: child),
                  ),
                  child: Container(
                    key: ValueKey<String>(quote),
                    height: 70.0,
                    margin: EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      quote,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                /// Button that triggers a new random quote to be displayed.
                FilledButton(
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    ),
                  ),
                  onPressed: () {
                    // Generate a random index within the bounds of the quotes list.
                    final randomIndex = Random().nextInt(quotes.length);
                    setState(() {
                      // Update the displayed quote to the randomly selected one.
                      quote = quotes[randomIndex];
                    });
                  },
                  child: Text('Inspire me', style: TextStyle(fontSize: 15)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
