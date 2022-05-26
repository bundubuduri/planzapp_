import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
User? loggedInUser;
final currentUser = FirebaseAuth.instance;
var receiverIDforMessage;
var nameOnTopOfBubble;

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);


const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);


class ChatScreen extends StatefulWidget {

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  // final _auth = FirebaseAuth.instance;

  String? messageText;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nameOnTopOfBubble = arguments['receiverNAME'];
    receiverIDforMessage = arguments['receiverID'];
    // if (arguments != null) print(arguments['receiverID']);

    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                // _auth.signOut();

                Navigator.pop(context);
              }),
        ],
        title: Text("Chat with " + arguments['receiverNAME']),
        backgroundColor: Colors.teal[400],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageTextController.clear();
                      _firestore.collection('messages').add({
                        'time_stamp' : Timestamp.now(),
                        'message': messageText,
                        'receiver_id': arguments['receiverID'],
                        'name_receiver' : arguments['receiverNAME'],
                        'sender_id' : currentUser.currentUser!.uid,
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      //order the table chronologicaly so messages appears in the right order
      stream: _firestore.collection('messages').orderBy('time_stamp').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data!.docs.reversed;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {

          //this is the content of the sender's message
          final messageText = message.get('message');

          //this is the name of the who should receiver the message
          final nameReceiver = message.get('name_receiver');

          //this is this ID who should receive the message
          final idReceiver = message.get('receiver_id');

          //this is the ID of the sender of the message
          final id = message.get('sender_id');

          //check the message of the sender, if sender is the right one
          if(idReceiver == currentUser.currentUser!.uid){

            //check if sender's id is the same as the appbar sender id
            if(receiverIDforMessage == id) {
              final messageBubble = MessageBubble(
                // sender: nameReceiver,
                sender: id,
                text: messageText,
                isMe: (currentUser.currentUser!.uid == id),
              );

              messageBubbles.add(messageBubble);
            }
          }

          //check the message of the sender, if the receiver and the sender matches for the right discussion
          //other users cannot access other's discussion
          // if(currentUser.currentUser.uid == id && idReceiver == receiverIDforMessage){
          //   final messageBubble = MessageBubble(
          //     // sender: nameReceiver,
          //     sender: nameOnTopOfBubble,
          //     text: messageText,
          //     isMe: (currentUser.currentUser.uid == id),
          //   );
          //
          //   messageBubbles.add(messageBubble);
          // }




          // if( (id == currentUser.currentUser.uid) || (id == receiverIDforMessage)){
          //
          //     final messageBubble = MessageBubble(
          //       sender: nameReceiver,
          //       text: messageText,
          //       isMe: (currentUser.currentUser.uid == id),
          //     );
          //     messageBubbles.add(messageBubble);
          //
          // }




          //
          //
          // if(  receiverIDforMessage == id  ){
          //
          //   final messageBubble = MessageBubble(
          //     sender: nameReceiver,
          //     text: messageText,
          //     isMe: (currentUser.currentUser.uid == id),
          //   );
          //   messageBubbles.add(messageBubble);
          //
          // }

          // final messageBubble = MessageBubble(
          //   // sender: nameReceiver,
          //   sender: nameOnTopOfBubble,
          //   text: messageText,
          //   isMe: (currentUser.currentUser.uid == id),
          // );
          //
          // messageBubbles.add(messageBubble);


        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text, this.isMe});

  final String? sender;
  final String? text;
  final bool? isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
        isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender!,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: isMe!
                ? BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0))
                : BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            elevation: 5.0,
            color: isMe! ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text!,
                style: TextStyle(
                  color: isMe! ? Colors.white : Colors.black54,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
