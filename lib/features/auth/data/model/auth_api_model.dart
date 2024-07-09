import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_api_model.g.dart';

final authApiModelProvider =
    Provider<AuthApiModel>((ref) => const AuthApiModel.empty());

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: '_id')
  final String id;
  final String firstname;
  final String lastname;
  final String email;
  final String? password;
  final String phone;

  AuthApiModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    this.password,
    required this.phone,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // To Entity
  AuthEntity toEntity() {
    return AuthEntity(
      id: id,
      firstname: firstname,
      lastname: lastname,
      email: email,
      password: password??"",
      phone: phone,
    );
  }
  const AuthApiModel.empty()
  :id="",
  firstname="",
  lastname="",
  email="",
  password="",
  phone="";
}
