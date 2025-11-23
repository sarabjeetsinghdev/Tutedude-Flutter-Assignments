// ignore_for_file: camel_case_types

import 'package:carousel_slider/carousel_slider.dart';
import 'package:tutedude_flutter_assignment_04/quotes.dart';
import 'package:flutter/material.dart';

/// The main home page widget that displays a carousel of inspirational quotes.
///
/// Users can navigate through the quotes using Previous / Next buttons.
/// The carousel automatically enlarges the center item for better readability.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

/// State for [MyHomePage].
///
/// Holds the [CarouselSliderController] to programmatically control
/// the quote carousel (e.g., move to previous / next quote).
class _MyHomePageState extends State<MyHomePage> {
  /// Controller used to animate the carousel to the previous or next quote.
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tutedude Assignment 04 Learn Flutter')),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Container(
            height: 245,
            width: 550,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xFF7780BD),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(5, 5),
                  color: Colors.black,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Title displayed above the carousel.
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                  color: Color.fromARGB(255, 98, 77, 157),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Text(
                    'QUOTES CAROUSEL SLIDER',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                /// Carousel that shows one quote at a time.
                CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    height: 90,
                    aspectRatio: 2,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    autoPlayCurve: Curves.bounceInOut,
                  ),
                  items: quotes.map((quote) {
                    return Builder(
                      builder: (context) {
                        return Column(
                          children: [
                            SizedBox(
                              key: ValueKey<String>(quote),
                              height: 70,
                              child: Text(
                                quote,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }).toList(),
                ),

                /// Navigation buttons to move between quotes.
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Moves the carousel to the previous quote.
                    FilledButton(
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 20,
                          ),
                        ),
                      ),
                      onPressed: () => _carouselController.previousPage(),
                      child: const Text(
                        'Previous',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),

                    /// Moves the carousel to the next quote.
                    FilledButton(
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 20,
                          ),
                        ),
                      ),
                      onPressed: () => _carouselController.nextPage(),
                      child: const Text('Next', style: TextStyle(fontSize: 15)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
