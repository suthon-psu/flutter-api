import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class Link {
  String title;
  String imageUrl;
  String? link;
  Link({required this.title, required this.imageUrl, this.link});

  factory Link.fromJson(dynamic data) {
    return Link(
        title: data['title'], imageUrl: data['imageUrl'], link: data['link']);
  }
}

Future<List<Link>> fetchLinks() async {
  var dio = Dio();
  var result = await dio.get('https://api.pupasoft.com/links');
  return result.data.map<Link>(Link.fromJson).toList();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
