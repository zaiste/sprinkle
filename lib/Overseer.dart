import 'Manager.dart';

class Overseer {
  Map<dynamic, Manager> repository = {};
  Map<dynamic, Function> _factories = {};

  Overseer(this._factories);

  _summon(name) => repository[name] = _factories[name]();

  T fetch<T>() => repository.containsKey(T) ? repository[T] : _summon(T);

  release(name) {
    Manager manager = repository[name];
    manager.dispose();
    repository.remove(name);
  }
}
