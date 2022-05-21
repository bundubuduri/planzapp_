// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final _firestore = Firestore.instance;
//   final _auth = FirebaseAuth.instance;
//   User loggedInUser;
//   String messageText;
//
//   static const kMessageTextFieldDecoration = InputDecoration(
//     contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//     hintText: 'Type your message here...',
//     border: InputBorder.none,
//   );
//
//   static const kMessageContainerDecoration = BoxDecoration(
//     border: Border(
//       top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
//     ),
//   );
//
//   static const kSendButtonTextStyle = TextStyle(
//     color: Colors.lightBlueAccent,
//     fontWeight: FontWeight.bold,
//     fontSize: 18.0,
//   );
//
//   void getMessages() async {
//     final messages = await _firestore.collection('messages').getDocuments();
//     for (var m in messages.documents) {
//       print(m.data());
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     getCurrentUser();
//   }
//
//   void getCurrentUser() async {
//     try {
//       final user = await _auth.currentUser;
//       if (user != null) {
//         loggedInUser = user;
//         print(loggedInUser.email);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               decoration: kMessageContainerDecoration,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Expanded(
//                     child: TextField(
//                       onChanged: (value) {
//                         messageText = value;
//                       },
//                       decoration: kMessageTextFieldDecoration,
//                     ),
//                   ),
//                   Expanded(
//                     child: FlatButton(onPressed: (){
//                       getMessages();
//                     }, child: Text('getDATA')),
//                   ),
//                   FlatButton(
//                     onPressed: () {
//                       _firestore.collection("messages").add({
//                         'text': messageText,
//                         'sender': loggedInUser.email,
//                       });
//                     },
//                     child: Text(
//                       'send',
//                       style: kSendButtonTextStyle,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             RaisedButton(
//               onPressed: () async {
//                 _auth.signOut();
//                 Navigator.pop(context);
//               },
//               color: Color(0xFF00a79B),
//               child: Text(
//                 'LOG OUT',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
