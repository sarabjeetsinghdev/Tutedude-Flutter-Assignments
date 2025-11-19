// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'dart:async';

/// Creating actual home page Statefully
/// This widget displays a local image and a network image with a loading indicator and error handling.
class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

/// State class for the Home widget, manages image loading and countdown logic
class _HomeScreen extends State<Home> {
  /// Initial loader image displayed before network image loads
  Image Img = Image.asset("assets/loader.jpg", fit: BoxFit.cover);

  /// Fallback image displayed if network image fails to load
  Image errorImg = Image.asset("assets/error.png");

  /// Remote URL of the network image to load
  String originalImgPath =
      'https://ik.imagekit.io/sahibkapoor111/electronics-6801339_1280_bbXKO3Ds58.jpg?updatedAt=1742366437182';

  /// Countdown timer value (in seconds) for network image loading delay
  int seconds = 5;

  @override
  /// Initializes the 5-second countdown timer when the widget is created
  void initState() {
    super.initState();
    if (mounted) {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        if (seconds == 0) {
          timer.cancel();
        } else {
          setState(() {
            seconds -= 1;
          });
        }
      });
    }
  }

  @override
  /// Builds the UI of the home screen.
  Widget build(BuildContext context) {
    /// Provides the size of the current media (e.g., screen size).
    final size = MediaQuery.of(context).size;

    /// Triggers network image load 5 seconds after the UI is first built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 5000), () {
        setState(() {
          Img = Image.network(
            originalImgPath,
            errorBuilder: (context, error, stackTrace) {
              return errorImg;
            },
            width: (size.width / 2.0) - 10.0,
            height: (size.height / 2.0) - 10.0,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          );
        });
      });
    });
    return Scaffold(
      // Background color imported from root
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      /// App bar with the title of the assignment.
      appBar: AppBar(title: Text("Tutedude Assignment 01 Learn Flutter")),
      body: SizedBox(
        /// Allows the content to be scrollable if it exceeds the screen height.
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8.0),
            width: size.width - 10.0,

            /// Main container for the two image columns.
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: (size.width - 10.0) / 3,
                      child: Column(
                        spacing: 8.0,

                        /// Displays the local asset image with styling
                        /// Displays the network image (with countdown and loading states)
                        children: [
                          /// Text indicating that this is a local image.
                          /// Text indicating that this is a network image, with a countdown if loading.
                          // Local Image
                          Text(
                            'This is a local Image',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(5, 5),
                                  color: const Color.fromARGB(50, 0, 0, 0),
                                  blurRadius: 5.0,
                                  spreadRadius: 5.0,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.all(
                                Radius.circular(20.0),
                              ),
                              child: Image.asset(
                                'assets/local.jpeg',
                                width: size.width / 2.2,
                                height: size.height / 2.2,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Network Image
                    SizedBox(
                      width: (size.width - 10.0) / 3,
                      child: Column(
                        spacing: 8.0,
                        children: [
                          Text(
                            seconds == 0
                                ? 'This is a network Image'
                                : 'This is a network Image (After loading of $seconds seconds)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(5, 5),
                                  color: const Color.fromARGB(50, 0, 0, 0),
                                  blurRadius: 5.0,
                                  spreadRadius: 5.0,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.all(
                                Radius.circular(20.0),
                              ),
                              child: Img,
                            ),
                          ),
                          SizedBox(height: 6.0),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.0),
                Center(
                  child: Text(
                    "By Sarabjeet Singh",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
