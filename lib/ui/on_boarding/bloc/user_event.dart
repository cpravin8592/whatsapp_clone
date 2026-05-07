abstract class UserEvent {}

class LoginEvent extends UserEvent {
  final String email, password;

  LoginEvent({required this.email, required this.password});
}

class RegisterEvent extends UserEvent {
  final String name, email, password;

  RegisterEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}
