import 'package:flutter/foundation.dart';

typedef UseFunction = T Function<T>();

@immutable
abstract class Manager {
  void dispose();
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
