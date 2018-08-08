class User {
  final String email;
  final String password;

  const User(this.email, this.password);

  String toString() {
    return 'User{email: $email, password: $password}';
  }

  // can we use the built library for this instead?
  @override
  bool operator ==(other) {
    return other is User &&
        other.email == this.email &&
        other.password == this.password;
  }
}
