import 'package:flutter/material.dart';
import 'package:networking/screens/first_screen.dart';
import 'package:networking/screens/second_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => FirstScreen());
      case '/second':
        return MaterialPageRoute(builder: (context) => SecondScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('ERROR'),
          centerTitle: true,
        ),
        body: const Center(child: Text('Page not found.')),
      );
    });
  }
}
