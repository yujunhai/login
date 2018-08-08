import 'package:meta/meta.dart';
import 'package:login/model/user.dart';

@immutable
class AppState {
  final bool isAuthed;
  final User currentUser;
  final List<User> users;
  final String authErrorMessage;

  AppState({
    this.isAuthed = false,
    this.currentUser,
    this.users = const [],
    this.authErrorMessage = "",
  });

//  GARBAGE!!!!! GARBAGE VERBOSITY
//  any time we add a new field to state, we have to add it here too -- twice!!!
  AppState copyWith(
          {bool isAuthed,
          User currentUser,
          List<User> users,
          String authErrorMessage}) =>
      AppState(
        isAuthed: isAuthed ?? this.isAuthed,
        currentUser: currentUser ?? this.currentUser,
        users: users ?? this.users,
        authErrorMessage: authErrorMessage ?? this.authErrorMessage,
      );

//  do i need to implement the hashcode, equality and toString methods?
// especially... how important is the equality method?
  @override
  String toString() {
    return 'AppState{isAuthed: $isAuthed, authErrorMessage: $authErrorMessage, currentUser: $currentUser, users: $users}';
  }
}
