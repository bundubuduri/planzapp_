import 'package:flutter/material.dart';
import 'package:planzapp/Views/Home/MainScreen.dart';
import 'package:planzapp/Views/Authentication/ResetPasswordScreen.dart';
import 'package:planzapp/Views/SettingsUserAccount/UpdateProfile.dart';


class SettingUserAccount extends StatelessWidget {
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
        title: Text('User Account Settings'),
      ),
      body: Center (
        child: Column(
          children: [
            Row(
                children: <Widget>[
                  Expanded(
                    child: Text('Update Profile', textAlign: TextAlign.left),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.person),
                      color: Colors.lightBlue,
                      iconSize: 30.0,
                      onPressed: () {
                        Navigator.pushNamed(context, 'UpdateProfile');
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
                    child: Text('Visibility', textAlign: TextAlign.left),
                  ),
                  Expanded(
                    child: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        iconSize: 30.0,
                        onPressed: () {
                          Navigator.pushNamed(context, 'SettingVisibility');
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
                    child: Text('Reset Password', textAlign: TextAlign.left),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.security),
                      iconSize: 30.0,
                      onPressed: () {
                        Navigator.pushNamed(context, 'ResetPassword');
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

          ],
        ),
      ),
    );
  }
}
