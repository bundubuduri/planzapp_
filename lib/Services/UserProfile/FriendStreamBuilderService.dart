
import 'package:cloud_firestore/cloud_firestore.dart';

class FriendStreamBuilderService{

  final _firestore = FirebaseFirestore.instance;

      Stream<QuerySnapshot> getFriendStreamBuilder () {

        return _firestore.collection('User').snapshots();

      }



}