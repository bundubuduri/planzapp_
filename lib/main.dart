import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:planzapp/Services/Home/GetSideProfileImageService.dart';
import 'package:planzapp/Services/UserProfile/FriendStreamBuilderService.dart';
import 'package:planzapp/Services/UserProfile/GetDataService.dart';
import 'package:planzapp/Services/UserProfile/GetProfileDocService.dart';
import 'package:planzapp/Services/UserProfile/GetProfileImageService.dart';
import 'package:planzapp/Services/UserProfile/UserProfStreamBuilderService.dart';
import 'package:provider/provider.dart';
import 'package:planzapp/Views/Plans/AddDateAndTimeScreen.dart';
import 'package:planzapp/Views/Plans/AddLocationScreen.dart';
import 'package:planzapp/Views/Plans/AddPeopleScreen.dart';
import 'package:planzapp/Views/Plans/FavoritePlans.dart';
import 'package:planzapp/Views/Notifications/NotificationScreen.dart';
import 'package:planzapp/Views/Authentication/ResetPasswordScreen.dart';
import 'package:planzapp/Views/People/SearchPeople.dart';
import 'package:planzapp/Views/SettingsUserAccount/HelpAndFeedback.dart';
import 'package:planzapp/Views/SettingsUserAccount/SettingNotification.dart';
import 'package:planzapp/Views/SettingsUserAccount/SettingVisibility.dart';
import 'package:planzapp/Views/SettingsUserAccount/UpdateProfile.dart';
import 'package:planzapp/Views/UserProfile/MyProfile.dart';
import 'package:planzapp/Views/Plans/ViewItinerary.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Services/Home/GetSideDataService.dart';
import 'Services/Home/GetSideProfileDocService.dart';
import 'Services/Home/UserSideProfStreamBuilderService.dart';
import 'Views/Home/MainScreen.dart';
import 'Views/People/PeopleProfile.dart';
import 'Views/Authentication/Signin_screen.dart';
import 'Views/Authentication/Signup_screen.dart';
import 'package:location_permissions/location_permissions.dart';

import 'Views/UserProfile/Friends.dart';
import 'Views/Messages/ChatScreen.dart';
import 'Views/Messages/MessageHome.dart';
import 'Views/Messages/pagesViews/ChatScreenToSpecificUser.dart';
import 'Views/Messages/pagesViews/SearchScreen.dart';

import 'package:planzapp/Services/Utility/GetUserService.dart';
import 'package:planzapp/Services/Preferences/PrefUpdateService.dart';
import 'package:planzapp/Services/Preferences/PrefAnalyticsService.dart';
import 'package:planzapp/Models/Preferences/PrefModel.dart';
import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart' as PreferencesControllers;

import 'package:planzapp/Controllers/UserProfile/BaseUserProfileController.dart' as UserProfileControllers;


import 'Models/Notifications/NotificationsModel.dart';
import 'Controllers/Notifications/BaseNotificationsController.dart' as NotificationsControllers;
import 'Services/Notifications/NotificationUpdateService.dart';
import 'Services/Notifications/GetNotificationsService.dart';

import 'Controllers/Home/BaseHomeController.dart' as HomeControllers;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');

  runApp(MyApp());
  PermissionStatus permission =
      await LocationPermissions().requestPermissions();
  // runApp(MyApp(new SignInScreen()));

  // runApp(MaterialApp(
  //   home: email == null ? (new SignInScreen()) : (MainScreen()),
  // ));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  MyApp({this.prefs});

  // Widget _defaultHome;

  // MyApp (Widget w){
  //   _defaultHome = w;
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => PreferencesModel()),
        ChangeNotifierProvider(create: (c) => Notifications()),
        Provider(create: (c) => GetUserService()),
        Provider(create: (c) => PreferenceUpdateService()),
      //  Provider(create: (c) => PreferenceAnalyticsService()),
        Provider(create: (c) => NotificationUpdateService()),
        Provider(create: (c) => GetNotificationsService()),

        Provider(create: (c) => GetDataService() ),
        Provider(create: (c) => GetProfileDocService() ),
        Provider(create: (c) => GetProfileImageService()),
        Provider(create: (c) => UserProfStreamBuilderService()),
        Provider(create: (c) => FriendStreamBuilderService()),
        Provider(create: (c) => GetSideProfileImageService()),
        Provider(create: (c) => NotificationUpdateService()),
        Provider(create: (c) => GetNotificationsService()),

        Provider(create: (c) => GetSideDataService()),
        Provider(create: (c) => GetSideProfileDocService() ),
        Provider(create: (c) => GetSideProfileImageService()),
        Provider(create: (c) => UserSideProfStreamBuilderService()),



      ],
      child: Builder(builder: (context) {
          // Save a context our Controllers can use to access provided Models
          //and Services
          PreferencesControllers.init(context);
          NotificationsControllers.init(context);

          //Controllers.init(context);
          UserProfileControllers.init(context);

          PreferencesControllers.init(context);
          NotificationsControllers.init(context);

          HomeControllers.init(context);

          //return MaterialApp(home: AppScaffold());
    return MaterialApp(
      // home: ,
      // title: 'Sign Up Screen ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: 'SignIn',
      routes: {
        'FavoritePlans' : (context) => FavoritePlans(),
        'HelpAndFeedback' : (context) => HelpAndFeedback(),
        'SettingNotification' : (context) => SettingNotification(),
        'SettingVisibility' : (context) => SettingVisibility(),
        'UpdateProfile' : (context) => UpdateProfileScreen(),
        'ResetPassword' : (context) => ResetPasswordScreen(),
        'ViewItinerary' : (context) => ViewItinerary(plan: null,),
        'AddLocation' : (context) => AddLocationScreen(plan: null,),
        'AddDateAndTime' : (context) => AddDateAndTimeScreen(plan: null,),
        'AddPeople': (context) => AddPeopleScreen(plan: null,),
        // 'SignIn':(context)=> _defaultHome,
        'SignIn': (context) => SignInScreen(),
        'SignUp': (context) => SignUpScreen(),
        'Main': (context) => MainScreen(),
        //'MessageHome': (context) => HomeScreen(),
        'MessageSearchScreen': (context) => SearchScreen(),
        'ChatScreen': (context) => ChatScreen(),
        'SpecificUserChatScreen': (context) => ChatScreenToSpecificUser(),
        'SearchPeople' : (context) => SearchPeople(),
        'PeopleProfile' : (context) => PeopleProfile(),
        'MyProfile' : (context) => MyProfile(),
        "Friends" : (context)  => Friends(),
        "Notifications" : (context) => NotificationScreen(),
      },
      // home: _decideMainPage();,
    );
}),
    );
  }

  // _decideMainPage() {
  //   if (prefs.getBool('is_verified') != null) {
  //     if (prefs.getBool('is_verified')) {
  //       return HomePage(prefs: prefs);
  //       // return RegistrationPage(prefs: prefs);
  //     } else {
  //       return RegistrationPage(prefs: prefs);
  //     }
  //   } else {
  //     return SignUpScreen(prefs: prefs);
  //   }
  // }
}
