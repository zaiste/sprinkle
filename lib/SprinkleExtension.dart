import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Provider.dart';

extension SprinkleExtension<T> on BuildContext {
  T use<T>() => Provider.of(this).summon<T>();

  display(Widget widget) async {
    await Navigator.of(this).push(
      MaterialPageRoute(builder: (_) => widget),
    );
  }
}

}
