import 'package:final_assignment/app/navigator/navigator.dart';
import 'package:final_assignment/features/auth/presentation/view/login_screen.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final loginViewNavigatorProvider = Provider((ref) => LoginViewNavigator());

// class LoginViewNavigator with  {}

mixin LoginViewRoute {
  openLoginView() {
    NavigateRoute.popAndPushRoute(const LoginScreen());
  }
}
