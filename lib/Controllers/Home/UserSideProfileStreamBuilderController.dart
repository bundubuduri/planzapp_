import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planzapp/Controllers/Home/BaseHomeController.dart';

class UserSideProfileStreamBuilderController extends BaseHomeController{
  Stream<QuerySnapshot> run() {

    return  userProfSideStreamBuilderService.getUserSideProfStreamBuilder();
  }
}