import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? id;
  final String firstname;
  final String lastname;
  final String phone;
  final String email;
  final String password;

  const AuthEntity({
    this.id,
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [id, firstname, lastname, phone, email, password];
}
