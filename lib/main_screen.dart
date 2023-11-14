import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rescue/constants/app_colors.dart';
import 'package:rescue/controller/location_controller.dart';
import 'package:rescue/screens/mainscreens/chat_bot_screen.dart';
import 'package:rescue/screens/mainscreens/home.dart';
import 'package:rescue/screens/mainscreens/news_screen.dart';
import 'package:rescue/screens/mainscreens/profile_screen.dart';
import 'package:rescue/screens/mainscreens/evacuation_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int currentTab = 0;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();

  @override
  void initState() {
    Get.find<LocationController>().getLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.message),
          onPressed: () {
            Get.to(() => const ChatBotScreen());
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
                    currentScreen = const HomeScreen();
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
                    currentScreen = NewsScreen();
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
                    currentScreen = const EvacuationScreen();
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
                    currentScreen = const ProfileScreen();
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
            ],
          ),
        ),
      ),
    );
  }
}
