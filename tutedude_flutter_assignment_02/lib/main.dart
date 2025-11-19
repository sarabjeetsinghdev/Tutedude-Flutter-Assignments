/// Main entry point for the Tutedude Flutter Assignment 02 application.
///
/// This file is responsible for bootstrapping the Flutter framework and launching
/// the root widget (`MyApp`) that defines the overall structure and theme
/// of the application.
// ignore_for_file: dangling_library_doc_comments

import 'package:tutedude_flutter_assignment_02/myApp.dart';
import 'package:flutter/material.dart';

/// The main function is the starting point of the Dart program.
///
/// It calls [runApp] with an instance of [MyApp], which is the root widget
/// of the application. The `const` keyword ensures the widget is
/// canonicalized for performance.
void main() {
  runApp(const MyApp());
}
