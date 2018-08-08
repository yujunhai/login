import 'package:flutter/material.dart';
import 'package:login/model/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:login/model/user.dart';
import 'package:login/model/app_state.dart';
import 'package:login/actions.dart';
import 'package:login/helpers.dart';

//TypedReducer

// one line fn definition vs. multiline def ?
AppState rootReducer(AppState state, dynamic action) => reducers(state, action);

final reducers = combineReducers<AppState>([
  TypedReducer<AppState, AddUser>(_addUser),
  TypedReducer<AppState, Register>(_register),
]);

// since the db check is still on the client,
// you don't need middleware (which is for async actions)
AppState _register(AppState state, Register action) {
  debugPrint("_register called");

  if (existsAlready(state.users, action.user)) {
    return state.copyWith(authErrorMessage: "Email already in use.");
  } else {
    return state.copyWith(
      currentUser: action.user,
      users: conj(state.users, action.user),
      authErrorMessage: "");
  }
}

AppState _addUser(AppState state, AddUser action) {
  debugPrint("_addUser called");
  var stateUsers = List<User>.from(state.users);
  const newBoy = User("newBoy@pain.com", "pw3");
  stateUsers.add(newBoy);
  return state.copyWith(users: stateUsers);
}

AppState _login(AppState state, Login action) {
  debugPrint("_login called");

  if (existsAlready(state.users, action.user)) {
    return state.copyWith(isAuthed: true, currentUser: action.user);
  } else {
    return state.copyWith(authErrorMessage: "Email not found.");
  }

}

bool existsAlready(users, user) => users.any((_) => _.email == user.email)

// Does this user already exist?
//bool existsAlready(users, user) {
//  return users.any((_) => _.email == user.email);
//}