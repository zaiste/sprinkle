import 'package:flutter/material.dart';
import 'package:sprinkle/Supervisor.dart';


class Provider extends InheritedWidget {
  final Supervisor data;

  Provider({Key key, Widget child, this.data}) : super(key: key, child: child);

  static Supervisor of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>()).data;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
