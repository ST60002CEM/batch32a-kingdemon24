import 'package:final_assignment/core/common/my_snakbar.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:final_assignment/features/auth/domain/usecases/auth_usecase.dart';
import 'package:final_assignment/features/auth/presentation/navigator/login_navigator.dart';
import 'package:final_assignment/features/auth/presentation/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) => AuthViewModel(
    ref.read(loginViewNavigatorProvider),
    ref.read(authUseCaseProvider),
  ),
);

class AuthViewModel extends StateNotifier<AuthState> {
  AuthViewModel(this.navigator, this.authUseCase) : super(AuthState.initial());
  final AuthUseCase authUseCase;
  final LoginViewNavigator navigator;

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

  Future<void> loginUser(
    String email,
    String password,
  ) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.loginUser(email, password);
    data.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        showMySnackBar(message: "Invalid credential", color: Colors.red);
      },
      (success) {
        state = state.copyWith(isLoading: false, error: null);
        showMySnackBar(message: "Login successfully");
        openHomeView();
      },
    );
  }

  void openRegisterView() {
    navigator.openRegisterView();
  }


  void openHomeView() {
    navigator.openHomeView();
  }
  
  void openLoginView() {
    // navigator.
  }
  
}