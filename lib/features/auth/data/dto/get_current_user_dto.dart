import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_current_user_dto.g.dart';

@JsonSerializable()
class GetCurrentUserDto {
  @JsonKey(name: "_id")
  final String id;
  final String email;
  final String firstname;
  final String lastname;
  final String phone;
  final String password;

  GetCurrentUserDto({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.password,
  });

  AuthEntity toEntity() {
    return AuthEntity(
      id: id,
      email: email,
      firstname: firstname,
      lastname: lastname,
      phone: phone,
      password: password,
    );
  }

  factory GetCurrentUserDto.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetCurrentUserDtoToJson(this);
}
