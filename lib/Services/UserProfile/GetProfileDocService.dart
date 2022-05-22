import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class GetProfileDocService {
  String? userEmail = FirebaseAuth.instance.currentUser!.email;

  Future<DocumentSnapshot> getProfileDoc() async {
    DocumentSnapshot profileDoc = await  FirebaseFirestore.instance.collection("User").doc(userEmail).get();
    return profileDoc;
  }
}