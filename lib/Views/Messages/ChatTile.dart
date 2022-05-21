import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planzapp/Views/Messages/widgets/CustomTile.dart';

class ChatTile extends StatelessWidget {
  String userName;
  String message;
  String id;

  ChatTile(this.userName, this.message, this.id);

  @override
  Widget build(BuildContext context) {
    final _firestore = FirebaseFirestore.instance;
    final currentUser = FirebaseAuth.instance;

    return Dismissible(
      key: Key(userName),
      direction: DismissDirection.endToStart,

      //when dismissed deleted the whole discussion from DB
      onDismissed: (direction) {
        StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('messages').snapshots(),
          builder: (context, snapshot) {
            // List<Widget> chats = [];
            // List<String> ids = [];
            if (snapshot.hasData) {
              final content = snapshot.data.docs;
              final user = currentUser.currentUser.uid;

              for (var c in content) {
                final senderID = c.get('sender_id');
              }
            }
            return Column(
                // children: chats,
                );
          },
        );
      },

      child: CustomTile(
        mini: false,
        onTap: () {
          Navigator.pushNamed(
            context,
            'SpecificUserChatScreen',
            arguments: {"receiverID": id, "receiverNAME": userName},
          );
        },
        title: Text(
          userName,
          style:
              TextStyle(color: Colors.white, fontFamily: "Arial", fontSize: 19),
        ),
        subtitle: Text(
          message,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        leading: Container(
          constraints: BoxConstraints(maxHeight: 60, maxWidth: 60),
          child: Stack(
            children: <Widget>[
              CircleAvatar(
                maxRadius: 30,
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage('assets/images/planzapp_xl.jpg'),
                // backgroundImage: NetworkImage("https://yt3.ggpht.com/a/AGF-l7_zT8BuWwHTymaQaBptCy7WrsOD72gYGp-puw=s900-c-k-c0xffffffff-no-rj-mo"),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 13,
                  width: 13,
                  // decoration: BoxDecoration(
                  //   shape: BoxShape.circle,
                  //   color: Colors.lightBlue,
                  //   border: Border.all(color: Colors.black, width: 2),
                  // ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
