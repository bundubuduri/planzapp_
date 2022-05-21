import 'package:flutter/material.dart';
import 'package:planzapp/Services/People/PeopleUpdateService.dart';
import 'package:planzapp/Services/Utility/GetUserService.dart';
import 'package:provider/provider.dart';

BuildContext _mainContext;
// The controllers will use this to access the Provided models and services.
void init(BuildContext c) => _mainContext = c;

// Provide quick lookup methods for all the top-level models and services. Keeps the Controller code slightly cleaner.
class BasePeopleController {
  // Models

  // Services
  GetUserService getUserService = _mainContext.read();
  PeopleUpdateService peopleUpdateService = _mainContext.read();
}
