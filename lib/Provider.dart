import 'package:flutter/material.dart';
import 'package:sprinkle/Overseer.dart';

class Provider extends InheritedWidget {
  final Overseer data;

  Provider({Key key, Widget child, this.data}) : super(key: key, child: child);

  static Overseer of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>()).data;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
