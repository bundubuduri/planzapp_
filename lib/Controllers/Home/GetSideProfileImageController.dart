import 'package:planzapp/Controllers/Home/BaseHomeController.dart';



class GetSideProfileImageController extends BaseHomeController{

  Future<String> run() async {
    String profileImage = await getSideProfileImageService.getProfileImage();
    return profileImage;


  }

}
