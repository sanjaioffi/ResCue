import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rescue/screens/mainscreens/chat_bot_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:rescue/controller/location_controller.dart';
import 'package:rescue/firebase_options.dart';
import 'package:rescue/getx/uid_controller.dart';
import 'package:rescue/getx/user_controller.dart';
import 'package:rescue/main_screen.dart';
import 'package:rescue/screens/onboarding/onboarding_page.dart';
import 'package:rescue/screens/onboarding/signup_page_2.dart';

import 'screens/onboarding/emergecy_contacts.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Check if the user's UID is saved in shared preferences
  final prefs = await SharedPreferences.getInstance();
  final uid = prefs.getString('uid');
  Get.put<UidController>(UidController());
  Get.put<UserController>(UserController());
  Get.put<LocationController>(LocationController());

  runApp(MyApp(uid: uid));
}

class MyApp extends StatelessWidget {
  final String? uid;

  const MyApp({super.key, required this.uid});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (uid != null) {
      Get.find<UidController>().setUid(uid!);
      Get.find<UserController>().fetchUserData(uid!);
    }
    return GetMaterialApp(
      title: 'ResCue',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: uid == null ? ChatBotScreen() : MainScreen(),
    );
  }
}
