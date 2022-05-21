
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planzapp/Controllers/UserProfile/BaseUserProfileController.dart';


class GetProfileDocController extends BaseUserProfileController{

 Future<DocumentSnapshot> run() async{
   DocumentSnapshot profileDoc = await getProfileDocService.getProfileDoc();

   return profileDoc;
 }
  }

