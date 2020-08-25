import 'package:flutter/material.dart';

import 'provider.dart';

extension SprinkleExtension<T> on BuildContext {
  T use<T>() => Provider.of(this).summon<T>();

  Future<T> putRoute<T>(Route<T> route) => Navigator.of(this).push(route);

  Future<T> display<T>(Widget widget) =>
      this.putRoute(MaterialPageRoute<T>(builder: (context) => widget));

  showSnackBar(String content, {Color backgroundColor}) {
    return Scaffold.of(this).showSnackBar(
      SnackBar(content: Text(content), backgroundColor: backgroundColor),
    );
  }

  Size get mediaQuerySize => MediaQuery.of(this).size;

  Orientation get orientation => MediaQuery.of(this).orientation;

  bool get isLandscape => orientation == Orientation.landscape;

  bool get isPortrait => orientation == Orientation.portrait;
}

extension SprinkleWidget on Widget {
  Widget padding(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  Widget center() => Center(child: this);
}
