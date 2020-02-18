import 'package:sprinkle/Manager.dart';
import 'package:sprinkle/AuthManager.dart';

class LoginManager extends Manager {

  void login() {
    dispatch<AuthManager>().setAuthState(AuthState.loggedIn);
  }


  @override
  void dispose() {
  }
}