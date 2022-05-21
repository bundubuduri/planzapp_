import 'package:planzapp/Controllers/UserProfile/BaseUserProfileController.dart';



class GetProfileImageController extends BaseUserProfileController{

  Future<String> run() async {
    String profileImage = await getProfileImageService.getProfileImage();
    return profileImage;


  }

}
