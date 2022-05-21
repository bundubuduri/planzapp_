
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planzapp/Controllers/Home/BaseHomeController.dart';


class GetSideProfileDocController extends BaseHomeController{

  Future<DocumentSnapshot> run() async{
    DocumentSnapshot sideProfileDoc = await getSideProfileDocService.getSideProfileDoc();

    return sideProfileDoc;
  }
}

