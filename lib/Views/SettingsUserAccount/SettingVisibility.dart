import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planzapp/util/universalVariables.dart';
import 'package:planzapp/util/universalMethods.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingVisibility extends StatefulWidget {
  @override
  _SettingVisibilityState createState() => _SettingVisibilityState();
}

class _SettingVisibilityState extends State<SettingVisibility> {

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  static late User loggedInUser;
  double visibilityIndex = 0;
  String? visibilityString = "";
  bool dbVisibilityAll = false;
  bool dbVisibilityConnected = false;
  bool dbVisibilityNone = false;
  String dbVisibility = "";

  @override
  void initState() {
    super.initState();
    print("Visibility page opened");
    getCurrentUser();
    getVisibility();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  getVisibility() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    visibilityString = prefs.getString('visibility');
    if (visibilityString == "None"){
      dbVisibilityNone = true;
      dbVisibilityConnected = false;
      dbVisibilityAll = false;
    }
    if (visibilityString == "Connected"){
      dbVisibilityNone = false;
      dbVisibilityConnected = true;
      dbVisibilityAll = false;
    }
    if (visibilityString == "All"){
      dbVisibilityNone = false;
      dbVisibilityConnected = false;
      dbVisibilityAll = true;
    }
    setState(() {
    });
  }

  setVisibility() async{
    final _auth = FirebaseAuth.instance;
    var userEmail = _auth.currentUser!.email;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (dbVisibilityNone == true){
      DocumentReference reference =  FirebaseFirestore.instance
          .doc("User/" + userEmail.toString());
      reference.update({
        'visibility' : "None",
      });
      prefs.setString('visibility', "None");
    }
    if (dbVisibilityConnected == true){
      DocumentReference reference =  FirebaseFirestore.instance
          .doc("User/" + userEmail.toString());
      reference.update({
        'visibility' : "Connected",
      });
      prefs.setString('visibility', "Connected");
    }
    if (dbVisibilityAll == true){
      DocumentReference reference =  FirebaseFirestore.instance
          .doc("User/" + userEmail.toString());
      reference.update({
        'visibility' : "All",
      });
      prefs.setString('visibility', "All");
    }
  }

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    var userEmail = _auth.currentUser!.email;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[

          BackButtonWidget(),
          //VisibilityPreferencesWidget(),
          SizedBox( height: 20,),

          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                dbVisibilityNone == true ? "I'm not visible to any users" :
                dbVisibilityConnected == true ? "I'm only visible to Users Connected to me" :
                dbVisibilityAll == true ? "I'm visible to all users" : "Visibility not set",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  foreground: Paint()
                    ..color = Colors.blue[700]!,
                ),
              )
          ),


          Row (
              children: <Widget>[

                // Invisible to All Users Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Invisible to All Users',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: dbVisibilityNone,
                    onChanged: (bool newValue) {
                      setState(() {
                        dbVisibilityNone = newValue;
                      });
                      if (dbVisibilityNone == true){
                          setState(() {
                            dbVisibilityConnected = false;
                            dbVisibilityAll = false;
                          });
                      }
                      // save user invisible to all preference
                      setVisibility();
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // Visible to Users Connected to Me
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Visible to Users Connected to Me',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: dbVisibilityConnected,
                    onChanged: (bool newValue) {
                      setState(() {
                        dbVisibilityConnected = newValue;
                      });
                      if (dbVisibilityConnected == true){
                        setState(() {
                          dbVisibilityNone = false;
                          dbVisibilityAll = false;
                        });
                      }
                      // save user Visible to Users Connected to Me preferences
                      setVisibility();
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]
          ),

          Row (
              children: <Widget>[

                // Visible to All Users Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Visible to All Users',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: dbVisibilityAll,
                    onChanged: (bool newValue) {
                      setState(() {
                        dbVisibilityAll = newValue;
                      });
                      if (dbVisibilityAll == true){
                        setState(() {
                          dbVisibilityNone = false;
                          dbVisibilityConnected = false;
                        });
                      }
                      // save user Visible to All Users preference
                      setVisibility();
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

              ]
          ),

          SizedBox( height: 20,),
          SizedBox(
            height: 10,
          ),
          // Uploader(file: imageFile),
        ],
      ),
    );
  }
}


class BackButtonWidget extends StatefulWidget {
  BackButtonWidget({Key? key}) : super(key: key);
  @override
  _BackButtonWidget createState() => _BackButtonWidget();
}

class _BackButtonWidget extends State<BackButtonWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/planzapp_xl.jpg'))),
      child: Positioned(
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 20,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Text(
                        'Back',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              Positioned(
                bottom: 20,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Set Visibility to Other Users',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
