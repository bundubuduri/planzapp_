//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:planzapp/Controllers/UserProfile/UserProfileStreamBuilderController.dart';
import 'package:planzapp/Views/Plans/PlanButtonWidget.dart';
import 'package:planzapp/Views/Plans/CreatePlan.dart';
import 'package:planzapp/util/Plan.dart';
import 'package:planzapp/Controllers/UserProfile/GetProfileImageController.dart';
import 'package:planzapp/Controllers/UserProfile/GetProfileDocController.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  //String userEmail = FirebaseAuth.instance.currentUser.email;
  var numOfAcceptedPlans = 0;
  var numOfDeclinedPlans = 0;
  var numOfPlansCreated = 0;
  var numOfUpcomingPlans = 0;
  var displayContent = [
    "planzID",
    "last_name",
    "first_name",
    "email",
    "phone",
    "dob",
    "location"
  ];
  final Future<DocumentSnapshot> profileDoc = GetProfileDocController().run();
  var currentPlans = "all";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Container(
            padding: EdgeInsets.all(0.0),
            child: ListView(
              children: [
                SizedBox(height: 15),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    //Profile Picture Stack code
                    Positioned(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: FutureBuilder(
                          future: GetProfileImageController().run(),
                          builder: (context, AsyncSnapshot<String> url) {
                            if (url.hasData) {
                              //print(url.data);
                              return Container(
                                width: 75,
                                height: 75,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.teal,
                                      width: 5,
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(url.data!),
                                      fit: BoxFit.cover,
                                    )),
                              );
                            } else if (url == null) {
                              return Text("No image");
                            }
                            return CircularProgressIndicator();
                          },
                        ),
                      ),
                    ),

                    Positioned(
                      left: 320,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.edit),
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.pushNamed(context, 'UpdateProfile');
                          },
                        ),
                      ),
                    ),
                    Positioned(
                        top: 40,
                        left: 280,
                        child: Container(
                            child: FlatButton(
                          textColor: Colors.blue,
                          splashColor: Colors.blueAccent,
                          child: Text("+ New Plan"),
                          onPressed: () {
                            Plan plan = new Plan(
                              planEventPlanners: [
                                FirebaseAuth.instance.currentUser!.uid
                              ],
                              planStatus: "Planning",
                              planInternalUsers: [
                                FirebaseAuth.instance.currentUser!.email
                                    .toString()
                              ], //+ " : " + FirebaseAuth.instance.currentUser.email],
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreatePlan(
                                          plan: plan,
                                        )));
                          },
                        ))),
                    //First and Last Name Stack Code
                    Positioned(
                        left: 100,
                        top: 10,
                        child: FutureBuilder<DocumentSnapshot>(
                            future: GetProfileDocController().run(),
                            builder: (BuildContext context,
                                AsyncSnapshot<DocumentSnapshot> profileDoc) {
                              if (profileDoc.data !=
                                  null) /* if (profileDoc.data[displayContent[2]] != null && profileDoc.data[displayContent[1]] != null)*/ {
                                return Text(
                                    profileDoc.data![displayContent[2]] +
                                        " " +
                                        profileDoc.data![displayContent[1]],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold));
                              }
                              return CircularProgressIndicator();
                            })),

                    //Location Stack Code
                    Positioned(
                        left: 100,
                        top: 25,
                        child: FutureBuilder(
                            future: GetProfileDocController().run(),
                            builder: (context,
                                AsyncSnapshot<DocumentSnapshot> profileDoc) {
                              if (profileDoc.data != null) {
                                return Text(profileDoc.data![displayContent[6]],
                                    style: TextStyle(
                                      fontSize: 12,
                                    ));
                              } else if (profileDoc == null) {
                                return Text("No profileDoc");
                              }
                              return CircularProgressIndicator();
                            })),

                    SizedBox(height: 10),
                    //Username Display
                    Positioned(
                        top: 40,
                        left: 100,
                        child: FutureBuilder(
                            future: GetProfileDocController().run(),
                            builder: (context,
                                AsyncSnapshot<DocumentSnapshot> profileDoc) {
                              if (profileDoc.data !=
                                  null) /*(profileDoc.data[displayContent[0]] != null)*/ {
                                return Text(
                                    "@" + profileDoc.data![displayContent[0]],
                                    style: TextStyle(
                                      fontSize: 12,
                                    ));
                              } else if (profileDoc == null) {
                                return Text("No profileDoc");
                              }
                              return CircularProgressIndicator();
                            })),
                  ],
                ),
                SizedBox(height: 20),

                /*Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 20, left: 10),
                    child:
                    FutureBuilder(
                      future: GetProfileDocController().run(),
                      builder: (context, AsyncSnapshot<DocumentSnapshot> profileDoc) {
                        if (profileDoc.data != null) {

                          var displayContent = ["user_name","last_name","first_name","email","phone","dob","location"];
                          List<Widget> listViewContent = new List<Widget>();
                          for(int i =0; i < displayContent.length; i ++) {
                            if (profileDoc.data[displayContent[i]] != null) {
                              listViewContent.add(
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(displayContent[i]),
                                      ],
                                    ),
                                    SizedBox(height: 20, width: 20,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(profileDoc.data[displayContent[i]]),
                                      ],
                                    )
                                  ],
                                )
                              );
                            }
                          }


                          return Column(
                            children: listViewContent,
                          );

                        } else if (profileDoc == null) {
                          return Text("No profileDoc");
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
              ],
            ),
          )*/

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: UserProfileStreamBuilderController().run(),
                    builder: (context, snapshot) {
                      List<Widget> plansWidget = [];

                      if (snapshot.hasData) {
                        final allPlans = snapshot.data!.docs;
                        numOfPlansCreated = allPlans.length;
                        numOfUpcomingPlans = 0;
                        for (var c in allPlans) {
                          final contentToDisplay =
                              PlanButtonWidget(c, c.get('favorite'));
                          print("looping through plans");
                          if (currentPlans == "all") {
                            plansWidget.add(contentToDisplay);
                          } else if (currentPlans == "upcoming_plans") {
                            if (c.get("status") == "Not Started") {
                              plansWidget.add(contentToDisplay);
                            }
                          } else if (currentPlans == "plans_created") {
                            plansWidget.add(contentToDisplay);
                          }

                          if (c.get("status") == "Not Started") {
                            numOfUpcomingPlans++;
                          }

                          if (c.get("status") == "Planning") {
                            numOfUpcomingPlans++;
                          }
                        }
                      }

                      plansWidget.insert(
                          0,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FlatButton(
                                    textColor: Colors.blue,
                                    splashColor: Colors.blueAccent,
                                    child: Text("Accepted Plans: " +
                                        numOfAcceptedPlans.toString()),
                                    onPressed: () {
                                      print("press accepted plans");
                                      setState(() {
                                        currentPlans = "accepted_plans";
                                      });
                                    },
                                  ),
                                  SizedBox(width: 25),
                                  FlatButton(
                                    // color: Colors.blue,
                                    textColor: Colors.blue,
                                    splashColor: Colors.blueAccent,
                                    child: Text("Declined Plans: " +
                                        numOfDeclinedPlans.toString()),
                                    onPressed: () {
                                      print("press declined plans");
                                      setState(() {
                                        currentPlans = "declined_plans";
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FlatButton(
                                    // color: Colors.blue,
                                    textColor: Colors.blue,
                                    splashColor: Colors.blueAccent,
                                    child: Text("Upcoming Plans: " +
                                        numOfUpcomingPlans.toString()),
                                    onPressed: () {
                                      print("press upcoming plans");
                                      setState(() {
                                        currentPlans = "upcoming_plans";
                                      });
                                    },
                                  ),
                                  SizedBox(width: 25),
                                  FlatButton(
                                    // color: Colors.blue,
                                    textColor: Colors.blue,
                                    splashColor: Colors.blueAccent,
                                    child: Text("Created Plans: " +
                                        numOfPlansCreated.toString()),
                                    onPressed: () {
                                      print("press created plans");
                                      setState(() {
                                        currentPlans = "created_plans";
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ));

                      return Column(
                        children: plansWidget,
                      );
                    },
                  ),
                ),
              ],
            )));
  }
}
