import 'package:login/model/user.dart';

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
