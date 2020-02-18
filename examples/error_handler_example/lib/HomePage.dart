import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprinkle/Provider.dart';
import './managers/HomeManager.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    HomeManager manager = Provider.of(context).fetch<HomeManager>();

    manager.browse();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              manager.logout();
            },
          )
        ],
      ),
      body: StreamBuilder<Object>(
        stream: manager.data$,
        builder: (context, snapshot) {

          if(snapshot.hasError) {
            // Show message
          }

          return Container(
            child: Center(
              child: CircularProgressIndicator()
            ),
          );
        }
      ),
    );
  }
}