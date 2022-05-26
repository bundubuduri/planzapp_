
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';
import 'package:planzapp/Models/Notifications/NotificationsModel.dart';

class GetNotificationsService {
  final _auth = FirebaseAuth.instance;

  final _firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> getNotifications() {
return _firestore
    .collection("User")
    .doc(_auth.currentUser!.uid.toString())
    .collection("Notifications")
    .snapshots();
  }
    /*
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  Stream notifications =(()_firestore
      .collection("User")
      .doc(_auth.currentUser.email.toString())
      .collection("Notifications")
      .snapshots()());*/

 // }
}