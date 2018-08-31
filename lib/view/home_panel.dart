import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:login/model/app_state.dart';
import 'package:redux/redux.dart';

// Currently actually just displaying sessionKey.

// Connecting a component vs. component receiving data from parent


// dumb-view; pure; just a function of its argument
displayText(String text) => Text(text);


// Alternatively: pass sessionKey into HomePanel
class HomePanel extends StatelessWidget {
  @override
  build(BuildContext context) =>
      Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        StoreConnector<AppState, String>(
          converter: (Store<AppState> store) => store.state.sessionKey,
          builder: (context, sessionKey) => displayText(sessionKey) // Text("sessionKey:\n $sessionKey"),
        )
      ]);
}
