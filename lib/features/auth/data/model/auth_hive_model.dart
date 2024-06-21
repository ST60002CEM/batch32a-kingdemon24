import 'package:final_assignment/app/constants/hive_table_constant.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart';

final authHiveModelProvider = Provider(
  (ref) => AuthHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String firstname;

  @HiveField(2)
  final String lastname;

  @HiveField(3)
  final String phone;

  @HiveField(4)
  final String email;

  @HiveField(5)
  final String password;

  // Constructor
  AuthHiveModel({
    String? userId,
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.email,
    required this.password,
  }) : userId = userId ?? const Uuid().v4();

  // empty constructor
  AuthHiveModel.empty()
      : this(
          userId: '',
          firstname: '',
          lastname: '',
          phone: '',
          email: '',
          password: '',
        );

  // Convert Hive Object to Entity
  AuthEntity toEntity() => AuthEntity(
        id: userId,
        firstname: firstname,
        lastname: lastname,
        phone: phone,
        email: email,
        password: password,
      );

  // Convert Entity to Hive Object
  AuthHiveModel toHiveModel(AuthEntity entity) => AuthHiveModel(
        userId: const Uuid().v4(),
        firstname: entity.firstname,
        lastname: entity.lastname,
        phone: entity.phone,
        email: entity.email,
        password: entity.password,
      );

  // Convert Entity List to Hive List
  List<AuthHiveModel> toHiveModelList(List<AuthEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  String toString() {
    return 'userId: $userId, fname: $firstname, lname: $lastname, phone: $phone, email: $email, password: $password';
  }
}
