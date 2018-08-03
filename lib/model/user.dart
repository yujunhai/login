

class User {

  final String email;
  final String password;

  const User(this.email, this.password);

  // put validation logic here?
  // ... if validation fails, don't return a user?
  // ... that won't work -- Dart doesn't have the idea of Either[ValidationError, User] ...

  String toString() {
    return 'User{email: $email, password: $password}';
  }
}