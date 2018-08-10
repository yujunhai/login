import 'package:flutter/material.dart';
import 'package:login/panel/login.dart';
import 'package:login/model/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:login/model/user.dart';
import 'package:login/reducers.dart';
import 'package:redux_thunk/redux_thunk.dart';

class App extends StatelessWidget {
  final store = Store<AppState>(
    rootReducer,
    initialState: new AppState(users: [User("a", "b")]),
    middleware: [thunkMiddleware],
  );

  @override
  Widget build(BuildContext context) => StoreProvider(
      store: store,
      child: MaterialApp(
        title: "Prototype",
        theme: ThemeData.light(),
        home: LoginPanel(),
      ));
}
