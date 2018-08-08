import 'package:flutter/material.dart';
import 'package:login/panel/login.dart';
import 'package:login/model/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:login/model/user.dart';
import 'package:login/reducers.dart';

class App extends StatelessWidget {

  static const sampleUser = User("a", "b");

  final store = Store<AppState>(
    rootReducer,
    initialState: new AppState(users: [sampleUser]),
//      initialState: new AppState(users: [User("a", "b")])
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: "Redux App Title",
        theme: ThemeData.light(),
        home: LoginPanel(),
      )
    );
  }

}

