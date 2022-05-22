import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class GetProfileImageService{
  String? userEmail = FirebaseAuth.instance.currentUser!.email;

  Future<String> getProfileImage() async {
    final ref = FirebaseStorage.instance.ref().child('profile_images/' + userEmail! + ".png");
    // no need of the file extension, the name will do fine.
    var profileImageUrl = await ref.getDownloadURL();
    print(profileImageUrl);
    return profileImageUrl;
  }
}