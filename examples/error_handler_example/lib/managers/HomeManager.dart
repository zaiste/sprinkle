import 'dart:async';

import 'package:rxdart/subjects.dart';
import 'package:sprinkle/ErrorHandler.dart';
import 'package:sprinkle/Manager.dart';
import 'package:sprinkle/AuthManager.dart';

class HomeManager extends Manager with ErrorHandler {

  PublishSubject<String> _dataSubject = PublishSubject();

  Stream<String> get data$ => _dataSubject.stream.transform(httpErrorHandler<String>()); 

  void logout() {
    dispatch<AuthManager>().setAuthState(AuthState.notLoggedIn);
  }

  void browse() {
    Future.delayed(Duration(seconds: 3))
    .then((_) {
      _dataSubject.addError('Oh Shot! Forbidden Error Occurred');
    });
  }

  @override
  void dispose() {
    _dataSubject.close();
  }

  @override
  void handleError(Object object, StackTrace stackTrace, EventSink sink) {
    // TODO: implement handleError
  }
}