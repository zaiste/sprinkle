import 'package:flutter/widgets.dart';

import 'Provider.dart';

extension SprinkleExtension<T> on BuildContext {
  T fetch<T>() => Provider.of(this).fetch<T>();
}
