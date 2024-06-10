import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? id;
  final String fname;
  final String lname;
  final String? image;
  final String phone;
  final String email;
  final String password;

  const AuthEntity({
    this.id,
    required this.fname,
    required this.lname,
    this.image,
    required this.phone,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props =>
      [id, fname, lname, image, phone, email, password];
}
