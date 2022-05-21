
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';

class NotificationUpdateService {
  void updateUserViewed(String notificationId) async{

    User loggedInUser = await GetUserController().run();
    DocumentReference reference = FirebaseFirestore.instance
        .collection("User")
        .doc(loggedInUser.uid.toString())
        .collection("Notifications")
        .doc(notificationId);
    reference.update({
      'userViewed' : true
    });
  }
}