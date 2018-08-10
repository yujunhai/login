import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:login/helpers.dart';

const Key loginKey = Key("registerUserKey");

typedef StringToVoidFn = void Function(String, String);

class AddEditScreen extends StatelessWidget {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static final GlobalKey<FormFieldState<String>> _emailKey =
      GlobalKey<FormFieldState<String>>();

  static final GlobalKey<FormFieldState<String>> _passwordKey =
      GlobalKey<FormFieldState<String>>();

  final StringToVoidFn onRegister;
  final StringToVoidFn onLogin;

  final String email;
  final String password;

  AddEditScreen(
      {Key key,
      @required this.onRegister,
      @required this.onLogin,
      this.email,
      this.password})
      : super(key: key ?? loginKey);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return loginForm(textTheme);
  }

  Form loginForm(TextTheme textTheme) {
    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                initialValue: "multistop@liefery.com",
                key: _emailKey,
                style: textTheme.headline,
                decoration: InputDecoration(hintText: "email"),
                validator: (val) {
                  if (val.trim().isEmpty) {
                    return "Please enter a valid email";
                  }
                },
              ),
              TextFormField(
                initialValue: "password",
                key: _passwordKey,
                style: textTheme.subhead,
                decoration: InputDecoration(hintText: "password"),
                validator: (val) {
                  if (val.trim().isEmpty) {
                    return "Please enter a valid password";
                  }
                },
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text("login"),
//                  YIKES!: A fail outcome in .validate() mutates the UI with a string hardcoded in validate-fn;
//                  but a success outcome returns a truthy value, which we use as a signal to
//                  dispatch an event... :(
                    onPressed: () =>
//                        when(_formKey.currentState.validate(),
//                            () => onLogin(_emailKey.currentState.value, _passwordKey.currentState.value))
                        _formKey.currentState.validate()
                            ? onLogin(_emailKey.currentState.value,
                                _passwordKey.currentState.value)
                            : null,
                  ),
                  RaisedButton(
                    child: Text("register"),
                    onPressed: () {
                      if (_formKey.currentState.validate())
                        onRegister(_emailKey.currentState.value,
                            _passwordKey.currentState.value);
                    },
                  ),
                ],
              )
            ]));
  }
}
