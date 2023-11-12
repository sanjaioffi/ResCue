import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rescue/Database/user_model.dart';


class DatabaseService {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  // Update user data
  Future<void> updateUserData(User user) async {
    return await userCollection.doc(user.uid).set({
      
      'uid': user.uid,
      'createdOn': user.createdOn,
      'phoneNumber': user.phoneNumber,
      'loginPassword': user.loginPassword,
      'username': user.username,
      'homeAddress' : user.homeAddress,
      'workAddress' : user.workAddress,
      'age': user.age,
      'emailId' : user.emailId

      
 
    });
  }

  // Get user data
  Future<User?> getUserData(String uid) async {
    DocumentSnapshot doc = await userCollection.doc(uid).get();
    if (doc.exists) {
      return User(
        createdOn: doc['createdOn'],
        homeAddress: doc['homeAddress'],
        workAddress: doc['workAddress'],
        uid: uid,
        phoneNumber: doc['phoneNumber'],
        loginPassword: doc['loginPassword'],
        username: doc['username'],
        age: doc['age'],
        emailId: doc['emailId']
       
      );
    } else {
      return null;
    }
  }

  
  
}
