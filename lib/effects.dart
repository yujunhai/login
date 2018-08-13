import 'dart:convert';

import 'package:login/events.dart';
import 'package:login/model/app_state.dart';
import 'package:login/model/user.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

// dio handles json-data better than dart:http
import 'package:dio/dio.dart';

//typedef Effect = Store<AppState> ThunkAction<AppState>;

// In reframe, events and effects are distinguished by the registration fns.
// In redux-thunk, effects are distinguished from events by being functions
// with signature State->Void.

// So although events in flutter-redux can be classes with 'handler' methods,
// effects need to stay functions, where the body is the 'handler'.


attemptLoginEffect(String email, String password) {
  return (Store<AppState> store) async {

    const lieferyStagingUrl = "https://staging.liefery.com/api/client/v1/sessions";

    final authBody = {"user": {"email": "multistop@liefery.com", "password": "password"}};

    Dio dio = new Dio();
    await dio
        .post(lieferyStagingUrl, data: authBody)
        .then((response) {
          print("Response status: ${response.statusCode}");
          print("Response.toString: ${response.toString()}");

//          this should be something: "{user: {api_key: xyz}}"
//          transform into map?
//          var s = json.decode(response.data);

//        dio has already converted the response
//          var s = response.data;
          var sessionKey = response.data["user"]["api_key"];
          print("sessionKey is: $sessionKey");

    //      store.dispatch(Register(User(email, password)));
//          store.dispatch(Login(User(email, password)));}

          store.dispatch(Login(User(email, password), sessionKey));}

          )
//        .catchError(onError)
    ;
  };
}
