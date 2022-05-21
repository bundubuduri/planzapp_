import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planzapp/util/universalVariables.dart';
import 'package:planzapp/util/universalMethods.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingNotification extends StatefulWidget {
  @override
  _SettingNotificationState createState() => _SettingNotificationState();
}


class _SettingNotificationState extends State<SettingNotification> {


  bool inAppNotification;
  bool emailNotification;

  // load from local prefs, its the same as what's on database
  getVisibility() async {
    final prefs = await SharedPreferences.getInstance();

    if(inAppNotification == null) {
      setState(() {
        inAppNotification = prefs.getBool('inAppNotification') ?? false;
      });
    }

    if(emailNotification == null) {
      setState(() {
        emailNotification = prefs.getBool('emailNotification') ?? false;
      });
    }


  }

  @override
  Widget build(BuildContext context) {

    getVisibility();

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[

          BackButtonWidget(),

          SizedBox( height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "In App",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      foreground: Paint()
                        ..color = Colors.blue[700],
                    ),
                  )
              ),
              SizedBox( height: 20,),
              Switch(
                value: inAppNotification,
                onChanged: (value){
                  setState(() {
                    inAppNotification=value;
                    print(inAppNotification);
                  });
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              ),
            ],
          ),
          SizedBox( height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Email",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      foreground: Paint()
                        ..color = Colors.blue[700],
                    ),
                  )
              ),
              SizedBox( height: 20,),
              Switch(
                value: emailNotification,
                onChanged: (value){
                  setState(() {
                    emailNotification=value;
                    print(emailNotification);
                  });
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              ),
            ],
          ),





          SizedBox(
            height: 10,
          ),


          // Uploader(file: imageFile),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 60,
                child: RaisedButton(
                  onPressed: () async {
                    final _auth = FirebaseAuth.instance;
                    var userEmail = _auth.currentUser.email;

                    DocumentReference reference =  FirebaseFirestore.instance
                        .doc("User/" + userEmail.toString());
                    reference.update({
                      'inAppNotification' : inAppNotification,
                      'emailNotification' : emailNotification,
                    });
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool('inAppNotification', inAppNotification);
                    prefs.setBool('emailNotification', emailNotification);

                    Fluttertoast.showToast(
                      msg: "Notification Setting Saved",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                    );

                    // print("save");
                    // print(inAppNotification);
                    // print(emailNotification);

                    Navigator.pop(context);

                  },
                  color: Color(0xFF00a79B),
                  child: Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}




class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    Key key,
  }) : super(key: key);

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
                    'Set Your Notification Preference',
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
