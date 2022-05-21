
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfStreamBuilderService {
  final _auth = FirebaseAuth.instance;

  final _firestore = FirebaseFirestore.instance;


  Stream<QuerySnapshot> getUserProfStreamBuilder() {
    return _firestore
        .collection('Plans')
        .where('internalUsers', arrayContains: FirebaseAuth.instance.currentUser.email)
        .snapshots();
}
}