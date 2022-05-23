part of sprinkle;

class _LifeCycle {
  _LifeCycle(this.initialized, this.isClosed);

  bool initialized = false;
  bool isClosed = false;

  factory _LifeCycle.init() => _LifeCycle(false, false);
}

@immutable
abstract class Manager {
  final _lifeCycle = _LifeCycle.init();

  M use<M extends Manager>() {
    final manager = Supervisor().summon<M>();

    if (Supervisor().isRegistered<M>() == false) {
      Supervisor().register<M>(() => manager);
    }
    return manager;
  }

  bool get _isClosed => _lifeCycle.isClosed;
  bool get _isInitialized => _lifeCycle.initialized;

  @protected
  @mustCallSuper
  void init() {
    _lifeCycle.initialized = true;
  }

  @protected
  @nonVirtual
  @mustCallSuper
  void _onClose() {
    _lifeCycle.isClosed = true;
    dispose();
  }

  @protected
  void dispose();

//AppLifecycleState
  @protected
  void resumed() {}

  @protected
  void inactive() {}

  @protected
  void paused() {}

  @protected
  void detached() {}
}
