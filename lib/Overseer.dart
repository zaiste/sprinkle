import 'Manager.dart';

typedef ManagerFactory = Manager Function();


class Overseer {
  Map<dynamic, Manager> repository = {};
  Map<dynamic, ManagerFactory> _factories = {};

  Overseer register<T extends Manager>(ManagerFactory _factory) {
    _factories[T] = _factory;
    return this;
  }

  _summon(name) {
    var manager =  _factories[name]();
    manager.dispatch = <T>() => fetch<T>();
    repository[name] = manager;
    return manager;
  }

  T fetch<T>() => repository.containsKey(T) ? repository[T] : _summon(T);

  release(name) {
    Manager manager = repository[name];
    manager.dispose();
    repository.remove(name);
  }
}