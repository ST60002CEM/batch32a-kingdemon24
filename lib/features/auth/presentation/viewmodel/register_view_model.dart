import 'package:final_assignment/core/common/my_snakbar.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:final_assignment/features/auth/domain/usecases/auth_usecase.dart';
import 'package:final_assignment/features/auth/presentation/navigator/register_navigator.dart';
import 'package:final_assignment/features/auth/presentation/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerViewModelProvider =
    StateNotifierProvider<RegisterViewModel, AuthState>((ref) =>
            RegisterViewModel(ref.watch(registerViewNavigatorProvider),
                ref.read(authUseCaseProvider))
//      {
//   final navigator = ref.watch(registerViewNavigatorProvider),ref.read(authUseCaseProvider);
//   return RegisterViewModel(navigator);
// }
        );

class RegisterViewModel extends StateNotifier<AuthState> {
  RegisterViewModel(this.navigator, this.authUseCase)
      : super(AuthState.initial());
  final RegisterViewNavigator navigator;
  final AuthUseCase authUseCase;

  Future<void> registerUser(AuthEntity user) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.registerUser(user);
    data.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.error,
        );
        showMySnackBar(message: failure.error, color: Colors.red);
      },
      (success) {
        state = state.copyWith(isLoading: false, error: null);
        showMySnackBar(message: "Successfully registered");
        openLoginView();
      },
    );
  }

  void openLoginView() {
    navigator.openLoginView();
  }
}
