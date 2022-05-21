import 'package:flutter/cupertino.dart';
import 'package:planzapp/util/Plan.dart';
class Notifications extends ChangeNotifier{
  var notificationType  = "";
  var timeStamp = "";
  var planId = "";
  var planTitle = "";
  var notificationId = "";
  var userViewed = false;

  Notifications({
    var notificationType,
    var timeStamp,
    var planId,
    var planTitle,
    var userViewed,
    var notificationId,
})
  {if(notificationType != null){
    this.notificationType = notificationType;
  }
  if(timeStamp != null){
    this.timeStamp = timeStamp;
  }
  if(planId != null){
    this.planId = planId;
  }
  if(planTitle != null){
    this.planTitle = planTitle;
  }
  if(userViewed != null){
    this.userViewed = userViewed;
  }
  if(notificationId != null){
    this.notificationId = notificationId;
  }
  }
}