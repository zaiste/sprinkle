part of sprinkle;

extension SprinkleExtension<M extends Manager> on BuildContext {
  M use<M extends Manager>() => Provider.of(this).summon<M>();

  Future<T?> putRoute<T>(Route<T> route) => Navigator.of(this).push(route);

  TargetPlatform get platform => Theme.of(this).platform;

  Future<T?> display<T>(Widget widget) =>
      this.putRoute(MaterialPageRoute<T>(builder: (context) => widget));

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
          String content,
          {Color backgroundColor = Colors.redAccent}) =>
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(content: Text(content), backgroundColor: backgroundColor),
      );

  Size get mediaQuerySize => MediaQuery.of(this).size;

  Orientation get orientation => MediaQuery.of(this).orientation;

  bool get isLandscape => orientation == Orientation.landscape;

  bool get isPortrait => orientation == Orientation.portrait;
}

extension WidgetExtension on Widget {
  Widget padding(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  Widget center() => Center(child: this);
}
