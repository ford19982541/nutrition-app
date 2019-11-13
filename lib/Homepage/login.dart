import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutrition_app/FoodFrequency/page1.dart';
import 'package:nutrition_app/uidata.dart';

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
        Container(decoration: BoxDecoration(color: Colors.white)),
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
            _loginbtn(),
          ],
        ),
      );

  Widget _logo() => Image.asset(
        ("assets/logo.jpg"),
        fit: BoxFit.contain,
      );
  Widget _loginbtn() => Container(
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          color: Colors.blue,
          onPressed: _onPressed,
          child: Text(
            UIData.login.toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  void _onPressed() {
    Navigator.pushReplacementNamed(context, '/page1');
  }
}
