import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:login/model/app_state.dart';
import 'package:redux/redux.dart';

// Currently actually just displaying sessionKey.
class HomePanel extends StatelessWidget {
  @override
  build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      StoreConnector<AppState, String>(
        converter: (Store<AppState> store) => store.state.sessionKey,
        builder: (context, sessionKey) => Text("sessionKey:\n $sessionKey"),
      )
    ]
  );
}
