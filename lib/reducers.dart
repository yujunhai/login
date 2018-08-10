import 'package:login/model/app_state.dart';
import 'package:redux/redux.dart';
import 'package:login/actions.dart';
import 'package:login/helpers.dart';

AppState rootReducer(AppState state, dynamic action) => reducers(state, action);

final reducers = combineReducers<AppState>([
  TypedReducer<AppState, Register>(_register),
  TypedReducer<AppState, Login>(_login)
]);

bool existsAlready(users, user) => users.any((_) => _.email == user.email);

bool passwordCorrect(users, user) =>
    existsAlready(users, user) && users.any((_) => _.password == user.password);

AppState _register(AppState state, Register action) => // {
    existsAlready(state.users, action.user)
        ? state.copyWith(authErrorMessage: "Email already in use.")
        : state.copyWith(
            currentUser: action.user,
            users: conj(state.users, action.user),
            authErrorMessage: "");

// In reality, password check will be handled on server, not client.
AppState _login(AppState state, Login action) => //{

  //  Example of attempting 'pattern matching' using a map.
  //  (This particular case would be better using ifs because two cases have same outcome)

  // Problems with this approach:
  // - still verbose e.g. wrapping in Tuple, wrapping in anon fn
  // - no wild card matching
  // - normal "match (x, y) with ...cases" is inverted here to: "of ...cases, get (x,y)"

  // You could instead implement a special Match class, that has smarter key lookup,
  // defaults and wildcard matches; maybe accepts an Enum and can warn when non exhaustive?
  {
    Tuple(true, true): () => state.copyWith(isAuthed: true, currentUser: action.user, authErrorMessage: ""),
    Tuple(false, true): () => state.copyWith(authErrorMessage: "Email not found."),
    Tuple(true, false): () => state.copyWith(authErrorMessage: "Password incorrect."),
    Tuple(false, false): () => state.copyWith(authErrorMessage: "Password incorrect."),
  }[Tuple(existsAlready(state.users, action.user),
          passwordCorrect(state.users, action.user))]();