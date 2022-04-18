part of sprinkle;

abstract class SprinkleWidget<M extends Manager> extends StatelessWidget {
  const SprinkleWidget({Key? key}) : super(key: key);

  M get manager {
    final manager = Supervisor().summon<M>();
    if (Supervisor().isRegistered<M>() == false) {
      Supervisor().register<M>(() => manager);
    }
    return manager;
  }

  @override
  SprinklelessWidgetElement createElement() =>
      SprinklelessWidgetElement<M>(this);

  @override
  Widget build(BuildContext context);
}

class SprinklelessWidgetElement<M extends Manager> extends StatelessElement
    with SprinkleElementMixin<M>, WidgetsBindingObserver {
  SprinklelessWidgetElement(SprinkleWidget widget) : super(widget);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        widget.manager.resumed();
        break;
      case AppLifecycleState.inactive:
        widget.manager.inactive();
        break;
      case AppLifecycleState.paused:
        widget.manager.paused();
        break;
      case AppLifecycleState.detached:
        widget.manager.detached();
        break;
    }
  }
}

mixin SprinkleElementMixin<M extends Manager> on ComponentElement {
  @override
  SprinkleWidget get widget => super.widget as SprinkleWidget;

  @override
  void mount(Element? parent, Object? newSlot) {
    if (widget.manager._isInitialized) return;

    widget.manager.init();

    super.mount(parent, newSlot);
  }

  @override
  void unmount() {
    if (widget.manager._isClosed) return;

    Supervisor().release<M>();

    super.unmount();
  }

  @override
  void deactivate() {
    super.deactivate();
  }
}
