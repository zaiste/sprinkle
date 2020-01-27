import 'package:flutter/widgets.dart';
import 'package:sprinkle/Provider.dart';

extension SprinkleExtension<T> on BuildContext {
  T fetch<T>() => Provider.of(this).fetch<T>();
}
