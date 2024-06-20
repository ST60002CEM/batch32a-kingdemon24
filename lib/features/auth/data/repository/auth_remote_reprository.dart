import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:final_assignment/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final authRemoteRepositoryProvider = Provider<IAuthRepository>((ref) {
//   return AuthRemoteRepository(
//     ref.read(authRemoteDataSourceProvider),
//   );
// });

// class AuthRemoteRepository implements IAuthRepository {
//   final AuthRemoteDataSource _authRemoteDataSource;
//   AuthRemoteRepository(this._authRemoteDataSource);

//   // @override
//   // Future<Either<Failure, bool>> loginUser(String username, String password) {
//   //   return _authRemoteDataSource.login( password: '', username: '');
//   // }

//   @override
//   Future<Either<Failure, bool>> registerUser(AuthEntity user) {
//     return _authRemoteDataSource.addUser(user);
//   }

//   @override
//   Future<Either<Failure, bool>> loginUser(String username, String password) {
//     // TODO: implement loginUser
//     throw UnimplementedError();
//   }

// //   @override
// //   Future<Either<Failure, AuthEntity>> getCurrentUser() {
// //    return _authRemoteDataSource.getCurrentUser();
// //   }
// }

final authRemoteRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthRemoteRepository(
    ref.read(authRemoteDataSourceProvider),
  );
});

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  AuthRemoteRepository(this._authRemoteDataSource);

  @override
  Future<Either<Failure, bool>> loginUser(String email, String password) {
    return _authRemoteDataSource.loginUser(email, password);
  }

  @override
  Future<Either<Failure, bool>> registerUser(AuthEntity user) {
    return _authRemoteDataSource.registerUser(user);
  }
}
