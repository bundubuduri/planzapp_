import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';


class GetPlanImageService{

  String? userEmail = FirebaseAuth.instance.currentUser!.email;

  Future<String> getPlanImage() async {
    final ref = FirebaseStorage.instance.ref().child('plan_images/' + userEmail! + ".png");
    // no need of the file extension, the name will do fine.
    var planImageUrl = await ref.getDownloadURL();
    print(planImageUrl);
    return planImageUrl;
  }
}
