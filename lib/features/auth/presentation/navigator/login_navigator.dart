import 'package:final_assignment/app/navigator/navigator.dart';
import 'package:final_assignment/features/auth/presentation/navigator/register_navigator.dart';
import 'package:final_assignment/features/auth/presentation/view/login_view.dart';
import 'package:final_assignment/features/home/presentation/navigator/home_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final loginViewNavigatorProvider = Provider((ref) => LoginViewNavigator());

// class LoginViewNavigator with RegisterViewRoute {
//   void openHomeView() {}
// }

// mixin LoginViewRoute {
//   openLoginView() {
//     NavigateRoute.popAndPushRoute(const LoginView());
//   }
// }

final loginViewNavigatorProvider = Provider((ref) => LoginViewNavigator());

class LoginViewNavigator with RegisterViewRoute, HomeViewRoute {}

mixin LoginViewRoute {
  openLoginView() {
    NavigateRoute.popAndPushRoute(const LoginView());
  }
}
