// Effects are for async and/or side-effectful events (actions).

// All must be functions that take a single param, the Store.

import 'package:login/actions.dart';
import 'package:login/model/app_state.dart';
import 'package:login/model/user.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

// dio handles json-data better than dart:http
import 'package:dio/dio.dart';

ThunkAction<AppState> httpEffect = (Store<AppState> store) async {

  const lieferyStagingUrl = "https://staging.liefery.com/api/client/v1/sessions";
  final authBody = {"user": {"email": "multistop@liefery.com", "password": "password"}};

  Dio dio = new Dio();
  await dio.post(lieferyStagingUrl, data: authBody).then((response) {
    print("Response status: ${response.statusCode}");
    print("Response.toString: ${response.toString()}");
    store.dispatch(Register(User("Dio", "is from Flutter China")));
  });
};