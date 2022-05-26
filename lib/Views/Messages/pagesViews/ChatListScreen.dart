import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planzapp/Views/Messages/widgets/CustomTile.dart';

import '../ChatTile.dart';

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  String? currentUserId;
  String? initials;

  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    currentUserId = _auth.currentUser!.uid;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Chat'),
        actions: [
          IconButton(icon: Icon(Icons.create), onPressed: (){
            Navigator.pushNamed(context, 'MessageSearchScreen');
          }),
        ],
      ),
      // floatingActionButton: NewChatButton(),
      body: ChatListContainer(currentUserId),
    );
  }
}

class ChatListContainer extends StatefulWidget {
  final String? currentUserId;

  ChatListContainer(this.currentUserId);

  @override
  _ChatListContainerState createState() => _ChatListContainerState();
}

class _ChatListContainerState extends State<ChatListContainer> {

  final _firestore = FirebaseFirestore.instance;
  final currentUser = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: <Widget>[

          StreamBuilder<QuerySnapshot>(

            stream: _firestore.collection('messages').orderBy('time_stamp').snapshots(),
            builder: (context, snapshot){
              List<Widget> chats = [];
              List<String?> ids = [];
              if(snapshot.hasData){

                final content = snapshot.data!.docs;

                for(var c in content){

                  final username = c.get('name_receiver');
                  final previewMessage = c.get('message');

                  String? contactIDSender = c.get('sender_id');
                  String? contactIDReceiver = c.get('receiver_id');


                    if (!(ids.contains(contactIDReceiver))) {
                      if ((currentUser.currentUser!.uid == contactIDReceiver) ||
                          (currentUser.currentUser!.uid == contactIDSender)) {
                        ids.add(contactIDReceiver);


                        chats.add(ChatTile(
                            username, previewMessage, contactIDReceiver));
                    }
                  }
                }


              }
              return Column(
                children: chats,
              );
            },
          ),

        ],
      ),
    );


  }
}

class UserCircle extends StatelessWidget {
  final String text;

  UserCircle(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.amber,
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue,
                fontSize: 13,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.black, width: 2),
                  color: Colors.greenAccent),
            ),
          )
        ],
      ),
    );
  }
}


