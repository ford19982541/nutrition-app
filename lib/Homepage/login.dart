import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutrition_app/Homepage/register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(
//          title: Text("Login"),
//        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white
              )),
            ListView(
              children: <Widget>[
                _buildForm(),
              ],
            ),
          ],
        ));
  }
  Widget _buildForm() => Card(
    color: Colors.white,
    child: Column(
      children: <Widget>[
        _logo(),
      ],
    ),
    );

  Widget _logo() => Image.asset(("assets/logo.jpg"),fit: BoxFit.contain,);

  void _onPressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Register()));
  }
}
