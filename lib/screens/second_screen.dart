import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:networking/data/album.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SecondScreen"),
      ),
      body: FutureBuilder<List<dynamic>?>(
          future: getHttp(),
          builder: (context, snapshot) {
            Widget child = const Center(
              child: CircularProgressIndicator(),
            );
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                child = const Center(
                  child: Text(
                    "We have an error",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                );
              } else if (snapshot.hasData) {
                child = ListAlbums(list: snapshot);
              }
            }
            return child;
          }),
    );
  }

  Future<List<Album>?> getHttp() async {
    Dio dio = Dio();
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 30000;
    try {
      Response response =
          await dio.get('https://jsonplaceholder.typicode.com/posts');
      if (response.statusCode == 200) {
        var albumData = response.data as List;
        var listAlbums =
            albumData.map((element) => Album.fromJson(element)).toList();
        return listAlbums;
      }
    } catch (error) {
      return Future.error("$error");
    }
    return null;
  }
}

class ListAlbums extends StatelessWidget {
  final AsyncSnapshot<List?> list;

  const ListAlbums({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: list.data?.length,
        itemBuilder: (context, index) {
          final item = list.data?[index] as Album;
          return Card(
            child: ListTile(
              title: Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                item.body,
                style: const TextStyle(fontSize: 12),
              ),
              onTap: () {
                Navigator.pop(context, item);
              },
            ),
          );
        },
      ),
    );
  }
}
