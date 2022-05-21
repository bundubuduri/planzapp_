import 'package:flutter/material.dart';
import 'package:planzapp/Models/Notifications/NotificationsModel.dart';
import 'package:planzapp/Services/Notifications/NotificationUpdateService.dart';
import 'package:planzapp/Services/Notifications/GetNotificationsService.dart';
import 'package:planzapp/Services/Utility/GetUserService.dart';
import 'package:provider/provider.dart';

BuildContext _mainContext;
// The controllers will use this to access the Provided models and services.
void init(BuildContext c) => _mainContext = c;

// Provide quick lookup methods for all the top-level models and services. Keeps the Controller code slightly cleaner.
class BaseNotificationsController {
  // Models
  Notifications notifications = _mainContext.read();

  // Services
NotificationUpdateService notificationUpdateService = _mainContext.read();
GetNotificationsService getNotificationsService = _mainContext.read();
  GetUserService getUserService = _mainContext.read();
}