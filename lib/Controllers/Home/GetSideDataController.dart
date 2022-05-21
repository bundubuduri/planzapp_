import 'package:planzapp/Controllers/Home//BaseHomeController.dart';

class GetSideDataController extends BaseHomeController {

  Future<String> run(String id) async{

    String userId = await getSideDataService.getSideData(id);

    return userId;
  }
}