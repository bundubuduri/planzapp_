import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class GetSideProfileDocService {
  String userEmail = FirebaseAuth.instance.currentUser.email;

  Future<DocumentSnapshot> getSideProfileDoc() async {
    DocumentSnapshot sideProfileDoc = await  FirebaseFirestore.instance.collection("User").doc(userEmail).get();
    return sideProfileDoc;
  }
}


