import 'package:login/events.dart';
import 'package:login/model/app_state.dart';
import 'package:login/model/user.dart';
import 'package:redux/redux.dart';
import 'package:dio/dio.dart';
import 'package:redux_thunk/redux_thunk.dart';

// - do proper error handling (e.g. what to really show the user?)

// Future(null) being coerced to / treated as void

// Can we remake redux-thunk in a typesafe way?
// Where the compiler will tell us if we use it incorrectly.
attemptLoginEffect(String email, String password) {
  return (Store<AppState> store) async {
    const lieferyStagingUrl =
        "https://staging.liefery.com/api/client/v1/sessions";
    final credentials = {
      "user": {"email": "$email", "password": "$password"}
    };

    Dio dio = new Dio();
    await dio
        .post(lieferyStagingUrl, data: credentials)
        .then((response) => store.dispatch(AttemptLoginSucceeded(
            User(email, password), response.data["user"]["api_key"])))
        .catchError(
            (error) => store.dispatch(AttemptLoginFailed(error.toString())));
  };
}
