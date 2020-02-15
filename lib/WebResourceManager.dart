import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:sprinkle/Manager.dart';
import 'package:sprinkle/Service.dart';

class WebResourceManager<T> implements Manager {
  final PublishSubject<String> _filterSubject = PublishSubject<String>();
  final PublishSubject<int> _countSubject = PublishSubject<int>();
  final PublishSubject<List<T>> _collectionSubject = PublishSubject();

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

  @override
  T Function<T>() dispatch;

}
