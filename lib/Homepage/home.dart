import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final String Apptitle = "Nutritrion";
    return MaterialApp(
      title: Apptitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(Apptitle),
        ),
        body: Container(
          color: Colors.white,
          child: Card(
            borderOnForeground: true,
            elevation: 20,
            child: Center(
              child: Text("Hello"),
            ),
          ),
        ),
      ),
    );
  }
}
