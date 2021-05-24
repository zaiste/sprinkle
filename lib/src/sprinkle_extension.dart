import 'package:flutter/material.dart';

import 'provider.dart';

extension SprinkleExtension<T> on BuildContext {
  T use<T>() => Provider.of(this)!.summon<T>();

  Future<T?> putRoute<T>(Route<T>? route) => Navigator.of(this).push(route!);

  Future<T?> display<T>(Widget widget) => this.putRoute(MaterialPageRoute<T>(builder: (context) => widget));

  showSnackBar(String content, {Color? backgroundColor}) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(content), backgroundColor: backgroundColor),
    );
  }

  Size get mediaQuerySize => MediaQuery.of(this).size;

  TextTheme get textTheme => Theme.of(this).textTheme;

  Orientation get orientation => MediaQuery.of(this).orientation;

  bool get isLandscape => orientation == Orientation.landscape;

  bool get isPortrait => orientation == Orientation.portrait;
}

/// Add padding property to widget
extension SprinklePadding on Widget {
  Widget paddingAll(double padding) => Padding(padding: EdgeInsets.all(padding), child: this);

  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) => Padding(padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical), child: this);

  Widget paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(padding: EdgeInsets.only(top: top, left: left, right: right, bottom: bottom), child: this);

  Widget get paddingZero => Padding(padding: EdgeInsets.zero, child: this);

  Widget center() => Center(child: this);
}

/// Add margin property to widget
extension SprinkleMargin on Widget {
  Widget marginAll(double margin) => Container(margin: EdgeInsets.all(margin), child: this);

  Widget marginSymmetric({double horizontal = 0.0, double vertical = 0.0}) => Container(margin: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical), child: this);

  Widget marginOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Container(margin: EdgeInsets.only(top: top, left: left, right: right, bottom: bottom), child: this);

  Widget get marginZero => Container(margin: EdgeInsets.zero, child: this);
}
