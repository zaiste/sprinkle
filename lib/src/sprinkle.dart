import 'package:flutter/material.dart';

import 'package:sprinkle/sprinkle.dart';

class Sprinkle extends StatelessWidget {
  final Widget? child;
  final Supervisor? supervisor;

  Sprinkle({this.child, this.supervisor});

  Widget build(BuildContext context) {
    return Provider(
      data: supervisor,
      child: child!,
    );
  }
}
