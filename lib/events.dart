import 'package:login/model/user.dart';
import 'package:login/model/app_state.dart';
import 'package:login/helpers.dart';

bool existsAlready(users, user) => users.any((_) => _.email == user.email);

bool passwordCorrect(users, user) =>
    existsAlready(users, user) && users.any((_) => _.password == user.password);


class AttemptLoginSucceeded {
  final User user;
  final String sessionKey; // make a type for sessionKey?
  AttemptLoginSucceeded(this.user, this.sessionKey);

  static AppState handler(AppState state, AttemptLoginSucceeded action) =>
      state.copyWith(
        isAuthed: true,
        currentUser: action.user,
        authErrorMessage: "",
        currentPanel: #home,
        sessionKey: action.sessionKey);
}

class AttemptLoginFailed {
  final String error;
  AttemptLoginFailed(this.error);

  static AppState handler(AppState state, AttemptLoginFailed action) =>
      state.copyWith(
          authErrorMessage: "Sadly, the login attempt failed: ${action.error}");
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

