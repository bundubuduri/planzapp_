import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planzapp/Controllers/UserProfile/FriendStreamBuilderController.dart';


class Friends extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {

  String id;
  @override
  void initState() {
    super.initState();
  }


    final currentUser = FirebaseAuth.instance;
    final _firestore =  FirebaseFirestore.instance;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(),
        body: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FriendStreamBuilderController().run(),
              builder: (context, snapshot) {
                List<ListTile> friends = [];
                var f = [];
                var names = [];

                if (snapshot.hasData) {
                  for (var c in snapshot.data.docs) {
                    if (currentUser.currentUser.uid == c.get('user_id')) {
                      f.add(c.get('friends'));
                    }
                  }

                  for (var c in f) {
                    for (var f in c){
                      for (var d in snapshot.data.docs) {
                        if (f == d.get('user_id')) {
                          friends.add(new ListTile(
                            title: Text(d.get('planzID')),
                            onTap: () {
                              Navigator.pushNamed(context, 'PeopleProfile',
                                arguments: {"profileID": d.get('user_id'), "profileNAME": d.get('planzID')},);

                            },
                          ));
                          names.add(d.get('planzID'));
                        }
                      }

                    }
                  }
                  names.sort();

                } else {
                  Text("no friends");
                }
                return Expanded(
                  child: ListView(
                    children: [
                      Column(
                        children: ListTile.divideTiles(
                          color: Colors.black,
                          context: context,
                          tiles: friends,
                        ).toList(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      );
    }
  }

