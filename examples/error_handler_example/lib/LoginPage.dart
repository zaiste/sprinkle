import 'package:flutter/material.dart';
import 'package:sprinkle/Provider.dart';
import './managers/LoginManager.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    LoginManager manager = Provider.of(context).fetch<LoginManager>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        child: Center(
          child: FlatButton(
            color: Colors.blue,
            child: Text('Login', style: TextStyle(color: Colors.white)),
            onPressed: () {
              manager.login();
            },
          ),
        ),
      ),
    );
  }
}