import 'package:flutter/material.dart';
import 'package:planzapp/Services/UserProfile/FriendStreamBuilderService.dart';
import 'package:planzapp/Services/UserProfile/GetProfileDocService.dart';
import 'package:planzapp/Services/UserProfile/GetDataService.dart';
import 'package:planzapp/Services/UserProfile/GetProfileImageService.dart';
//import 'package:planzapp/Services/Plan/GetPlanImageService.dart';
import 'package:planzapp/Services/UserProfile/UserProfStreamBuilderService.dart';
import 'package:provider/provider.dart';



BuildContext _mainContext;
// The controllers will use this to access the Provided models and services.
void init(BuildContext c) => _mainContext = c;

// Provide quick lookup methods for all the top-level models and services. Keeps the Command code slightly cleaner.
class BaseUserProfileController {

  // Services
  GetDataService getDataService = _mainContext.read();
  GetProfileDocService getProfileDocService = _mainContext.read();
  GetProfileImageService getProfileImageService = _mainContext.read();
  UserProfStreamBuilderService userProfStreamBuilderService= _mainContext.read();
  FriendStreamBuilderService friendStreamBuilderService = _mainContext.read();
  //GetPlanImageService getPlanImageService = _mainContext.read();

}