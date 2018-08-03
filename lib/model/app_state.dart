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

  AppState({
    this.isAuthed = false,
    this.currentUser = null,
    this.users = const [],
  });

  AppState copyWith({
    bool isAuthed,
    User currentUser,
    List<User> users}) {
    return AppState(
        isAuthed: isAuthed ?? this.isAuthed,
        currentUser: currentUser ?? this.currentUser,
        users: users ?? this.users,
    );
  }

//  do i need to implement the hashcode, equality and toString methods?
// especially... how important is the equality method?

  @override
  String toString() {
    return 'AppState{isAuthed: $isAuthed, currentUser: $currentUser, users: $users}';
  }





}