import 'package:flutter/widgets.dart';
import 'provider.dart';

extension SprinkleExtension<T> on BuildContext {
  T use<T>() => Provider.of(this).summon<T>();
}
