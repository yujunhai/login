import 'package:meta/meta.dart';
import 'package:login/model/user.dart';

@immutable
class AppState {

//  N: dividing up would provide clarity when app gets big;
// the relationship between isAuthed and currentUser should be captured in TYPES,
// so that compiler can catch invalid states.

  final bool isAuthed;
  final User currentUser;
  final List<User> users;
  final String authErrorMessage;
  final String sessionKey;
  final Symbol currentPanel;

  AppState({
    this.isAuthed = false,
    this.currentUser,
    this.users = const [],
    this.authErrorMessage = "",
    this.sessionKey = "",
    this.currentPanel = #auth,
  });

  // verbose garbage...
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

  // use built_value for this functionality instead (for == etc. too)
  @override
  String toString() {
    return 'AppState{currentPanel: $currentPanel, isAuthed: $isAuthed, authErrorMessage: $authErrorMessage, sessionKey: $sessionKey, currentUser: $currentUser, users: $users}';
  }
}
