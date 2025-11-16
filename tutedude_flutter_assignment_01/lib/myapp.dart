import 'package:tutedude_flutter_assignment_01/home.dart';
import 'package:flutter/material.dart';

/// Initializing the My App
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Color.fromRGBO(228, 228, 228, 1)),
      home: Home(),
    );
  }
}
