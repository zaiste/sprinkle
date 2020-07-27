# sprinkle

> A convenient **Flutter architecture** for happy programmers

## Getting Started


## Overview

### State Management

Sprinkle is based on streams. Streams are one of the core mechanics in Dart and in Flutter. Whether you are interacting with your database (e.g. Firebase) or trying to control the order and timing of requests sent to an API, streams are the most natural solution for these scenerios - we could say that streams are **idiomatic** in Flutter.

Why don't we use streams everywhere for simplicity and coherence then?! Streams are considered *difficult*, but that reputation couldn't be further from the truth. Once you undestand the benefits, there is no coming back to traditional state management approaches. And Sprinkle simplifies stream complexities - it's an easy to understand and coherent solution for state management in Flutter.

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

