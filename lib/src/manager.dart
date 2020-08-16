import 'package:flutter/foundation.dart';

typedef UseFunction = T Function<T>();

@immutable
abstract class Manager {
  void dispose();
}
