import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final currentUser = FirebaseAuth.instance;
  String searchKey;

  // List<String> userList;
  String query = "";
  TextEditingController searchController = TextEditingController();

  final _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  searchAppBar(BuildContext context) {
    return AppBar(
      // backgroundColorStart: UniversalVariables.gradientColorStart,
      // backgroundColorEnd: UniversalVariables.gradientColorEnd,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20),
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: TextField(
            controller: searchController,
            onChanged: (value) {
              setState(() {
                query = value;
              });
            },
            cursorColor: Colors.black,
            autofocus: true,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 35,
            ),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  query = "";
                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => searchController.clear());
                },
              ),
              border: InputBorder.none,
              hintText: "Search",
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Color(0x88ffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: searchAppBar(context),
      body: Column(children: [
        StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('User').snapshots(),
          builder: (context, snapshot) {
            List<ListTile> allUser = [];
            if (snapshot.hasData) {
              for (var c in snapshot.data.docs) {
                final email = c.get('email');
                final name = c.get('user_name');
                final id = c.get('user_id');
                if (query == null || query == "") {
                  allUser = [];
                  // print("empty now");
                } else if (name.contains(query)) {
                  ListTile temp = ListTile(
                    title: Text(email),
                    subtitle: Text("name: " + name),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        'ChatScreen',
                        arguments: {"receiverID": id, "receiverNAME": name},
                      );
                    },
                  );
                  allUser.add(temp);
                }
              }
            } else {
              Text("no data");
            }
            return Expanded(
              child: ListView(
                children: [
                  Column(children: allUser),
                ],
              ),
            );
          },
        ),
      ]),
    );
  }
}
