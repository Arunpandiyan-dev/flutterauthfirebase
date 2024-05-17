import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class LoginRequested extends AuthenticationEvent {
  final String email;
  final String password;

  const LoginRequested(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignupRequested extends AuthenticationEvent {
  final String email;
  final String password;

  const SignupRequested(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class ResetPasswordRequested extends AuthenticationEvent {
  final String email;

  const ResetPasswordRequested(this.email);

  @override
  List<Object> get props => [email];
}

class LogoutRequested extends AuthenticationEvent {}
