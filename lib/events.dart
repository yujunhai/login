import 'package:login/model/user.dart';
import 'package:login/model/app_state.dart';
import 'package:login/helpers.dart';

bool existsAlready(users, user) => users.any((_) => _.email == user.email);

bool passwordCorrect(users, user) =>
    existsAlready(users, user) && users.any((_) => _.password == user.password);

// alternatively, could you make a L

// actually log the user in
class Login {
  final User user;
  final String sessionKey; // make a type for sessionKey?
  Login(this.user, this.sessionKey);

  static AppState handler(AppState state, Login action) =>
    state.copyWith(
        isAuthed: true, currentUser: action.user, authErrorMessage: "",
        currentPanel: #tours, sessionKey: action.sessionKey);
}


class Register {
  final User user;
  Register(this.user);

  static AppState handler(AppState state, Register action) => // {
    existsAlready(state.users, action.user)
      ? state.copyWith(authErrorMessage: "Email already in use.")
      : state.copyWith(
      currentUser: action.user,
      users: conj(state.users, action.user),
      authErrorMessage: "");
}


// now, this should be called by Login...

// in flutter redux, how can one event trigger another event?

// https://github.com/reduxjs/redux/issues/911#issuecomment-149361073
// redux js discussing "batching actions"

// you want the events to be triggered in a specific order, right?
// maybe, maybe not?


// in reframe you would dispatch an additional event in the original event's event-handler;
// but in redux you can't do that because you don't have a reference to the store;

// so perhaps this needs to be an Effect instead?
// but that's conflating the "side-effectful" part of Effect
// with "multiple Events happening" (which is not side-effectful)

// another solution is just to re-use separate functions in a single Event handler;
// e.g. (goTo-fn panel) is called by GoTo-event's handler
// and (goTo-fn #tours) is called by Login-event's handler

// on this approach, you could have each function call state.copyWith,
// or contribute to a map we'll provide to a single state.copyWith call...

class GoTo {
  final Symbol panel;

  GoTo(this.panel);

  static AppState handler(AppState state, GoTo action) =>
      state.copyWith(currentPanel: action.panel);
}
