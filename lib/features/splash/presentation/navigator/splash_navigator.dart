import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashViewNavigatorProvider =
    Provider<SplashViewNavigator>((ref) => SplashViewNavigator());

// This class will be used to navigate to LoginView
class SplashViewNavigator with LoginViewRoute {}

mixin SplashViewRoute {}
