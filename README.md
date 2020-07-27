# sprinkle

> A convenient **Flutter architecture** for happy programmers

## Getting Started


## Overview

### State Management

#### Reactive

```dart
class CounterManager extends Manager {
  // 1. we create a data store (it's just a stream underneath)
  var counter = 0.reactive

  // 2. we define some effects
  void increment() => counter.value++;
  void decrement() => counter.value--;
  void add(int number) => counter.value += number;
}

// Somewhere in the widget tree inside the `build` method

class Counter extends StatelessWidget { // Our widgets are *always* stateless
  @override
  Widget build(BuildContext context) {
    // 3. we include a manager with `use`
    var manager = context.use<CounterManager>();

    return Center(
      // 4. we observe a part of widget tree
      child: Observer<int>(
        // 5. we listen to a specific stream from the manager
        stream: manager.counter.stream,
        // 6. we rebuild once the stream changes
        builder: (context, value) => Text("Calendar: $value"),
      ),
    );
  }
}

```

#### Manager asks another Manager for help

In this example `LoginManager` asks for `AuthManager`. This goes through `Supervisor` and the requested manager is either provided as-is or instantiated.

```dart
class LoginManager extends Manager {

   void logout() {
     var manager = use<AuthManager>()

     manager.setAuthState(AuthState.loggedOut);
   }


   @override
   void dispose() {}
 }
```

