import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';

class CurrentUserState {
  final bool isLoading;
  final AuthEntity? authEntity;
  final String? error;
  final bool isFingerprintEnabled;

  CurrentUserState(
      {required this.isLoading,
      required this.authEntity,
      required this.error,
      required this.isFingerprintEnabled});

  factory CurrentUserState.initial() {
    return CurrentUserState(
        isLoading: false,
        authEntity: null,
        error: null,
        isFingerprintEnabled: false);
  }

  CurrentUserState copyWith(
      {bool? isLoading,
      AuthEntity? authEntity,
      String? error,
      bool? isFingerprintEnabled}) {
    return CurrentUserState(
        isLoading: isLoading ?? this.isLoading,
        authEntity: authEntity ?? this.authEntity,
        error: error ?? this.error,
        isFingerprintEnabled:
            isFingerprintEnabled ?? this.isFingerprintEnabled);
  }
}
