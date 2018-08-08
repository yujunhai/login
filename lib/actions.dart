import 'package:flutter/material.dart';
import 'package:login/model/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:login/model/user.dart';
import 'package:login/model/app_state.dart';


// example here:
// https://github.com/brianegan/flutter_architecture_samples/blob/master/example/redux/lib/actions/actions.dart

class Increment {}

class AddUser {}

class Login {
  final User user;
  Login(this.user);
}

class Register {
  final User user;
  Register(this.user);
}


//enum Actions { Increment, AddUser, RegisterUser }