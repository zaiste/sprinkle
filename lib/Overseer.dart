import 'Manager.dart';

class Overseer {
  Map<dynamic, Manager> repository = {};
  Map<dynamic, Function> _factories = {};

  Overseer register<T>(_factory) {
    _factories[T] = _factory;
    return this;
  }

  _summon(name) => repository[name] = _factories[name]();

  T fetch<T>() => repository.containsKey(T) ? repository[T] : _summon(T);

  release(name) {
    Manager manager = repository[name];
    manager.dispose();
    repository.remove(name);
  }
}
