import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

import 'Provider.dart';

extension SprinkleExtension<T> on BuildContext {
  T use<T>() => Provider.of(this).summon<T>();

  display(Widget widget) async {
    await Navigator.of(this).push(
      MaterialPageRoute(builder: (_) => widget),
    );
  }

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
