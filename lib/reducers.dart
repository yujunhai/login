
import 'package:login/model/app_state.dart';
import 'package:redux/redux.dart';
import 'package:login/actions.dart';
import 'package:login/helpers.dart';
import 'package:collection/collection.dart';

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

// You also need to check that passwords match.
// In reality, this will be handled on a server, not the client.
AppState _login(AppState state, Login action) {

//  var passwordCorrect =
//    state.users.any((_) => (_.email == action.user.email && _.password == action.user.password));

  print("[existsAlready(state.users, action.user), passwordCorrect(state.users, action.user)]: ${[existsAlready(state.users, action.user), passwordCorrect(state.users, action.user)]}");
// ^^^ this is evaluating to [true, true] ... yet I'm hitting the default ...
//  What is allowed in a switch/case statement?

// Ah, the issue (seen per Dartpad) is rather that lists do not have == automatically.
//  Are you fucking kidding me?

//  ... You can import ListEquality.equals fn,
//  but the == is actually happening deeper down within switch/case... Yikes.

//  Alternatively you might try a map-based implementation of pattern matching?
//  What is the "equality" check for a key in a map?

//  You could also implement your own subclass of Map called 'Match',
//  that does a smarter equality check on keys?

  switch ([existsAlready(state.users, action.user), passwordCorrect(state.users, action.user)]) {
    case [true, true]:
      return state.copyWith(isAuthed: true, currentUser: action.user, authErrorMessage: "");
    case [true, false]:
      return state.copyWith(authErrorMessage: "Password incorrect.");
    default:
      // i.e. user does not already exist (in which case we don't care about pw)
      return state.copyWith(authErrorMessage: "Email not found.");
//      is there a way to wild card here?
//    case [false, true]:
//      return state.copyWith(authErrorMessage: "Email not found.");
//    case [false, false]:
//      return state.copyWith(authErrorMessage: "Email not found.");
  }

}


//    existsAlready(state.users, action.user)
//        ? state.copyWith(
//            isAuthed: true, currentUser: action.user, authErrorMessage: "")
//        : state.copyWith(authErrorMessage: "Email not found.");