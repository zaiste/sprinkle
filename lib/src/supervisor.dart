import 'manager.dart';

typedef ManagerFormula = Manager Function();

class Supervisor {
  Map<dynamic, Manager> store = {};
  Map<dynamic, ManagerFormula> formulas = {};

  Supervisor register<T extends Manager>(ManagerFormula formula) {
    formulas[T] = formula;
    return this;
  }

  _fetch<T>() => store[T] = formulas[T]();

  T summon<T>() => store.containsKey(T) ? store[T] : _fetch<T>();

  release<T>() {
    Manager manager = store[T];
    manager.dispose();
    store.remove(T);
  }
}
