import 'package:flutter/material.dart';
import 'pages/index_page.dart';
import 'package:flutter/rendering.dart';


void main() {
  debugPaintSizeEnabled = false;
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink,
      ),
      home: IndexPage(),
    );
  }
}
