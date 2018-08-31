import 'package:login/model/app_state.dart';
import 'package:redux/redux.dart';
import 'package:login/events.dart';

AppState rootReducer(AppState state, dynamic action) => reducers(state, action);

// If you were to keep a given action handler in the reducer,
// then the logic is still contained within the caller-of-that-logic.

//reducer(action) => action.handler(store)

final reducers = combineReducers<AppState>([
  TypedReducer<AppState, Register>(Register.handler),
  TypedReducer<AppState, AttemptLoginSucceeded>(AttemptLoginSucceeded.handler),
  TypedReducer<AppState, AttemptLoginFailed>(AttemptLoginFailed.handler)
]);
