part of sprinkle;

class Observer<T> extends StatelessWidget {
  const Observer({
    Key? key,
    required this.stream,
    required this.builder,
    this.onWaiting,
    this.onError,
  }) : super(key: key);

  final Stream<T> stream;

  final OnSuccessFunction<T> builder;
  final OnWaitingFunction? onWaiting;
  final OnErrorFunction? onError;

  Function get _defaultOnWaiting => (BuildContext context) {
        switch (context.platform) {
          case TargetPlatform.iOS:
          case TargetPlatform.macOS:
            return const Center(child: CupertinoActivityIndicator());
          case TargetPlatform.android:
            return const Center(child: CircularProgressIndicator());
          case TargetPlatform.fuchsia:
            return const Center(child: CircularProgressIndicator());
          case TargetPlatform.linux:
            return const Center(child: CircularProgressIndicator());
          case TargetPlatform.windows:
            return const Center(child: CircularProgressIndicator());
          default:
            return const Center(child: CircularProgressIndicator());
        }
      };

  Function get _defaultOnError => (context, error) => Text('[Sprinkle] $error');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      builder: (context, AsyncSnapshot<T> snapshot) {
        if (snapshot.hasError) {
          return (onError != null)
              ? onError!(context, snapshot.error!)
              : _defaultOnError(context, snapshot.error);
        } else {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return (onWaiting != null)
                  ? onWaiting!(context)
                  : _defaultOnWaiting(context);
            case ConnectionState.done:
              T data = snapshot.data!;
              return builder(context, data);
            default:
              return (onError != null)
                  ? onError!(context, snapshot.error!)
                  : _defaultOnError(context, snapshot.error);
          }
        }
      },
    );
  }
}
