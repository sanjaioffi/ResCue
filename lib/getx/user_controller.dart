import 'package:get/get.dart';
import 'package:rescue/Database/user_curd.dart';
import 'package:rescue/Database/user_model.dart';

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rescue/getx/uid_controller.dart';





class UserController extends GetxController {
  Rx<User?> user = Rx<User?>(null);
  RxMap<dynamic, dynamic> userData = {}.obs;
  void setUser(User newUser) {
    user.value = newUser;
  }

  User? get getUser => user.value;

  Future<void> fetchUser() async {
    final userUid = Get.find<UidController>().uid.value;
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .get();
      if (userDoc.exists) {
        userData.value = userDoc.data() as Map<String, dynamic>;
        print('-----------------');
        print(userData);
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<void> fetchUserData(String uid) async {
    
    User? userData = await DatabaseService().getUserData(uid);
    print(userData?.username);
    if (userData != null) {
      setUser(userData);
      print('User data fetched successfully');
    }
    update();
  }
}
