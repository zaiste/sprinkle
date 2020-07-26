# sprinkle

> A convenient **Flutter architecture** for happy programmers

## Getting Started


## Overview

### State Management

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

