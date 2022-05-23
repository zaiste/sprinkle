part of sprinkle;

typedef ManagerFormula = Manager Function();

typedef OnSuccessFunction<T> = Widget Function(BuildContext context, T data);

typedef OnErrorFunction = Widget Function(BuildContext context, Object error);

typedef OnWaitingFunction = Widget? Function(BuildContext context);
