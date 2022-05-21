import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:planzapp/Views/Preferences/PreferencesScreen.dart';
import 'package:planzapp/Views/SettingsUserAccount/SettingUserAccount.dart';
import 'package:planzapp/Views/Authentication/Signin_screen.dart';
import 'package:planzapp/Views/SettingsUserAccount/Settings_Screen.dart';
import 'package:planzapp/Controllers/Home/GetSideProfileImageController.dart';

class ProfileSideMenu extends StatefulWidget {
  final FirebaseAuth auth;

  const ProfileSideMenu({Key key, this.auth}) : super(key: key);

  @override
  _ProfileSideMenuState createState() => _ProfileSideMenuState();
}

class _ProfileSideMenuState extends State<ProfileSideMenu> {
  String userEmail = FirebaseAuth.instance.currentUser.email;

  @override
  void initState() {
    super.initState();
    getSideData();
  }

  final _firestore = FirebaseFirestore.instance;
  final currentUser = FirebaseAuth.instance;
  var name = "";

  void getSideData() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('User').get();

    snapshot.docs.forEach(
      (element) {
        // print("element: " + element.get('user_name'));
        if (element.get('user_id') == currentUser.currentUser.uid) {
          // profileName = element.get('user_name');
          name = element.get('user_name');
        }
      },
    );
  }

  // var userName = "";
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // var email = prefs.getString('email');

  //Method to get username to appear || not working!
  // void getUserName()async {
  //
  //   await StreamBuilder(
  //     stream: _firestore.collection("User").snapshots(),
  //     builder: (context, snapshot) {
  //       final users = snapshot.data.documents;
  //       print("working");
  //       for ( var user in users) {
  //         if (currentUser.currentUser.uid == user.get('user_id')) {
  //           userName = user.get('user_name');
  //           print('done');
  //         }
  //       }
  //     }
  //   );
  // }

  // FirebaseAuth _auth;
  // ProfileSideMenu(FirebaseAuth auth) {
  //   _auth = auth;
  // }

  @override
  Widget build(BuildContext context) {
    String email = currentUser.currentUser.email;
    // getUserName();

    return Drawer(
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text(name),
            accountEmail: Text(email),
            currentAccountPicture: FutureBuilder(
              future: GetSideProfileImageController().run(),
              builder: (context, AsyncSnapshot<String> url) {
                if (url.hasData) {
                  return Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(url.data),
                          fit: BoxFit.cover,
                        )),
                  );
                } else if (url == null) {
                  return Text("No image");
                }
                return CircularProgressIndicator();
              },
            ),
            otherAccountsPictures: <Widget>[
              //new CircleAvatar(
              //backgroundColor: Colors.white,
              //child: new Text('Settings'),
              //),
              /*
              IconButton(
                  icon: Icon(Icons.settings),
                  color: Colors.grey,
                  iconSize: 30.0,
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) => Settings_Screen(),
                      ),
                      (Route route) => false,
                    );
                  }),
    */
            ],
          ),
          new ListTile(
            leading: Icon(Icons.person, color: Colors.teal[100]),
            title: Text("Profile"),
            onTap: () {
              Navigator.pushNamed(context, 'MyProfile');
            },
          ),
          new ListTile(
            leading: Icon(Icons.settings, color: Colors.teal[100]),
            title: Text("Account"),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) => SettingUserAccount(),
                ),
                (Route route) => false,
              );
            },
          ),
          new ListTile(
            leading: Icon(Icons.shuffle, color: Colors.teal[100]),
            title: Text("Preferences"),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) => PreferencesScreen(),
                ),
                (Route route) => false,
              );
            },
          ),
          new ListTile(
            leading: Icon(Icons.notifications, color: Colors.teal[100]),
            title: Text("Notifications"),
            onTap: () {
              Navigator.pushNamed(context, "SettingNotification");
            },
          ),
          new ListTile(
            leading: Icon(Icons.help, color: Colors.teal[100]),
            title: Text("Help & Feedback"),
            onTap: () {
              Navigator.pushNamed(context, "HelpAndFeedback");
            },
          ),
          new ListTile(
            leading: Icon(Icons.power_settings_new, color: Colors.teal[100]),
            title: Text("Logout"),
            onTap: () {
              // print("loggin out");
              widget.auth.signOut();
              // Navigator.pushNamed(context, 'SignIn');
              // Navigator.of(context).pushReplacementNamed('Signin');
              // Navigator.pop(context);
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) => SignInScreen(),
                ),
                (Route route) => false,
              );
            },
          )
        ],
      ),
    );
  }
}
