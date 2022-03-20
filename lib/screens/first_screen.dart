import 'package:flutter/material.dart';
import 'package:networking/navigation/app_routes.dart';
import '../data/album.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  Album? albumItem;
  String titleText = "Nothing to show";
  String bodyText = "Nothing to show";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FirstScreen"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                albumItem = _navigateAndGetData(context) as Album;
              },
              child: const Text("Go to SecondScreen"),
            ),
            Card(
              child: ListTile(
                title: Text(titleText),
                subtitle: Text(bodyText),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _navigateAndGetData(BuildContext context) async {
    final result =
        await Navigator.of(context).pushNamed(AppRoutes.secondScreen);
    albumItem = result as Album;
    updateTextData(albumItem);
  }

  void updateTextData(Album? albumItem) {
    setState(() {
      titleText = albumItem?.title ?? titleText;
      bodyText = albumItem?.body ?? titleText;
    });
  }
}
