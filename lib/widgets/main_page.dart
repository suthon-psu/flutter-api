import 'package:api/models/link.dart';
import 'package:api/widgets/app_web_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future<List<Link>> fetchLinks() async {
  var dio = Dio();
  var result = await dio.get('https://api.pupasoft.com/links');
  return result.data.map<Link>(Link.fromJson).toList();
}

class LinkCard extends StatelessWidget {
  final Link link;
  const LinkCard({super.key, required this.link});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (link.link == null) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('ยังไม่พร้อมให้บริการ')));
        } else {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => AppWebPage(link: link)));
        }
      },
      child: Image.network(
        link.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: FutureBuilder(
            future: fetchLinks(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.count(
                  crossAxisCount: 3,
                  children: (snapshot.data ?? [])
                      .map<LinkCard>((link) => LinkCard(link: link))
                      .toList(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        appBar: AppBar(
          title: const Text('App'),
        ));
  }
}
