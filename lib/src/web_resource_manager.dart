import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'package:sprinkle/sprinkle.dart';

class WebResourceManager<T> implements Manager {
  final _filterSubject = PublishSubject<String>();
  final _countSubject = PublishSubject<int>();
  final _collectionSubject = PublishSubject<List<T>>();

  Sink<String> get inFilter => _filterSubject.sink;
  Stream<int> get count$ => _countSubject.stream;
  Stream<List<T>> get collection$ => _collectionSubject.stream;

  WebResourceManager(Service<T> service) {
    _filterSubject
        .debounceTime(Duration(milliseconds: 500))
        .switchMap((filter) async* {
      yield await service.browse(filter: filter);
    }).listen((elements) async {
      _collectionSubject.add(elements);
    });

    _collectionSubject.listen((elements) => _countSubject.add(elements.length));
  }

  @override
  void dispose() {
    _countSubject.close();
    _filterSubject.close();
    _collectionSubject.close();
  }
}
