import 'package:flutter/material.dart';
import 'package:planzapp/Services/Preferences/PrefUpdateService.dart';
import 'package:planzapp/Services/Preferences/PrefAnalyticsService.dart';
import 'package:planzapp/Models/Preferences/PrefModel.dart';
import 'package:planzapp/Services/Utility/GetUserService.dart';
import 'package:provider/provider.dart';

BuildContext _mainContext;
// The controllers will use this to access the Provided models and services.
void init(BuildContext c) => _mainContext = c;

// Provide quick lookup methods for all the top-level models and services. Keeps the Controller code slightly cleaner.
class BasePreferencesController {
  // Models
 PreferencesModel preferencesModel = _mainContext.read();

  // Services
  PreferenceUpdateService preferenceUpdateService = _mainContext.read();
  PreferenceAnalyticsService preferenceAnalyticsService = _mainContext.read();
  GetUserService getUserService = _mainContext.read();
}
