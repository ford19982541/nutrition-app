import 'package:flutter/material.dart';
import 'package:nutrition_app/uidata.dart';
import 'package:nutrition_app/Homepage/login.dart';
import 'package:nutrition_app/Homepage/register.dart';
class Homepage extends StatelessWidget {
  final materialApp = MaterialApp(
    title: UIData.appName,
    theme: ThemeData(
        primaryColor: Colors.lightBlue,
        fontFamily: UIData.quickFont,
        primarySwatch: Colors.amber),
    debugShowCheckedModeBanner: false,
    showPerformanceOverlay: false,
    home: Login(),
    routes: <String,WidgetBuilder>{
      UIData.loginRoute: (BuildContext context) => Login(),
      UIData.regisRoute: (BuildContext context) => Register(),
    }
  );

  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}


