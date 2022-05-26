

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planzapp/Views/Plans/PlanButtonWidget.dart';
import 'package:planzapp/Views/Plans/ViewItinerary.dart';
import 'package:planzapp/util/Plan.dart';
import 'package:planzapp/util/universalMethods.dart';
import 'package:planzapp/util/universalVariables.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';

class FavoritePlans extends StatefulWidget {

  @override
  _FavoritePlansState createState() => _FavoritePlansState();
}

class _FavoritePlansState extends State<FavoritePlans> {

  final firestoreInstance =FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final _firestore =FirebaseFirestore.instance;
  List<dynamic>? dbFavoritePlans = [];
  Stream userDoc =FirebaseFirestore.instance
      .collection('User')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

  @override
  void initState() {
    super.initState();
    getFavoritePlans();
    print("Favorite Plans Page Opened");
    setState(() {});
  }

  void getFavoritePlans() async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    try {
      Stream reference = FirebaseFirestore.instance
          .collection('User')
          .doc(loggedInUser.uid.toString())
          .snapshots();
      reference.listen((value){
        dbFavoritePlans = value.data()['favoritePlans'];
      });
    } catch (e) {
      print(e);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal[400],
        title: Text(
          'PlanZapp',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.search),
          //   onPressed: () {
          //     Navigator.pushNamed(context, 'SearchPeople');
          //   },
          // ),
          // IconButton(
          //   icon: Icon(Icons.send),
          //   onPressed: () {
          //     Navigator.pushNamed(context, 'MessageHome');
          //   },
          // ),
        ],
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Favorite Plans",
              textAlign: TextAlign.center,
            ),
          ),
          Column(
            children: [
              for (var plan1 in dbFavoritePlans!)
                StreamBuilder<DocumentSnapshot>(
                    stream: _firestore.collection('Plans').doc(plan1)
                        .snapshots(),
                    builder: (context, snapshot) {
                      List<Widget> plansWidget = [];
                      final content1 = snapshot.data;
                      if (snapshot.hasData) {
                        final content1 = snapshot.data!;

                        // for (var c in content1){
                        final contentToDisplay = PlanButtonWidget(
                            content1, content1.get('favorite'));
                        plansWidget.add(contentToDisplay);
                        //}
                      }

                      return Column(
                        children: plansWidget,
                      );
                    }
                ),
            ],
          ),
        ],
      ),
    );
  }
}
