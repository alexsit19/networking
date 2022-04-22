import 'package:flutter/material.dart';
import 'package:networking/navigation/rote_generator.dart';

class NetworkApp extends StatelessWidget {
  const NetworkApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
