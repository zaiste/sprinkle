part of sprinkle;

class Sprinkle extends StatelessWidget {
  final Widget child;
  final Supervisor supervisor;

  Sprinkle({required this.child, required this.supervisor});

  Widget build(BuildContext context) {
    return Provider(
      data: supervisor,
      child: child,
    );
  }
}
