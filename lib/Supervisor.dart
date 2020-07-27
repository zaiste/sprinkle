import 'Manager.dart';

typedef ManagerFormula = Manager Function();

class Supervisor {
  Map<dynamic, Manager> store = {};
  Map<dynamic, ManagerFormula> formulas = {};

  Supervisor register<T extends Manager>(ManagerFormula formula) {
    formulas[T] = formula;
    return this;
  }

  _fetch(name) => store[name] = formulas[name]();
  T summon<T>() => store.containsKey(T) ? store[T] : _fetch(T);

  release(name) {
    Manager manager = store[name];
    manager.dispose();
    store.remove(name);
  }
}
