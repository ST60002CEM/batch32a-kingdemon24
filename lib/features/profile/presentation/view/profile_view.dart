import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:final_assignment/features/profile/presentation/viewmodel/profile_view_model.dart';
import 'package:final_assignment/features/profile/presentation/widgets/profile_menu.dart';
import 'package:final_assignment/features/profile/presentation/widgets/profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(currentUserViewModelProvider.notifier).initialize(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(currentUserViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: profileState.authEntity?.firstname ?? "First Name",
              icon: "assets/icons/profile.svg",
              press: () {
                if (mounted) {
                  ref
                      .read(currentUserViewModelProvider.notifier)
                      .openEditProfileView();
                }
              },
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () {
                // Navigate to Notifications screen
              },
            ),
            ProfileMenu(
              text: "Change Password",
              icon: "assets/icons/password.svg",
              press: () {
                // Navigate to Settings screen
              },
            ),
            ProfileMenu(
              text: "Enable Finger Print",
              icon: "assets/icons/fingerprint.svg",
              press: () {
                ref
                    .read(currentUserViewModelProvider.notifier)
                    .enableFingerprint();
              },
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/logout.svg",
              press: () {
                if (mounted) {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    title: 'Logout',
                    desc: 'Are You Sure You Want To Logout?',
                    btnOkOnPress: () {
                      if (mounted) {
                        ref
                            .read(currentUserViewModelProvider.notifier)
                            .logout();
                      }
                    },
                    btnCancelOnPress: () {},
                  ).show();
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Colors.blueAccent.withOpacity(0.2),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/dark_mode.svg",
                      width: 22,
                    ),
                    const SizedBox(width: 20),
                    const Expanded(child: Text("Dark Mode/Light Mode")),
                    Switch(
                      value: false,
                      onChanged: (value) {
                        value = !value;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
