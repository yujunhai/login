import 'package:flutter/material.dart';
import 'package:login/model/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:login/model/user.dart';
import 'package:login/model/app_state.dart';

enum Actions { Increment, AddUser }

AppState rootReducer(AppState state, dynamic action) {

  const newBoy = User("newBoy@pain.com", "pw3");

  if (action == Actions.Increment) {
    debugPrint("rootReducer: Action is increment");
    return state;
  }
  if (action == Actions.AddUser) {

    var stateUsers = List<User>.from(state.users);
  debugPrint("stateUsers was: $stateUsers");
  stateUsers.add(newBoy);
  debugPrint("stateUsers is now: $stateUsers");
  return state.copyWith(users: stateUsers);
  return state.copyWith(
  users: List.from(state.users)..add(newBoy));
  }
  debugPrint("rootReducer: Action, no match");
  return state;
}