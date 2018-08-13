import 'package:flutter/material.dart';
import 'package:login/view/login_panel.dart';
import 'package:login/model/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:login/view/home_panel.dart';
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

  // Better?: panels as an enum, so we can be warned on non-exhaustive matching.
  // We would like so type safety (compile-time safety) around this mapping...
  final panels = {
    #auth: () => LoginPanel(),
    #home: () => HomePanel(),
  };

  @override
  Widget build(BuildContext context) => StoreProvider(
      store: store,
      child: MaterialApp(
        title: "Prototype",
        theme: ThemeData.light(),
        home: Scaffold(
          body: Padding(
            padding: new EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  currentPanel(),
                  debugState(),
                ],
              ),
            )
          ),
        )
      )
  );

  // This is effectively our router.
  currentPanel() => StoreConnector<AppState, Symbol>(
    converter: (store) => store.state.currentPanel,
    builder: (context, currentPanel) => panels[currentPanel]()
  );

  // To be replaced by actual Flutter Redux Devtools.
  debugState() => StoreConnector<AppState, String>(
    converter: (store) => store.state.toString(),
    builder: (context, state) => Text("\n\nCURRENT APP STATE:\n $state"),
  );
}
