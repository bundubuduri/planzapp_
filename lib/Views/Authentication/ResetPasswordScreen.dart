
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:http/http.dart' as http;


class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {


  final _auth = FirebaseAuth.instance;
  Timer timer;
  User user;

  String email;

  Future sendResetPasswordEmail(String e) async{
    Uri url = Uri.parse('https://us-central1-planzapp-2c02d.cloudfunctions.net/sendResetMail?dest=' + e);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print("Success to send message");
      return response;

    } else {

      // If the server did not return a 200 OK response,

      // then throw an exception.

      throw Exception('Failed to send message');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
          children: <Widget>[

            BackButtonWidget(),
            SizedBox(
              height: 20,
            ),

            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Row(
            //     children: <Widget>[
            //       Expanded(
            //         child: Container(
            //           margin: EdgeInsets.only(right: 20, left: 10),
            //           child: Text(
            //             'You will receive an email to reset your password',
            //             textAlign: TextAlign.center,
            //           )
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.email), onPressed: null),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 20, left: 10),
                      child: TextField(
                        onChanged: (value){
                          email = value;
                        },
                        decoration: InputDecoration(hintText: "Email"),
                      ),
                    ),
                  ),
                ],
              ),
            ),


            SizedBox(
              height: 20,
            ),


            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: 60,
                  child: RaisedButton(
                    onPressed: () async {
                      print("PRESSED Reset Password BUTTON!!!");
                      sendResetPasswordEmail(email);
                      // _auth.sendPasswordResetEmail(email: email).whenComplete(() => sendResetPasswordEmail(email));

                    },
                    color: Color(0xFF00a79B),
                    child: Text(
                      'Reset Password',
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
                    'Reset Your Password',
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