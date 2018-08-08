import 'package:flutter/material.dart';
import 'package:login/model/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:login/model/user.dart';
import 'package:login/model/app_state.dart';
import 'package:login/actions.dart';

// most of the re-usable dumb-views should be in here


// Egan handles the redux-managed input form
// by having a cleanly separated 'add_todo' container:
// https://github.com/brianegan/flutter_architecture_samples/blob/master/example/redux/lib/containers/add_todo.dart

// and 'add_todo' presenter:
// https://github.com/brianegan/flutter_architecture_samples/blob/master/example/redux/lib/presentation/add_edit_screen.dart

// seems a bit much to me...

//typedef OnSaveCallback = Function(String task, String note);

//class Registration