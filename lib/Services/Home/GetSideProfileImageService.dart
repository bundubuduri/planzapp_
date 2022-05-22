import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class GetSideProfileImageService{
  String? userEmail = FirebaseAuth.instance.currentUser!.email;

  Future<String> getProfileImage() async {
    final ref = FirebaseStorage.instance.ref().child('profile_images/' + userEmail! + ".png");
    var profileImageUrl = await ref.getDownloadURL();
    print(profileImageUrl);
    return profileImageUrl;
  }
}