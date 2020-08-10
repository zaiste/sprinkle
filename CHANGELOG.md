## [0.0.5] - 2020-08-10

* Make `Manager` immutable
* Simplify `WebResourceManager` 
* Add reactivity to custom objects

## [0.0.4] - 2020-08-04

* Add `.padding()` Widget extension
* Add `.center()` Widget extension
* Rename `onSuccess:` -> `builder:` in `Observer`
* Add reactivity to `bool`
* Add reactivity to `List`
* Add `Sprinkle` top-level Widget

## [0.0.3] - 2020-07-27

* Rename `Overseer` -> `Supervisor`
* Rename `fetch` -> `use` for fetching managers into the widget tree
* Improve `Supervisor` implementation
* Add `display` convenience method on `BuildContext` for displaying routes
* Add `reactive` method for creating reactive, stream-based data stores in managers
* Add `showSnackBar` convenience method on `BuildContext` for showing snackbars

## [0.0.2] - 2020-01-31

* Manager abstraction `WebResourceManager` for interacting with web resources
* Chainable manager registration

## [0.0.1] - 2020-01-27

* Add `Observer` wrapper
* Add `Provider` class
* Add `Overseer`
* Add a shortcut for accessing the `Provider` data with extension methods with `SprinkleExtension`
* Add `Manager` interface as an abstract class
