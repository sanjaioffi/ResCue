import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String phoneNumber;
  String loginPassword;
  String username;
  int age;
  String homeAddress;
  String workAddress;
  Timestamp createdOn;
  String emailId;

  User(
      {required this.uid,
      required this.createdOn,
      required this.phoneNumber,
      required this.loginPassword,
      required this.username,
      required this.homeAddress,
      required this.workAddress,
      required this.age,
      required this.emailId});
}
