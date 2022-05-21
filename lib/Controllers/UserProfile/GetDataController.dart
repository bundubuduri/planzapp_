import 'package:planzapp/Controllers/UserProfile//BaseUserProfileController.dart';

class GetDataController extends BaseUserProfileController {

  Future<String> run(String id) async{

    String userId = await getDataService.getData(id);

    return userId;
  }
}