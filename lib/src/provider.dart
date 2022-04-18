part of sprinkle;

class Provider<T extends Supervisor> extends InheritedWidget {
  final Supervisor data;

  Provider({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  static Supervisor of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<Provider>())!.data;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
