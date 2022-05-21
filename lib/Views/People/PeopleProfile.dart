import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:planzapp/Controllers/People/AddFriendDataController.dart';
import 'package:planzapp/Controllers/People/GetCurrentFriendStatusController.dart';
import 'package:planzapp/Controllers/People/RemoveFriendDataController.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';

final _firestore = FirebaseFirestore.instance;
User loggedInUser;
final currentUser = FirebaseAuth.instance;
String profileID;

String profileName;

class PeopleProfile extends StatefulWidget {
  @override
  _PeopleProfileState createState() => _PeopleProfileState();
}

class _PeopleProfileState extends State<PeopleProfile> {
  final _auth = FirebaseAuth.instance;


  // void getCurrentUser() async {
  //   try {
  //     final user = await _auth.currentUser;
  //     if (user != null) {
  //       loggedInUser = user;
  //       print(loggedInUser.email);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  String addRemoveText= "";

  void getCurrentFriendStatus() async {
    //loggedInUser = await GetCurrentDataController().run();
    // setState(() {});
  }

  void addFriendData(String id, String email, String pID, String pNAME) async {
    //await AddDataController().run();

    //code below goes to PeopleUpdateSerivce

    // try{
    //   DocumentReference reference = Firestore.instance
    //       .doc("User/" + loggedInUser.email.toString() + "/friends/Friends_lists");
    //   reference.update({
    //     pID : pNAME
    //   });
    // }catch(e){
    //   print(e);
    // }
    //
    //
    // DocumentReference docRef =
    //     await Firestore.instance.collection('User').document(email);
    //
    // DocumentSnapshot doc = await docRef.get();
    //
    // // List friends = doc.get('friends');
    //
    // docRef.update(
    //   {
    //     'friends': FieldValue.arrayUnion([id])
    //   },
    // );

  }

  void removeFriendData(String id, String email, String pID, String pNAME) async {
    //await RemoveDataController().run();

    // CollectionReference friendsRef =
    // await Firestore.instance.collection('User').document(email).collection('friends');

    // friendsRef.add(
    //   {
    //     'Friends_lists': FieldValue.arrayUnion([id])
    //   },
    // );

    //code below goes to PeopleUpdateSerivce

    // try{
    //   DocumentReference reference = Firestore.instance
    //       .doc("User/" + loggedInUser.email.toString() + "/friends/Friends_lists");
    //   reference.update({
    //     pID : FieldValue.arrayRemove([pNAME])
    //   });
    // }catch(e){
    //   print(e);
    // }
    //
    //
    //
    // DocumentReference docRef =
    //     await Firestore.instance.collection('User').document(email);
    //
    // DocumentSnapshot doc = await docRef.get();
    //
    // // List friends = doc.data['friends'];
    //
    // docRef.update(
    //   {
    //     'friends': FieldValue.arrayRemove([id])
    //   },
    // );

    // Firestore.instance.collection(city).document('Attractions').updateData({"data": FieldValue.arrayUnion(obj)});
  }

  // final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();

  }

  void getCurrentUser() async {
    loggedInUser = await GetUserController().run();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    profileID = arguments['profileID'];
    profileName = arguments['profileNAME'];

    getCurrentFriendStatus();


    void addOrRemove() async{


    }

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: null,
        title: Text(profileName + "'s profile"),
        backgroundColor: Colors.teal[400],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //PICTURE
            Container(
              color: Colors.green,
              child: Row(

                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 28, top: 7),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          AssetImage('assets/images/planzapp_xl.jpg'),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 38),
                        child: Text(
                          profileName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Text(profileName),
            RaisedButton(
              child: Text( addRemoveText ),
              onPressed: () async {

                addOrRemove();

                String username = '1c4e33b4-35c0-479b-a7e8-a235a4f54445';
                String password = '1c4e33b4-35c0-479b-a7e8-a235a4f54445';
                final smtpServer = SmtpServer('smtp.postmarkapp.com', username: username, password: password);
                final message = Message();


                final _auth = FirebaseAuth.instance;


                  message
                    ..from = Address('litian@planzapp.app', 'Friend request')
                    ..recipients.add('guillaume.tuahivaatetonohiti@gmail.com')
                    ..subject = 'Help Request from ${_auth.currentUser.email} on Your planzApp'
                    ..html = "<p>Time: ${DateTime.now()}</p>\n<p>Topic: Friend request</p>\n<p>Content: this person wants to add you as a friend</p>\n";

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
                  msg:  "request has been sent.",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                );


                // final Email email = Email(
                //   body: 'FRIEND ADDED',
                //   subject: 'Email subject',
                //   recipients: ['guillaume.tuahivaatetonohiti@gmail.com'],
                //   // cc: ['cc@example.com'],
                //   // bcc: ['bcc@example.com'],
                //   attachmentPaths: [],
                //   isHTML: false,
                // );
                //
                // await FlutterEmailSender.send(email);


                // sendEmail();
                // sendSMS();

                print("ADDING FRIENDS HERE");
                // print(loggedInUser.email.toString());


                addFriendData(profileID, loggedInUser.email.toString(), profileID, profileName);


              },
            ),
            RaisedButton(
              child: Text("remove friend"),
              onPressed: () async {
                // print("ADDING FRIENDS HERE");
                print(loggedInUser.email.toString());
                removeFriendData(profileID, loggedInUser.email.toString(), profileID, profileName);
              },
            )
          ],
        ),
      ),
    );
  }
}
