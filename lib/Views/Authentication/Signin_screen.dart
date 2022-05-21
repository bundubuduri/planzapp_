import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:connectivity/connectivity.dart';
import 'package:planzapp/Views/Authentication/ResetPasswordScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:mongo_dart/mongo_dart.dart' as mango;
import 'package:flutter/gestures.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {



  /*
  Explanation that might be helpful when merge:

  when user click on either option, the first input box will update to the option, the options update to the other two
  for example, when click on sign in with username, input field will update to username and options will be email or phone number
  I'm storing the password and Email/Username/Phone Number in the variable mailOrUsernameOrPhoneNumber
  I keep tracking with what option we are using with the variable signInMethod, it has three possible values: "Email", "Username", and "Phone Number"
  we can check what option we are using when authenticating with database
   */


  Icon signInIcon = Icon(Icons.email);
  String signInMethod = "Email";


  final _auth = FirebaseAuth.instance;
  String emailOrPhone;
  String password;

  var smsCode;
  var _credential;


  bool showSpinner = false;

  bool isInternetOn = true;
  bool justLaunch = true;

  final _codeController = TextEditingController();

  Future LoginWithPhone(String mobile, BuildContext context) async{

    FirebaseAuth _authForPhone = FirebaseAuth.instance;
    _authForPhone.verifyPhoneNumber(
        phoneNumber: emailOrPhone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential authCredential){
          _authForPhone.signInWithCredential(_credential).then((result){

            Navigator.pushNamed(context, 'Main');

        }).catchError((e){
          print(e);
        });
        },
        verificationFailed: (authException){
          print(authException.message);
        },
        codeSent: (String verificationId, [int forceResendingToken]){
          //show dialog to take input from the user
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                title: Text("Enter SMS Code"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: _codeController,
                    ),

                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Done"),
                    textColor: Colors.white,
                    color: Colors.redAccent,
                    onPressed: () {
                      FirebaseAuth auth = FirebaseAuth.instance;

                      smsCode = _codeController.text.trim();

                      _credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
                      final user = _authForPhone.signInWithCredential(_credential).then((result){
                        Navigator.pushNamed(context, 'Main');
                      }).catchError((e){
                        print(e);
                      });
                      print("user is ");
                      print(user);
                    },
                  )
                ],
              )
          );
        },
        codeAutoRetrievalTimeout: (String verificationId){
          verificationId = verificationId;
          print(verificationId);
          print("Timout");
        }
    );
  }

  TextSpan signInOption(String option, Icon icon) {
    return TextSpan(
      text: option,
      style: TextStyle(
          color: Colors.teal, fontWeight: FontWeight.bold),
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          // single tapped
          print('Tap sign in with: ' + option);
          setState(() {
            signInMethod = option;
            signInIcon = icon;
          });
        },
    );
  }


  _checkInternetConnectivity() async {
    print('test00');
    var result = await Connectivity().checkConnectivity();
    if(result == ConnectivityResult.none){

      exit(0);

    }else{

      // print("INTERNET IS AVAILABLE!");
      setState(() {

        showSpinner = true;
      });

      try {
        print('test01');


        final user = await _auth.signInWithEmailAndPassword(
            email: emailOrPhone, password: password);
        print("user is ");
        print(user);
        if (user != null) {
          print('test02');
          Navigator.pushNamed(context, 'Main');
        }

        setState(() {
          print('test03');
          showSpinner = false;
        });
      }catch (e) {
        print('test99999999999999999999999');
        print(e);
        setState(() {
          showSpinner = false;
        });


        Fluttertoast.showToast(
          msg: "WRONG LOGIN INFORMATIONS ",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
        );


      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: ListView(
          children: <Widget>[
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/planzapp_xl.jpg'),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  IconButton(icon: signInIcon, onPressed: null),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 20, left: 10),
                      child: TextField(
                        onChanged: (value){
                          emailOrPhone = value;
                        },
                        decoration: InputDecoration(hintText: signInMethod),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            signInMethod == "Phone Number" ? SizedBox(height: 20,) :
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.lock), onPressed: null),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 20, left: 10),
                      child: TextField(
                        onChanged: (value){
                          password = value;
                        },
                        obscureText: true,
                        decoration: InputDecoration(hintText: 'Password'),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // SizedBox(
            //   height: 20,
            // ),


            // different sign in method, for next version
            // RichText(
            //   textAlign: TextAlign.center,
            //   text: TextSpan(
            //       text: 'Sign in with ',
            //       style: TextStyle(color: Colors.black),
            //       children:
            //       [
            //         signInMethod == "Email" ? signInOption("Phone Number", Icon(Icons.phone)) : signInOption("Email", Icon(Icons.email)),
            //       ]
            //
            //       // signInMethod == "Email" ?
            //       // [
            //       //   signInOption("Username", Icon(Icons.person)),
            //       //   TextSpan(
            //       //     text: ' or ',
            //       //     style: TextStyle(color: Colors.black),
            //       //   ),
            //       //   signInOption("Phone Number", Icon(Icons.phone)),
            //       // ] :
            //       // signInMethod == "Username" ?
            //       // [
            //       //   signInOption("Email", Icon(Icons.person)),
            //       //   TextSpan(
            //       //     text: ' or ',
            //       //     style: TextStyle(color: Colors.black),
            //       //   ),
            //       //   signInOption("Phone Number", Icon(Icons.phone)),
            //       // ] :
            //       // [
            //       //   signInOption("Username", Icon(Icons.person)),
            //       //   TextSpan(
            //       //     text: ' or ',
            //       //     style: TextStyle(color: Colors.black),
            //       //   ),
            //       //   signInOption("Email", Icon(Icons.phone)),
            //       // ]
            //
            //   ),
            //
            // ),

            SizedBox(
              height: 10,
            ),

            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "forgot password?",
                  style: TextStyle(
                      color: Colors.teal, fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // single tapped
                      Navigator.pushNamed(context, 'ResetPassword');

                    },
                )

            ),



            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: 60,
                  child: RaisedButton(
                    onPressed: () async {

                      print("PRESSED SINGIN BUTTON!!!");

                      if (signInMethod == "Email") {
                        _checkInternetConnectivity();
                      } else {
                        LoginWithPhone(emailOrPhone.trim(), context);
                      }

                      print("user after set ");
                      print(FirebaseAuth.instance.currentUser);

                      print('testAFTER00');

                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setString('email', emailOrPhone);
                      // connectDB();

                      // _checkInternetConnectivity();

                      // setState(() {
                      //   showSpinner = true;
                      // });
                      //
                      // try {
                      //   final user = await _auth.signInWithEmailAndPassword(
                      //       email: email, password: password);
                      //
                      //   if (user != null) {
                      //     Navigator.pushNamed(context, 'Home');
                      //   }
                      //
                      //   setState(() {
                      //     showSpinner = false;
                      //   });
                      // }catch (e) {
                      //   print(e);
                      // }

                    },
                    color: Color(0xFF00a79B),
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'SignUp');
              },
              child: Center(
                child: RichText(
                  text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'SIGN UP',
                          style: TextStyle(
                              color: Colors.teal, fontWeight: FontWeight.bold),
                        )
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

