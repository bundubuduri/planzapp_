
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:planzapp/Services/Home/GetSideDataService.dart';
import 'package:planzapp/Services/Home/GetSideProfileDocService.dart';
import 'package:planzapp/Services/Home/GetSideProfileImageService.dart';
import 'package:planzapp/Services/Home/UserSideProfStreamBuilderService.dart';
import 'package:provider/provider.dart';

late BuildContext _mainContext;
// The controller will use this access the Provided models and services
void init(BuildContext c) => _mainContext = c;

class BaseHomeController{
  // Models

  //Services
  GetSideDataService getSideDataService = _mainContext.read();
  GetSideProfileDocService getSideProfileDocService = _mainContext.read();
  GetSideProfileImageService getSideProfileImageService = _mainContext.read();
  UserSideProfStreamBuilderService userProfSideStreamBuilderService= _mainContext.read();




}

