import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    initDeepLinkListener();
  }

  void initDeepLinkListener() async {
    _sub = linkStream.listen((String? link) {
      if (link != null) {
        // Handle the deep link, for example, by navigating to the relevant screen
        print('Received deep link: $link');
      }
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Deep Link Example")),
        body: Center(child: Text("Listening for deep links...")),
      ),
    );
  }
}
