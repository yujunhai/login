import 'package:login/model/app_state.dart';
import 'package:redux/redux.dart';
import 'package:login/events.dart';

AppState rootReducer(AppState state, dynamic action) => reducers(state, action);

final reducers = combineReducers<AppState>([
  TypedReducer<AppState, Register>(Register.handler),
  TypedReducer<AppState, AttemptLoginSucceeded>(AttemptLoginSucceeded.handler),
  TypedReducer<AppState, AttemptLoginFailed>(AttemptLoginFailed.handler)
]);