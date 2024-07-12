import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_assignment/app/constants/api_endpoint.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/core/networking/remote/http_service.dart';
import 'package:final_assignment/core/shared_prefs.dart/user_shared_pref.dart';
import 'package:final_assignment/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:final_assignment/features/auth/data/model/auth_api_model.dart';
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

final authRemoteRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthRemoteRepositoy(
    dio: ref.watch(httpServiceProvider),
    authApiModel: ref.watch(authApiModelProvider),
    userSharedPrefs: ref.watch(userSharedPrefsProvider),
    authRemoteDataSource: ref.watch(authRemoteDataSourceProvider),
  );
});

class AuthRemoteRepositoy implements IAuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final UserSharedPrefs userSharedPrefs;
  final Dio dio;
  final AuthApiModel authApiModel;
  AuthRemoteRepositoy({
    required this.authRemoteDataSource,
    required this.userSharedPrefs,
    required this.dio,
    required this.authApiModel,
  });

  @override
  Future<Either<Failure, bool>> loginUser(String email, String password) {
    return authRemoteDataSource.loginUser(email, password);
  }

  @override
  Future<Either<Failure, bool>> registerUser(AuthEntity user) {
    return authRemoteDataSource.registerUser(user);
  }

  // @override
  // Future<Either<Failure, bool>> verifyUser() {
  //   return _authRemoteDataSource.verifyUser();
  // }

  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() {
    return authRemoteDataSource.getMe();
  }

  // @override
  // Future<Either<Failure, bool>> fingerPrintLogin(String id) {
  //   return _authRemoteDataSource.fingerPrintLogin(id);
  // }
  @override
  Future<Either<Failure, bool>> fingerPrintLogin(String id) async {
    try {
      Response response = await dio.post(
        ApiEndpoints.getToken,
        data: {'id': id},
      );
      if (response.statusCode == 200) {
        final token = response.data['token'];
        await userSharedPrefs.setUserToken(token);
        return const Right(true);
      }
      return Left(
        Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString()),
      );
    } on DioException catch (e) {
      return Left(Failure(error: e.error.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> verifyUser() {
    // TODO: implement verifyUser
    throw UnimplementedError();
  }
}
