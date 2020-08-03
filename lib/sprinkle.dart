library sprinkle;

export 'SprinkleExtension.dart';

import 'package:flutter/material.dart';

import 'Provider.dart';
import 'Supervisor.dart';

class Sprinkle extends StatelessWidget {
  final Widget child;
  final Supervisor supervisor;

  Sprinkle({this.child, this.supervisor});

  Widget build(BuildContext context) {
    return Provider(
      data: supervisor,
      child: child,
    );
  }
}

