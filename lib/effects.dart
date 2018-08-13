import 'package:login/events.dart';
import 'package:login/model/app_state.dart';
import 'package:login/model/user.dart';
import 'package:redux/redux.dart';
import 'package:dio/dio.dart';

// In reframe, events and effects are distinguished by the registration fns.
// In redux-thunk, effects are distinguished from events by being functions
// with signature State->Void.

// So although events in flutter-redux can be classes with 'handler' methods,
// effects need to stay functions, where the fn body is the 'handler'.

// Todo:
// - replace with native Flutter HTTP library,
// - do proper error handling (e.g. what to really show the user?)
attemptLoginEffect(String email, String password) {
  return (Store<AppState> store) async {

    const lieferyStagingUrl = "https://staging.liefery.com/api/client/v1/sessions";
    final credentials = {"user": {"email": "$email", "password": "$password"}};

    Dio dio = new Dio();
    await dio
        .post(lieferyStagingUrl, data: credentials)
        .then((response) =>
          store.dispatch(AttemptLoginSucceeded(
              User(email, password),
              response.data["user"]["api_key"])))
        .catchError((error) =>
          store.dispatch(AttemptLoginFailed(error.toString())));
  };
}
