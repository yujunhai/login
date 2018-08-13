import 'package:meta/meta.dart';
import 'package:login/model/user.dart';

@immutable
class AppState {
  final bool isAuthed;
  final User currentUser;
  final List<User> users;
  final String authErrorMessage;
  final String sessionKey;
  final Symbol currentPanel;

//  also do a set of Symbols? do an enum?

  AppState({
    this.isAuthed = false,
    this.currentUser,
    this.users = const [],
    this.authErrorMessage = "",
    this.sessionKey = "",
    this.currentPanel = #auth,
  });

//  GARBAGE!!!!! GARBAGE VERBOSITY
//  any time we add a new field to state, we have to add it here too -- twice!!!
  AppState copyWith(
          {bool isAuthed,
          User currentUser,
          List<User> users,
          String authErrorMessage,
          String sessionKey,
          Symbol currentPanel}) =>
      AppState(
        isAuthed: isAuthed ?? this.isAuthed,
        currentUser: currentUser ?? this.currentUser,
        users: users ?? this.users,
        authErrorMessage: authErrorMessage ?? this.authErrorMessage,
        sessionKey: sessionKey ?? this.sessionKey,
        currentPanel: currentPanel ?? this.currentPanel,
      );

//  do i need to implement the hashcode, equality and toString methods?
// especially... how important is the equality method?

//  can probably implement this recursively?
//  or use built_value?
  @override
  String toString() {
    return 'AppState{currentPanel: $currentPanel, isAuthed: $isAuthed, authErrorMessage: $authErrorMessage, sessionKey: $sessionKey, currentUser: $currentUser, users: $users}';
  }
}
