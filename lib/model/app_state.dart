import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:meta/meta.dart';
import 'package:login/model/user.dart';

// copied from here: https://github.com/brianegan/flutter_architecture_samples/blob/master/example/redux/lib/models/app_state.dart

@immutable
class AppState {

  final bool isAuthed;
  final User currentUser;
  final List<User> users;

  final String authErrorMessage;

  AppState({
    this.isAuthed = false,
    this.currentUser = null,
    this.users = const [],
    this.authErrorMessage = "No error yet...",
  });

//  GARBAGE!!!!! GARBAGE VERBOSITY
  AppState copyWith({
    bool isAuthed,
    User currentUser,
    List<User> users,
    String authErrorMessage,
  }) {
    return AppState(
        isAuthed: isAuthed ?? this.isAuthed,
        currentUser: currentUser ?? this.currentUser,
        users: users ?? this.users,
        authErrorMessage: authErrorMessage ?? this.authErrorMessage,
    );
  }

//  do i need to implement the hashcode, equality and toString methods?
// especially... how important is the equality method?


  @override
  String toString() {
    return 'AppState{isAuthed: $isAuthed, authErrorMessage: $authErrorMessage, currentUser: $currentUser, users: $users}';
  }





}