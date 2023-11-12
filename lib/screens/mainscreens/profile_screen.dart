import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rescue/getx/user_controller.dart';
import 'package:rescue/screens/mainscreens/profile_widget.dart';
import 'package:rescue/screens/onboarding/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Get.find<UserController>().fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: const Text('ProfileScreen'),
        actions: [
          const Icon(Icons.more_vert),
        ],
      ),
      // body: GetBuilder<LocationController>(builder: (_) {
      //   return _.userLocation.value == null
      //       ? const Center(child: CircularProgressIndicator())
      //       : Center(
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: <Widget>[
      //               Text(
      //                 _.userLocation.value!.toString(),
      //               ),
      //             ],
      //           ),
      //         );
      // }),

      body: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              const ProfileScreenImage(),
              SizedBox(
                height: 20,
              ),
              ProfileScreenTile(
                tileIcon: Icons.contact_emergency_outlined,
                title: "Emergency contacts",
                subtitle: "Make changes to contacts",
                function: () {
                  Navigator.pushNamed(context, 'EmergencyContactPage',
                      arguments: "editing");
                },
              ),
              ProfileScreenTile(
                function: () {},
                tileIcon: Icons.person_outlined,
                title: "Account",
                subtitle: "Manage your account",
              ),
              ProfileScreenTile(
                function: () {
                  Navigator.pushNamed(context, 'NotificationList');
                },
                tileIcon: Icons.notifications_outlined,
                title: "Notifications",
                subtitle: "Manage your notifications",
              ),
              ProfileScreenTile(
                  function: () {},
                  tileIcon: Icons.lock_outline,
                  title: "Privacy",
                  subtitle: "manage privacy settings"),
              ProfileScreenTile(
                function: () {},
                tileIcon: Icons.shield_outlined,
                title: "Security",
                subtitle: "manage security settings",
              ),
              ProfileScreenTile(
                function: () {
                  Navigator.pushNamed(context, 'LanguageWidget');
                },
                tileIcon: Icons.language_outlined,
                title: "Language",
                subtitle: "manage language settings",
              ),
              ProfileScreenTile(
                function: () {},
                tileIcon: Icons.info_outline,
                title: "About",
                subtitle: "About the app",
              ),
              ProfileScreenTile(
                function: () {
                  Get.to(() => OnboardingScreen());
                              SharedPreferences.getInstance().then((prefs) {
                                prefs.remove('uid');
                              });

                },
                tileIcon: Icons.logout_outlined,
                title: "Logout",
                subtitle: "Logout from the app",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
