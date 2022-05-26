import 'package:planzapp/Controllers/Notifications/BaseNotificationsController.dart';

class NotificationUpdateController extends BaseNotificationsController {

  void run(String? notificationId) async {
    notificationUpdateService.updateUserViewed(notificationId);
  }

}