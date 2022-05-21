import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../Preferences/BasePreferencesController.dart';
import 'package:planzapp/Services/Utility/GetUserService.dart';

class GetUserController extends BasePreferencesController {

  Future<User> run() async {
    User userAuthSuccess = await getUserService.getCurrentUser();

    // Return the result to whoever called us, in case they care
    return userAuthSuccess;
  }


}
