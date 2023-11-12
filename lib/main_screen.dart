import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rescue/constants/app_colors.dart';
import 'package:rescue/controller/location_controller.dart';
import 'package:rescue/screens/mainscreens/chat_bot_screen.dart';
import 'package:rescue/screens/mainscreens/home.dart';
import 'package:rescue/screens/mainscreens/news_screen.dart';
import 'package:rescue/screens/mainscreens/profile_screen.dart';
import 'package:rescue/screens/mainscreens/evacuation_screen.dart';

import 'screens/llm/palm_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen(); // Our first view in viewport
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.

  @override
  void initState() {
    Get.find<LocationController>().getLocation();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.message),
          onPressed: () {
            Get.to(() => ChatBotScreen());
          }),
      body: currentScreen,
      bottomNavigationBar: BottomAppBar(
        color: AppColor.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MaterialButton(
                minWidth: 30,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        const HomeScreen(); // if user taps on this dashboard tab will be active
                    currentTab = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.home,
                        color: currentTab == 0
                            ? AppColor.whatsAppTealGreen
                            : AppColor.grey),
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 13,
                        color: currentTab == 0
                            ? AppColor.whatsAppTealGreen
                            : AppColor.grey,
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 30,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        NewsScreen(); // if user taps on this dashboard tab will be active
                    currentTab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.article,
                        color: currentTab == 1
                            ? AppColor.whatsAppTealGreen
                            : AppColor.grey),
                    Text(
                      'News',
                      style: TextStyle(
                        fontSize: 13,
                        color: currentTab == 1
                            ? AppColor.whatsAppTealGreen
                            : AppColor.grey,
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                splashColor: Colors.transparent,
                minWidth: 30,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        EvacuationScreen(); // if user taps on this dashboard tab will be active
                    currentTab = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.leaderboard,
                        color: currentTab == 2
                            ? AppColor.whatsAppTealGreen
                            : AppColor.grey),
                    Text(
                      'Evacuation',
                      style: TextStyle(
                          fontSize: 13,
                          color: currentTab == 2
                              ? AppColor.whatsAppTealGreen
                              : AppColor.grey),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 30,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        ProfileScreen(); // if user taps on this dashboard tab will be active
                    currentTab = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.person,
                        color: currentTab == 3
                            ? AppColor.whatsAppTealGreen
                            : AppColor.grey),
                    Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: 13,
                          color: currentTab == 3
                              ? AppColor.whatsAppTealGreen
                              : AppColor.grey),
                    ),
                  ],
                ),
              ),

              // Right Tab bar icons
            ],
          ),
        ),
      ),
    );
  }
}
