import 'package:flutter/material.dart';
import 'package:login/model/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:login/model/user.dart';
import 'package:login/events.dart';
import 'package:login/view/login_form.dart';
import 'package:login/effects.dart';
import 'package:login/subs.dart';

class LoginPanel extends StatelessWidget {
  @override
  build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[loginScreen(), errorMessage()],
      );


  // can be simplified by just taking sourced-data as params from parent
  //  (pass a map?)


//  N: in the parent component sources all the data he needs (even creates components),


//  create a wrapper around the store that has separate fns for dispatching
//  events vs. effects;
//  with clear type signatures etc.
  loginScreen() => StoreConnector<AppState, Map<Symbol, dynamic>>(
      converter: (Store<AppState> store) => {
            #onRegister: (email, password) =>
                store.dispatch(Register(User(email, password))),
            #onLogin: (email, password) =>
                store.dispatch(attemptLoginEffect(email, password)),
          },
      builder: (BuildContext context, Map<Symbol, dynamic> props) =>
          AddEditScreen(
            key: loginKey,
            onRegister: props[#onRegister],
            onLogin: props[#onLogin],
          ));

  errorMessage() => StoreConnector<AppState, String>(
      converter: (store) => authErrorMessage(store),
      builder: (context, authErrorMsg) => Text(authErrorMsg));
}
