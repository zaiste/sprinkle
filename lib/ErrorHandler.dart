import 'dart:async';

import 'package:sprinkle/AuthManager.dart';

// For make to getAuthManager is optional
abstract class AuthInterface {
  AuthManager getAuthManager();
}

mixin ErrorHandler implements AuthInterface {

  void handleError(Object object, StackTrace stackTrace, EventSink sink);


  StreamTransformer<T, T> errorHandler<T>() => StreamTransformer<T, T>.fromHandlers(
    handleError: (object, stackTrace, sink) {
      this.handleError(object, stackTrace, sink);
    }
  );

  // This is just for idea
  StreamTransformer<T, T> httpErrorHandler<T>() => StreamTransformer<T, T>.fromHandlers(
    handleError: (object, stackTrace, sink) {
      
      var statusCode = 403; //Suppose it parsed and get from object

      //if status forbidden resource
      if(statusCode == 403) {
        this.getAuthManager().setAuthState(AuthState.notLoggedIn);
      }

    }
  );

}