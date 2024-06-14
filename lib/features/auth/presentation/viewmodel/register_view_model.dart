import 'package:final_assignment/features/auth/presentation/navigator/register_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerViewModelProvider =
    StateNotifierProvider<RegisterViewModel, void>((ref) {
  final navigator = ref.watch(registerViewNavigatorProvider);
  return RegisterViewModel(navigator);
});

class RegisterViewModel extends StateNotifier<void> {
  RegisterViewModel(this.navigator) : super(null);
  final RegisterViewNavigator navigator;
  void openLoginView() {
    navigator.openLoginView();
  }
}