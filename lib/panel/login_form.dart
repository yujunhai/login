import 'package:flutter/material.dart';
import 'package:login/model/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:login/model/user.dart';
import 'package:login/model/app_state.dart';
import 'package:login/actions.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// what is a Key used for?
const Key registerUserKey = Key("registerUserKey");

class AddEditScreen extends StatelessWidget {
  static final GlobalKey<FormState> _formKey =
    GlobalKey<FormState>();

  static final GlobalKey<FormFieldState<String>> _emailKey =
    GlobalKey<FormFieldState<String>>();

  static final GlobalKey<FormFieldState<String>> _passwordKey =
    GlobalKey<FormFieldState<String>>();

//  final bool isEditing;
  final Function(String, String) onSave;

  final String email;
  final String password;

  AddEditScreen({Key key, @required this.onSave, this.email, this.password})
//      : super(key: key ?? ArchSampleKeys.addTodoScreen);
      : super(key: key ?? registerUserKey);

  @override
  Widget build(BuildContext context) {
//    final localizations = ArchSampleLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    return loginForm(textTheme);
  }

//  this works -- perhaps the issue was using Center + Column + ListView?
  Form loginForm(TextTheme textTheme) {

    return Form(
      key: _formKey,
      child: Column( // i.e. v-box
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          TextFormField(
            initialValue: "",
            key: _emailKey,
            style: textTheme.headline,
            decoration: InputDecoration(hintText: "email"),
            validator: (val) {
                if (val.trim().isEmpty) { return "Please enter a valid email"; }
            },
          ),

          TextFormField(
            initialValue: "",
            key: _passwordKey,
            style: textTheme.subhead,
            decoration: InputDecoration(hintText: "password"),
            validator: (val) {
              if (val.trim().isEmpty) { return "Please enter a valid password"; }
            },
          ),

          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("login"),
                onPressed: () {
                if (_formKey.currentState.validate()) {
                    debugPrint("RaisedButton login: inputs valid");
                  } else {
                    debugPrint("RaisedButton login: inputs not valid");
                  }
                },

              ),
              RaisedButton(
                child: Text("register"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    debugPrint("RaisedButton register: inputs valid");
                    debugPrint("RaisedButton login: inputs valid");
                    onSave(_emailKey.currentState.value, _passwordKey.currentState.value);
                  } else {
                    debugPrint("RaisedButton register: inputs not valid");
                  }
                },
              ),


            ],

          )



      ]
      )
    );

  }

}

//    return Form(
//          key: _formKey,
//          child: ListView(
//            children: [
//              TextFormField(
//                initialValue: 'todo initial val :-)', // isEditing ? todo.task : '',
//                key: _emailKey,
////                autofocus: !isEditing,
//                style: textTheme.headline,
//                decoration: InputDecoration(
//                  hintText: 'hint: todo' //localizations.newTodoHint,
//                ),
//                validator: (val) {
//                  debugPrint("TextFormField validator called");
//                  return val.trim().isEmpty
//                      ? 'The todo is empty!' // localizations.emptyTodoError
//                      : null;
//                },
//              ),
//              TextFormField(
////                initialValue: isEditing ? todo.note : '',
//                initialValue: 'note initial val :-)',
//                key: _passwordKey,
//                maxLines: 10,
//                style: textTheme.subhead,
//                decoration: InputDecoration(
//                  hintText: 'hint: ' // localizations.notesHint,
//                ),
//              ),
//
//
//
//
////              RaisedButton(
////                onPressed: () {
////                  if (_formKey.currentState.validate()) {
////                    onSave(
////                      _emailKey.currentState.value,
////                      _passwordKey.currentState.value,
////                    );
////                  }
////                },
////              )
//
//            ],
//          ),
////        ),
////      ),
////      floatingActionButton: FloatingActionButton(
//////        tooltip: isEditing ? localizations.saveChanges : localizations.addTodo,
////        tooltip: "login_form fab tooltip",
////        child: Icon(Icons.add), // Icon(isEditing ? Icons.check : Icons.add),
////        onPressed: () {
////          if (_formKey.currentState.validate()) {
////            onSave(
////              _emailKey.currentState.value,
////              _passwordKey.currentState.value,
////            );
////
//////            do i need this?
//////            Navigator.pop(context);
////          }
////        },
////      ),
//    );
//  }
