import 'package:rxdart/subjects.dart';
import 'package:sprinkle/Manager.dart';

enum AuthState {
  loggedIn,
  notLoggedIn,
  syncing
}

class AuthManager extends Manager {

  BehaviorSubject<AuthState> _authStateSubject = BehaviorSubject();

  Stream<AuthState> get authState$ => _authStateSubject.stream;

  void setAuthState(AuthState state) {
    _authStateSubject.add(state);
  }

  @override
  void dispose() {
    _authStateSubject.close();
  }

}