import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

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

extension SprinkleInt on int {
  BehaviorSubject<int> get reactive => BehaviorSubject<int>.seeded(this);
}

extension SprinkleString on String {
  BehaviorSubject<String> get reactive => BehaviorSubject<String>.seeded(this);
}

extension SprinkleDouble on double {
  BehaviorSubject<double> get reactive => BehaviorSubject<double>.seeded(this);
}

extension SprinkleBool on bool {
  BehaviorSubject<bool> get reactive => BehaviorSubject<bool>.seeded(this);
}

extension SprinkleList<T> on List<T> {
  BehaviorSubject<List<T>> get reactive =>
      BehaviorSubject<List<T>>.seeded(this);
}

extension SprinkleObject<T> on T {
  BehaviorSubject<T> get reactive => BehaviorSubject<T>.seeded(this);
}

extension SprinkleWidget on Widget {
  Widget padding(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  Widget center() => Center(child: this);
}
