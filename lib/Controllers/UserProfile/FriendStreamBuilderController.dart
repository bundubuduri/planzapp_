

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planzapp/Controllers/UserProfile/BaseUserProfileController.dart';

class FriendStreamBuilderController extends BaseUserProfileController{

  Stream<QuerySnapshot> run() {
     return friendStreamBuilderService.getFriendStreamBuilder();
  }
}