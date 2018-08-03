import 'package:flutter/material.dart';
import 'package:login/panel/login.dart';
import 'package:login/model/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:login/model/user.dart';
import 'package:login/reducer.dart';



// nik was having LoginScreen extend StatefulWidget and then has
// a LoginState that extends State<LoginScreen>

// how does redux do it?
class LoginPanel extends StatelessWidget {

//  @override
//  LoginPanel() => Text("Login Panel here");

// you MUST implement this build method,
// so might as well have it call the rendering fns etc. 
  @override
  Widget build(BuildContext context) {
    debugPrint("LoginPanel: build called");
    return show();
  }

  Widget show() => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("The current state is: "),
            new StoreConnector<AppState, String>(
              converter: (store) => store.state.toString(),
              builder: (context, state) {
                return Text(state);
//                    return Text("love");
              },
            )
          ],
        ),
      ),
      floatingActionButton: new StoreConnector<AppState, VoidCallback>(
        converter: (store) {
          return () => store.dispatch(Actions.AddUser);
        },
        builder: (context, callback) {
          return FloatingActionButton(
            onPressed: callback,
            tooltip: "Does this tooltip even matter?",
            child: new Icon(Icons.airline_seat_recline_normal),
          );
        },
      )



  );

}