import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planzapp/Views/Home/MainScreen.dart';
import 'package:planzapp/Views/Preferences/PreferencesScreen.dart';
import 'package:planzapp/Views/SettingsUserAccount/SettingUserAccount.dart';
import 'package:planzapp/Views/Authentication/Signin_screen.dart';

class Settings_Screen extends StatelessWidget {


  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // Back button leads to profile side menu screen
          leading:
          IconButton(
            icon: Icon(Icons.chevron_left),
            iconSize: 30.0,
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) => MainScreen(),
                ),
                (Route route) => false,
          );
    }),
        title: Text('Settings'),
    ),
      body: Center (
        child: Column(
          children: [
          Row( 
              children: <Widget>[
                Expanded(
                  child: Text('Account', textAlign: TextAlign.left),
                ),
                Expanded(
                 child: IconButton(
                    icon: Icon(Icons.person),
                    color: Colors.lightBlue,
                    iconSize: 30.0,
                   onPressed: () {
                     Navigator.of(context).pushAndRemoveUntil(
                       MaterialPageRoute(
                         builder: (BuildContext context) => SettingUserAccount(),
                       ),
                           (Route route) => false,
                     );
                   },
                ),
                //shuffle, notifications, help, power_settings_new
              ),
              ]
          ),
          const Divider(
            color: Colors.grey,
            height: 20,
            thickness: 3,
            indent: 0,
            endIndent: 0,
          ),
          Row( 
            children: <Widget>[
              Expanded(
                child: Text('Preferences', textAlign: TextAlign.left),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.shuffle),
                  color: Colors.lightBlue,
                  iconSize: 30.0,
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) => PreferencesScreen(),
                      ),
                      (Route route) => false,
                    );
                }),
                //shuffle, notifications, help, power_settings_new
              ),
            ]
          ),
          const Divider(
            color: Colors.grey,
            height: 20,
            thickness: 3,
            indent: 0,
            endIndent: 0,
          ),
          
          Row( 
            children: <Widget>[
              Expanded(
                child: Text('Notifications', textAlign: TextAlign.left),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.notifications),
                  color: Colors.lightBlue,
                  iconSize: 30.0,
                    onPressed: () {
                      Navigator.pushNamed(context, "SettingNotification");
                    }
                ),
                //shuffle, notifications, help, power_settings_new
              ),
            ]
          ),
          const Divider(
            color: Colors.grey,
            height: 20,
            thickness: 3,
            indent: 0,
            endIndent: 0,
          ),
          Row( 
            children: <Widget>[
              Expanded(
                child: Text('Help & Feedback', textAlign: TextAlign.left),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.help),
                  color: Colors.lightBlue,
                  iconSize: 30.0,
                    onPressed: () {
                      Navigator.pushNamed(context, "HelpAndFeedback");
                    }

                ),
                //shuffle, notifications, help, power_settings_new
              ),
            ]
          ),
          const Divider(
            color: Colors.grey,
            height: 20,
            thickness: 3,
            indent: 0,
            endIndent: 0,
          ),
          Row( 
            children: <Widget>[
              Expanded(
                child: Text('Logout', textAlign: TextAlign.left),
              ),
              Expanded(
                child: IconButton(
                  onPressed: (){

                    auth.signOut();
                    // widget.auth.signOut();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) => SignInScreen(),
                      ),
                          (Route route) => false,
                    );


                  },
                  icon: Icon(Icons.power_settings_new),
                  color: Colors.lightBlue,
                  iconSize: 30.0,
                ),
                //shuffle, notifications, help, power_settings_new
              ),
            ]
          ),
        ],
      ),
      ),
    );
  }
}
