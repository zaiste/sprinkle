import 'manager.dart';

typedef ManagerFormula = Manager Function();

class Supervisor {
  Map<dynamic, Manager> _store = {};
  Map<dynamic, ManagerFormula> _formulas = {};

  Supervisor register<T extends Manager>(ManagerFormula formula) {
    _formulas[T] = formula;
    return this;
  }

  _fetch(name) {
    var manager = _formulas[name]();
    manager.use = <T>() => summon<T>();

    _store[name] = manager;

    return manager;
  }

  T summon<T>() => _store.containsKey(T) ? _store[T] : _fetch(T);

  release(name) {
    Manager manager = _store[name];
    manager.dispose();
    _store.remove(name);
  }
}
