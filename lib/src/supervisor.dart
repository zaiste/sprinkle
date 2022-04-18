part of sprinkle;

class Supervisor {
  factory Supervisor() => _instance ??= const Supervisor._();

  const Supervisor._();

  static Supervisor? _instance;

  static final store = <dynamic, Manager>{};

  static Map<dynamic, ManagerFormula> formulas = {};

  bool isRegistered<T>() => formulas.containsKey(T);

  Supervisor register<T extends Manager>(ManagerFormula formula) {
    formulas[T] = formula;
    return this;
  }

  _fetch<T extends Manager>() {
    if (formulas.containsKey(T)) {
      return store[T] = formulas[T]!();
    } else {
      throw Exception(
          '[Sprinkle:] Supervisor not contain Manager $T please register $T');
    }
  }

  T summon<T extends Manager>() =>
      store.containsKey(T) ? store[T] : _fetch<T>();

  release<T extends Manager>() {
    Manager manager = store[T]!;
    manager._onClose();
    store.remove(T);
  }
}
