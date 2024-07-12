import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/core/shared_prefs.dart/user_shared_pref.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:final_assignment/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authUseCaseProvider = Provider((ref) {
  return AuthUseCase(
      authRepository: ref.watch(authRepositoryProvider),
      userSharedPrefs: ref.watch(userSharedPrefsProvider));
});

class AuthUseCase {
  final IAuthRepository authRepository;
  final UserSharedPrefs userSharedPrefs;

  AuthUseCase({
    required this.authRepository,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, bool>> registerUser(AuthEntity? user) async {
    return await authRepository.registerUser(user!);
  }

  Future<Either<Failure, bool>> loginUser(
      String? email, String? password) async {
    return await authRepository.loginUser(email ?? "", password ?? "");
  }
  Future<Either<Failure, bool>> verifyUser() {
    return authRepository.verifyUser();
  }

  Future<Either<Failure, AuthEntity>> getCurrentUser() {
    return authRepository.getCurrentUser();
  }

  Future<Either<Failure, bool>> fingerPrintLogin() async {
    final id = await userSharedPrefs.checkId();
    return id.fold((l) => Left(Failure(error: l.error)), (r) async {
      if (r != '') {
        await authRepository.fingerPrintLogin(r);
        return const Right(true);
      }
      return Left(Failure(error: 'No fingerprint id found'));
    });
  }
}
