
//import 'dart:html';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'PlanButtonWidget.dart';
import 'package:animations/animations.dart';
import 'package:planzapp/Views/Authentication/Signup_screen.dart';
import 'package:planzapp/util/Plan.dart';
import 'package:planzapp/util/universalMethods.dart';
import 'package:planzapp/util/universalVariables.dart';
import 'CreatePlan.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';


class PlanScreen extends StatefulWidget {

  @override
  _PlanScreenState createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  static User? loggedInUser;
  //final firestoreInstance = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;


  String? searchKey;

  // List<String> userList;
  String query = "";
  TextEditingController searchController = TextEditingController();


  @override
  void initState(){
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    loggedInUser = await GetUserController().run();
    setState(() {});
  }



  //Data stream getting queries from the plans collection in firebase.
  // void dataStream() async{
  //   await for (var snapshot in _firestore.collection('plans').snapshots()){
  //     for(var plans in snapshot.documents) {
  //       print(plans.get('description'));
  //     }
  //   }
  // }



  @override
  Widget build(BuildContext context) {


return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView(
        children: <Widget>[
/*
          Padding(
            padding: const EdgeInsets.all(20.0),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 60,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "FavoritePlans");
                  },
                  color: Color(0xFF00a79B),
                  child: Text(
                    'Faves',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
*/
        //search bar
          Container(
              padding: const EdgeInsets.all(16.0),
              margin: new EdgeInsets.symmetric(horizontal: 20.0),
              child : new TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                },
            decoration: new InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.close, color: Colors.grey[400]),
                onPressed: () {
                  query = "";
                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => searchController.clear());
                },
              ),
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(20.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[800]),
                hintText: "Search Plans...",
                fillColor: Colors.white70),
                // myIcon is a 48px-wide widget.
              )
          ),
          /*
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Container(
              margin: EdgeInsets.only(left:10, right:10, bottom:10, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    width: 3,
                    color: Colors.grey[400]),
              ),
            child: Container(
              margin: EdgeInsets.only(left:10, right:10, bottom:10, top: 10),

              child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              cursorColor: Colors.grey[400],
              autofocus: true,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.close, color: Colors.grey[400]),
                  onPressed: () {
                    query = "";
                    WidgetsBinding.instance
                        .addPostFrameCallback((_) => searchController.clear());
                  },
                ),
                border: InputBorder.none,
                hintText: "Search...",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          ),
    ),*/

/*
this is from the search page

          Column(children: [
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('User').snapshots(),
              builder: (context, snapshot) {
                List<ListTile> allUser = [];

                if (snapshot.hasData) {
                  for (var c in snapshot.data.documents) {
                    final email = c.get('email');
                    final name = c.get('user_name');
                    final id = c.get('user_id');
                    if (query == null || query == "") {
                      allUser = [];
                      // print("empty now");
                    } else if (name.contains(query)) {
                      ListTile temp = ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                          AssetImage('assets/images/planzapp_xl.jpg'),
                        ),
                        title: Text(name),
                        // subtitle: Text("name: " + name),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            'PeopleProfile',
                            arguments: {"profileID": id, "profileNAME": name},
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
                      Column(
                        children: ListTile.divideTiles(
                          color: Colors.black,
                          context: context,
                          tiles: allUser,
                        ).toList(),
                        // allUser,
                      ),
                    ],
                  ),
                );
              },
            ),
          ]),
*/
          // create plan buttons from plans that contain the current user
          StreamBuilder(
            stream:
            // _firestore.collection('plans').snapshots(),
            _firestore
                .collection('Plans')
                .where('planInternalUsers', arrayContains: loggedInUser!.uid.toString())
                .snapshots(),
            builder: (context, snapshot){
              print(loggedInUser!.uid.toString());
              List<Widget> plansWidget = [];
              if(snapshot.hasData){
                final content = snapshot.data.docs;

                for(var c in content){
                  final contentToDisplay = PlanButtonWidget(c, c.get('planFavorite'));
                  // Add button to list
                    plansWidget.add(contentToDisplay);
                }

              }
              return Column(
                children: plansWidget,
              );
            },
          ),

        ],
      ),

      // A Create new plan button
      floatingActionButton: OpenContainer(
        transitionType: _transitionType,
        openBuilder: (BuildContext context, VoidCallback _) {
          print("you are creating this plan: ");
          Plan plan = new Plan(planEventPlanners: [FirebaseAuth.instance.currentUser!.uid],
            planStatus: "Planning",
            planInternalUsers: [FirebaseAuth.instance.currentUser!.uid.toString()], //+ " : " + FirebaseAuth.instance.currentUser.email],
          );

          return CreatePlan(plan: plan,);
        },
        closedElevation: 3.0,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(56 / 2),
          ),
        ),
        closedColor: Theme.of(context).colorScheme.secondary,
        closedBuilder: (BuildContext context, VoidCallback openContainer) {
          return SizedBox(
            height: 56,
            width: 56,
            child: Center(
              child: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          );
        },
      ),
    );
  }
}
