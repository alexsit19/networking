import 'package:flutter/material.dart';
import 'package:networking/navigation/app_routes.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FirstScreen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.secondScreen);
          },
          child: const Text("Go to SecondScreen"),
        ),
      ),
    );
  }
}
