import 'package:flutter/material.dart';
import 'package:sprinkle/sprinkle.dart';

void main() {
  // Use the Sprinkle widget to split
  // the responsibilities and reduce the boilerplate
  final supervisor = Supervisor();
  supervisor.register<CounterManager>(() => CounterManager());

  runApp(
    Sprinkle(
      supervisor: supervisor,
      child: App(),
    ),
  );
}

class CounterManager extends Manager {
  // 1. we create a data store (it's just a stream underneath)
  // Managers are immutable, thus stores must be `final`
  final counter = 0.reactive;

  // 2. we define some actions
  void increment() => counter.value++;
  void decrement() => counter.value--;
  void add(int number) => counter.value += number;

  @override
  void dispose() {
    // Close the stream to release resources
    counter.close();
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sprinkle Exemple',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // Our widgets are *always* stateless
  @override
  Widget build(BuildContext context) {
    // 3. we include a manager with `use`
    var counterManager = context.use<CounterManager>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Sprinkle Exemple'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          // 4. we observe a part of widget tree
          Observer<int>(
            // 5. we listen to a specific stream from the manager
            stream: counterManager.counter,
            // 6. we rebuild once the stream changes
            builder: (_, data) {
              return Text(
                '$data',
                style: context.textTheme.headline4,
              );
            },
          ),
        ],
        // Sprinkle has some cool extension like center()
      ).center(),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            onPressed: counterManager.increment,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            onPressed: counterManager.decrement,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
