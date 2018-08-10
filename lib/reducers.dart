import 'package:login/model/app_state.dart';
import 'package:redux/redux.dart';
import 'package:login/events.dart';
import 'package:login/helpers.dart';

// could you e.g. make an Action's class have its handler
// (an fn that takes State and the Action itself, and returns new State)
// as a static method?

// then just provide the static method as the fn in
//    TypedReducer<AppState, MyAction>(_fn-to-handle-MyAction-instance)


AppState rootReducer(AppState state, dynamic action) => reducers(state, action);

final reducers = combineReducers<AppState>([
  TypedReducer<AppState, Register>(Register.handler),
//  TypedReducer<AppState, Login>(_login)
  TypedReducer<AppState, Login>(Login.handler)
]);

//bool existsAlready(users, user) => users.any((_) => _.email == user.email);
//
//bool passwordCorrect(users, user) =>
//    existsAlready(users, user) && users.any((_) => _.password == user.password);
//
//AppState _register(AppState state, Register action) => // {
//    existsAlready(state.users, action.user)
//        ? state.copyWith(authErrorMessage: "Email already in use.")
//        : state.copyWith(
//            currentUser: action.user,
//            users: conj(state.users, action.user),
//            authErrorMessage: "");

// Now that you're actually checking against the real staging db,
// you don't want to do any validation --
// you just want to handle the success (ie log them in)
// or the error (ie show the error to the user via authErrorMessage)



// In reality, password check will be handled on server, not client.
//AppState _login(AppState state, Login action) => //{
//
//  state.copyWith(isAuthed: true, currentUser: action.user, authErrorMessage: "");

  //  Example of attempting 'pattern matching' using a map.
  //  (This particular case would be better using ifs because two cases have same outcome)

  // Problems with this approach:
  // - still verbose e.g. wrapping in Tuple, wrapping in anon fn
  // - no wild card matching
  // - normal "match (x, y) with ...cases" is inverted here to: "of ...cases, get (x,y)"

  // You could instead implement a special Match class, that has smarter key lookup,
  // defaults and wildcard matches; maybe accepts an Enum and can warn when non exhaustive?
//  {
//    Tuple(true, true): () => state.copyWith(isAuthed: true, currentUser: action.user, authErrorMessage: ""),
//    Tuple(false, true): () => state.copyWith(authErrorMessage: "Email not found."),
//    Tuple(true, false): () => state.copyWith(authErrorMessage: "Email found but password incorrect."),
//    Tuple(false, false): () => state.copyWith(authErrorMessage: "Email not found and password incorrect."),
//  }[Tuple(existsAlready(state.users, action.user),
//          passwordCorrect(state.users, action.user))]();