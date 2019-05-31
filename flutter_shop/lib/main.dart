import 'package:flutter/material.dart';
import 'pages/index_page.dart';

void main() {
  
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
      ),
      home: IndexPage(),
    );
  }
}
