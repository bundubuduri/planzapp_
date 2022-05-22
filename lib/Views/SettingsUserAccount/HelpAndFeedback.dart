import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planzapp/util/universalVariables.dart';
import 'package:planzapp/util/universalMethods.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class HelpAndFeedback extends StatefulWidget {
  @override
  _HelpAndFeedbackState createState() => _HelpAndFeedbackState();
}

class _HelpAndFeedbackState extends State<HelpAndFeedback> {
  String? dropdownValue = "Help";
  var helpTopic = "";
  var help = "";
  var feedback = "";

  var textEditingController1 = TextEditingController();
  var textEditingController2 = TextEditingController();

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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['Help', 'Feedback']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          dropdownValue == "Help"
              ? Expanded(
                  child: Container(
                      margin: EdgeInsets.only(right: 20, left: 10),
                      child: TextField(
                        controller: textEditingController1,
                        style: TextStyle(color: Colors.black),
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 25,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Help Topic",
                        ),
                        onChanged: (value) {
                          helpTopic = value;
                        },
                      )),
                )
              : SizedBox(
                  height: 20,
                ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(right: 20, left: 10),
                child: TextField(
                  controller: textEditingController2,
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 250,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Details",
                  ),
                  onChanged: (value) {
                    if (dropdownValue == "Help") {
                      help = value;
                    } else if (dropdownValue == "Feedback") {
                      feedback = value;
                    }
                  },
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 60,
                child: RaisedButton(
                  onPressed: () async {
                    // Navigator.pop(context);

                    textEditingController1.text = "";
                    textEditingController2.text = "";

                    String username = '1c4e33b4-35c0-479b-a7e8-a235a4f54445';
                    String password = '1c4e33b4-35c0-479b-a7e8-a235a4f54445';
                    final smtpServer = SmtpServer('smtp.postmarkapp.com',
                        username: username, password: password);
                    final message = Message();

                    final _auth = FirebaseAuth.instance;

                    if (dropdownValue == "Help") {
                      FirebaseFirestore.instance
                          .doc("Help_Feedback/Help")
                          .collection(_auth.currentUser!.email.toString())
                          .add({
                        'topic': helpTopic,
                        'help': help,
                      }).then((value) {
                        //print(value.documentID);
                      });

                      message
                        ..from = Address(
                            'bundu@planzapp.app', 'planzApp Help Request')
                        ..recipients.add('admin@planzapp.app')
                        ..subject =
                            'Help Request from ${_auth.currentUser!.email} on Your planzApp'
                        ..html =
                            "<p>Time: ${DateTime.now()}</p>\n<p>Topic: $helpTopic</p>\n<p>Content: $help</p>\n<p>A copy of this help request is saved in your Firebase.</p>";
                    } else if (dropdownValue == "Feedback") {
                      FirebaseFirestore.instance
                          .doc("Help_Feedback/Feedback")
                          .collection(_auth.currentUser!.email.toString())
                          .add({
                        'feedback': feedback,
                      }).then((value) {
                        //print(value.documentID);
                      });

                      // Create message.
                      message
                        ..from = Address(
                            'no-reply@planzapp.app', 'planzApp Feedback')
                        ..recipients.add('admin@planzapp.app')
                        ..subject =
                            'planzApp got a Feedback from ${_auth.currentUser!.email}'
                        ..html =
                            "<p>Time: ${DateTime.now()}</p>\n<p>Content: $feedback</p>\n<p>A copy of this feedback is saved in your Firebase.</p>";
                      //print(feedback);
                    }

                    try {
                      final sendReport = await send(message, smtpServer);
                      print('Message sent: ' + sendReport.toString());
                    } on MailerException catch (e) {
                      print('Message not sent.');
                      print(e);
                      for (var p in e.problems) {
                        print('Problem: ${p.code}: ${p.msg}');
                      }
                    }

                    Fluttertoast.showToast(
                      msg: dropdownValue! + " has been sent.",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                    );
                  },
                  color: Color(0xFF00a79B),
                  child: Text(
                    'Send',
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
    Key? key,
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
                'Get Help or Share Feedback',
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
