import 'package:api/models/link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AppWebPage extends StatelessWidget {
  final Link link;
  const AppWebPage({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
          initialUrlRequest:
              URLRequest(url: WebUri(link.link ?? 'https://www.google.com'))),
      appBar: AppBar(
        title: Text(link.title),
      ),
    );
  }
}
