// Effects are for async and/or side-effectful events (actions).

// All must be functions that take a single param, the Store.

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
    //      store.dispatch(Register(User(email, password)));
          store.dispatch(Login(User(email, password)));}
          )
//        .catchError(onError)
    ;
  };
}




//ThunkAction<AppState> attemptLoginEffect = (Store<AppState> store) async {
//ThunkAction<AppState> attemptLoginEffect = (Store<AppState> store) async {
//
//  const lieferyStagingUrl = "https://staging.liefery.com/api/client/v1/sessions";
//  final authBody = {"user": {"email": "multistop@liefery.com", "password": "password"}};
//
//  Dio dio = new Dio();
//  await dio.post(lieferyStagingUrl, data: authBody).then((response) {
//    print("Response status: ${response.statusCode}");
//    print("Response.toString: ${response.toString()}");
//    store.dispatch(Register(User("Dio", "is from Flutter China")));
//  });
//};