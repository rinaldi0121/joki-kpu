abstract class LoginEvents {
  const LoginEvents();
}

class EmailEvent extends LoginEvents {
  const EmailEvent(this.email);

  final String email;
}

class PasswordEvent extends LoginEvents {
  const PasswordEvent(this.password);

  final String password;
}
