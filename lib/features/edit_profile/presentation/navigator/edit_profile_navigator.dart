import 'package:final_assignment/app/navigator/navigator.dart';
import 'package:final_assignment/features/edit_profile/presentation/view/edit_profile_view.dart';
import 'package:final_assignment/features/profile/presentation/navigator/profile_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final editProfileViewNavigatorProvider =
    Provider<EditProfileViewNavigator>((ref) {
  return EditProfileViewNavigator();  
});

class EditProfileViewNavigator with ProfileRoute {}

mixin EditProfileViewRoute {
  openEditProfileView() {
    NavigateRoute.pushRoute(const EditProfileView());
  }
}