import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planzapp/Controllers/Notifications/BaseNotificationsController.dart';
import 'package:planzapp/Services/Notifications/GetNotificationsService.dart';

class GetNotificationsController extends BaseNotificationsController {

  Stream<QuerySnapshot>  run() {
    return getNotificationsService.getNotifications();
  }

}
