import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planzapp/Controllers/UserProfile/BaseUserProfileController.dart';

class UserProfileStreamBuilderController extends BaseUserProfileController{
  Stream<QuerySnapshot> run() {

  return  userProfStreamBuilderService.getUserProfStreamBuilder();
}
}