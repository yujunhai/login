import 'package:flutter/material.dart';
import 'package:login/panel/login.dart';
import 'package:login/model/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:login/model/user.dart';
import 'package:login/reducers.dart';
import 'package:login/actions.dart';
import 'package:login/panel/login_form.dart';

//typedef OnSaveCallback = Function(String task, String note);

// nik was having LoginScreen extend StatefulWidget and then has
// a LoginState that extends State<LoginScreen>

// 1. where should types like this actually go?
// 2. do we REALLY need to specify the type of the fn we're returning?
// 3. is there a BETTER / shorter INLINE way to specify the fn's type?
// 4. this type signature is not accurate for your use case

typedef OnSaveCallback = Function(String task, String note);
//typedef OnSaveCallback = VoidCallback;

// how does redux do it?
class LoginPanel extends StatelessWidget {

//  @override
//  LoginPanel() => Text("Login Panel here");

// you MUST implement this build method,
// so might as well have it call the rendering fns etc.
  @override
  Widget build(BuildContext context) {
    debugPrint("LoginPanel: build called");
    return ui();}

  StoreConnector<AppState, OnSaveCallback> loginScreen() {
    return StoreConnector<AppState, OnSaveCallback>(

//    you actually need two functions:
//    one for dispatching a [::register email password]
//    and another for [::login email password]

//    will you have to make converter return a MAP of functions / values?
//    and so you'd have StoreConnector<AppState, Map<Symbol, dynamic>>

      converter: (Store<AppState> store) {
        return (email, password) {
          debugPrint("onSaveCallback called");
          store.dispatch(Register(User(email, password)));
        };
      },
      builder: (BuildContext context, OnSaveCallback onSave) {
        return AddEditScreen(
          key: registerUserKey, // ArchSampleKeys.addTodoScreen,
          onSave: onSave,

        );
      },
    );
  }

//  just by looking at this
  Widget ui() => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            loginScreen(),

            StoreConnector<AppState, String>(
              converter: (store) => store.state.authErrorMessage,
              builder: (context, authErrorMsg) => Text(authErrorMsg)
            ),

//            DEBUG STATE
            Text("\n\nThe current state is: "),
            StoreConnector<AppState, String>(
              converter: (store) => store.state.toString(),
              builder: (context, state) => Text(state)
            )
          ],
        ),
      ),

      );





}