import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planzapp/Views/Notifications/NotificationButtonWidget.dart';
import 'package:planzapp/Controllers/Notifications/GetNotificationsController.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      backgroundColor: Colors.grey,
      body: ListView(
        children: <Widget>[
          StreamBuilder(
              stream: GetNotificationsController().run(),
              builder: (context, snapshot){
                List<Widget> notificationsWidget = [];
                if(snapshot.hasData){
                  final content = (snapshot.data! as QuerySnapshot).docs;

                  for (var c in content){

                    final contentToDisplay = NotificationsButtonWidget(
                        c);

                    notificationsWidget.add(contentToDisplay);
                  }
                }
                return Column(
                  children: notificationsWidget,
                );
              })
        ],
      ),

    );
  }
}
