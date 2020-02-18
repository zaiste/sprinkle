import 'package:flutter/material.dart';
import 'package:sprinkle/Provider.dart';
import 'package:sprinkle/AuthManager.dart';

import 'LoginPage.dart';
import 'HomePage.dart';


class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    AuthManager manager = Provider.of(context).fetch<AuthManager>();

    return StreamBuilder<Object>(
      stream: manager.authState$,
      initialData: AuthState.syncing,
      builder: (context, snapshot) {

        if(snapshot.data == AuthState.notLoggedIn) {
          return LoginPage();
        } else if(snapshot.data == AuthState.loggedIn) {
          return HomePage();
        } else {
          Future.delayed(Duration(seconds: 3))
          .then((_) {
            manager.setAuthState(AuthState.notLoggedIn);
          });
        }

        return Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    );
  }
}
