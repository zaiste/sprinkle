typedef UseFunction = T Function<T>();

abstract class Manager {
  UseFunction use;
  void dispose();
}
