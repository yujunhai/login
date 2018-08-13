import 'package:flutter/material.dart';
import 'package:login/panel/login.dart';
import 'package:login/model/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:login/panel/tours.dart';
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
//        home: LoginPanel(),

//      from within the StoreProvider, do I have a reference to the Store?
        home: StoreConnector<AppState, Symbol>(
            converter: (store) =>
              store.state.currentPanel,
            builder: (context, currentPanel) {
              if (currentPanel == #auth) {
                debugPrint("current panel is auth");
                return LoginPanel();
              } else if (currentPanel == #tours) {
                debugPrint("current panel is tours");
                return ToursPanel();
              }
            },
      )
//        LoginPanel(),
      ));
}
