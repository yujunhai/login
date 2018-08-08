import 'package:flutter/material.dart';
import 'package:login/model/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:login/model/user.dart';
import 'package:login/actions.dart';
import 'package:login/panel/login_form.dart';

class LoginPanel extends StatelessWidget {
  @override
  build(BuildContext context) => ui();

  loginScreen() => StoreConnector<AppState, Map<Symbol, dynamic>>(
      converter: (Store<AppState> store) => {
            #onRegister: (email, password) =>
                store.dispatch(Register(User(email, password))),
            #onLogin: (email, password) =>
                store.dispatch(Login(User(email, password)))
          },
      builder: (BuildContext context, Map<Symbol, dynamic> props) =>
          AddEditScreen(
            key: loginKey,
            onRegister: props[#onRegister],
            onLogin: props[#onLogin],
          ));

  Widget ui() => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              loginScreen(),

              StoreConnector<AppState, String>(
                  converter: (store) => store.state.authErrorMessage,
                  builder: (context, authErrorMsg) => Text(authErrorMsg)),

//            DEBUG STATE
              Text("\n\nThe current state is: "),
              StoreConnector<AppState, String>(
                  converter: (store) => store.state.toString(),
                  builder: (context, state) => Text(state))
            ],
          ),
        ),
      );
}