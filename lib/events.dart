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
  Login(this.user);

  static AppState handler(AppState state, Login action) =>
    state.copyWith(isAuthed: true, currentUser: action.user, authErrorMessage: "");
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

