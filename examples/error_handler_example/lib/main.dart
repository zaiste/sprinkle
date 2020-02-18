import 'package:flutter/material.dart';
import 'package:sprinkle/AuthManager.dart';
import 'package:sprinkle/Overseer.dart';
import 'package:sprinkle/Provider.dart';
import 'LandingPage.dart';
import 'managers/HomeManager.dart';
import 'managers/LoginManager.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      data: Overseer()
        .register<AuthManager>(() => AuthManager())
        .register<LoginManager>(() => LoginManager())
        .register<HomeManager>(() => HomeManager()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LandingPage()
      ),
    );
  }
}

