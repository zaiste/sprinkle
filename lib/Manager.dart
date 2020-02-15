typedef DispatchFunction = T Function<T>();

abstract class Manager {
  DispatchFunction dispatch;

  void dispose();
}