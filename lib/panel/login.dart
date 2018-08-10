import 'package:flutter/material.dart';
import 'package:login/model/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:login/model/user.dart';
import 'package:login/events.dart';
import 'package:login/panel/login_form.dart';
import 'package:login/effects.dart';
import 'package:login/subs.dart';

class LoginPanel extends StatelessWidget {
  @override
  build(BuildContext context) => ui();

  loginScreen() => StoreConnector<AppState, Map<Symbol, dynamic>>(

      converter: (Store<AppState> store) => {
            #onRegister: (email, password) =>
                store.dispatch(Register(User(email, password))),

            #onLogin: (email, password) =>
//                store.dispatch(Login(User(email, password)))
                  store.dispatch(attemptLoginEffect(email, password)),
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

//              is there a way you can do a sub-id for authErrMsg ?
//              again, it would be a function that accepts a store,
//              and returns a particular piece of data from the store

//              the advantage would be, that the converter fn now doesn't need to know
//              how to access authErrorMessage from within the store...
//              ... this would be helpful especially in cases where
//              pulling data from the store is non-trivial (e.g. bc nested etc.)


//

              StoreConnector<AppState, String>(
                  converter: (store) => authErrorMessage(store),
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