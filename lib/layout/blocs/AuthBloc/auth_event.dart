// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignUpUserEvent extends AuthEvent {
  String name;
  String emailId;
  String password;
  String address;
  BuildContext context;
  SignUpUserEvent({
    required this.name,
    required this.emailId,
    required this.password,
    required this.address,
    required this.context,
  });
}

class SigninUserEvent extends AuthEvent {
  String password;
  String email;
  BuildContext context;

  SigninUserEvent({
    required this.password,
    required this.email,
    required this.context,
  });
}
