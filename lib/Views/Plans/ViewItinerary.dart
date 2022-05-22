import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planzapp/Views/Plans/AddLocationScreen.dart';
import 'package:planzapp/Views/Plans/AddPeopleScreen.dart';
import 'package:planzapp/util/Plan.dart';
import 'package:planzapp/util/universalMethods.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maps_launcher/maps_launcher.dart';


class ViewItinerary extends StatefulWidget {

  Plan plan;
  ViewItinerary({required this.plan});

  @override
  _ViewItineraryState createState() => _ViewItineraryState();
}

class _ViewItineraryState extends State<ViewItinerary> {

  final descriptionTextFieldController = TextEditingController();
  var descriptionEditing = false;
  final priceTextFieldController = TextEditingController();
  var priceEditing = false;
  var allUsers = List<dynamic>();

  @override
  void initState(){
    super.initState();
    getAllUsers();
  }

  Widget listUsers(List<dynamic> strings)
  {
    List<Widget> list = new List<Widget>();

    for(var i = strings.length - 1; i > -1; i--){
      String userID = strings[i];
      String? userNameEmail = "";
      for(var i = allUsers.length - 1; i > -1; i--){
        if (allUsers[i].toString().contains(userID)) {
          userNameEmail = allUsers[i].split(" : ")[0];// + " : " + allUsers[i].split(" : ")[1];
        }
      }
      list.add(
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(userNameEmail!),
            ],
          ),
        ),
      );
    }
    return new Column(children: list);
  }

  Widget listPlaces(List<dynamic> strings)
  {
    List<Widget> list = new List<Widget>();

    for(var i = strings.length - 1; i > -1; i--){
      String placeName = strings[i].split("&")[2].split(",")[0];
      var placeAddressList = strings[i].split("&")[2].split("|")[0].split(",");
      placeAddressList.removeAt(0);
      var placeAddress;
      if (placeAddressList.length != 0) {
        placeAddress = placeAddressList.toString().substring(1, placeAddressList.toString().length - 2);
      } else {
        placeAddress = "";
      }

      list.add(
        Padding(
          padding: const EdgeInsets.all(5.0),

          child:
          Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // tap place to open map and show current place info
                        GestureDetector(
                            onTap: (){

                              print(widget.plan.show());

                              print("place clicked");
                              print(placeName + placeAddress);
                              MapsLauncher.launchQuery(placeName + placeAddress);
                            },
                            child: new Container(
                              width: 500.0,
                              //padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                              color: Colors.white,
                              child: new Column(
                                  children: [
                                    Text(placeName),
                                    Text(placeAddress,),
                                  ]
                              ),
                            )
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 3,
                      thickness: 0.5,
                      indent: 30,
                      endIndent: 30,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
    return new Column(children: list);
  }

  Widget listPlacesDetails(List<dynamic> strings)
  {
    List<Widget> list = new List<Widget>();

    for(var i = strings.length - 1; i > -1; i--){
      String placeName = strings[i].split("&")[2].split(",")[0];
      String placeDate = strings[i].split("&")[0];
      String placeTime = strings[i].split("&")[1];
      var placeAddressList = strings[i].split("&")[2].split("|")[0].split(",");
      placeAddressList.removeAt(0);
      // var placeAddress;
      // if (placeAddressList.length != 0) {
      //   placeAddress = placeAddressList.toString().substring(1, placeAddressList.toString().length - 2);
      // } else {
      //   placeAddress = "";
      // }
      list.add(
        Padding(
          padding: const EdgeInsets.all(5.0),
          child:
              Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(placeDate),
                            Text(placeTime),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(placeName),
                            //Text(placeAddress,),
                          ],
                        ),
                        const Divider(
                          color: Colors.black,
                          height: 3,
                          thickness: 0.5,
                          indent: 30,
                          endIndent: 30,
                        ),
                      ],
                    ),
                  )
                ],
              ),
        ),
      );
    }
    return new Column(children: list);
  }

  // get all users from the data base, so that we can match user_id to username for users
  Future<dynamic> getAllUsers() async {
    final QuerySnapshot result = await FirebaseFirestore.instance.collection('User').get();
    final List<DocumentSnapshot> docs = result.docs;

    print("getting all users");
    docs.forEach((data) => allUsers.contains(data.id) ? print("duplicate") : allUsers.add(data.id));

    for (int i = 0; i < allUsers.length; i ++) {
      DocumentSnapshot<Map<String, dynamic>> variable = await FirebaseFirestore.instance.collection('User').doc(allUsers[i]).get();

      var tempUserName = variable.data()!['planzID'];
      var tempUserId = variable.data()!['user_id'];
      var tempEmail = variable.data()!['email'];
      allUsers[i] = tempUserName + ' : ' + tempEmail + ' : ' + tempUserId;

    }
    setState(() {

    });
    // print(allUsers.length);
    //print(allUsers);
  }

  @override
  Widget build(BuildContext context) {
    descriptionTextFieldController.text = widget.plan.planDescription;
    priceTextFieldController.text = widget.plan.planPrice;

   /* if (launch) {
      // get all users from the data base once when this page is created
      getAllUsers();
      launch = false;
    }*/


    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[ 
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Itinerary",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  foreground: Paint()
                    ..color = Colors.teal[600]!,
                ),
              )
          ),

          IconButton(icon: widget.plan.planFavorite ? Icon(Icons.star) : Icon(Icons.star_border),
              onPressed: () {
                print("favorite plan");
                setState(() {
                  widget.plan.planFavorite = !widget.plan.planFavorite;
                });
                widget.plan.planFavoriteTime = DateTime.now().toString();
              }),

          Padding(
              padding: const EdgeInsets.all(20.0),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.plan.planTitle == null ? " " :
                    widget.plan.planTitle,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      foreground: Paint()
                        ..color = Colors.teal[600]!,
                    ),
                  ),
                ],
              )
          ),


          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                widget.plan.planPlacesWithTime.length == 0 ? " " :
                "plan starts at " + widget.plan.planPlacesWithTime[0].split("&")[0] + " on " + widget.plan.planPlacesWithTime[0].split("&")[1],
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  foreground: Paint()
                    ..color = Colors.teal[600]!,
                ),
              )
          ),

          Padding(
              padding: const EdgeInsets.all(20.0),
              child:
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Description",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17,
                          foreground: Paint()
                            ..color = Colors.teal[600]!,
                        ),
                      ),
                      descriptionEditing ? IconButton(icon: Icon(Icons.check),
                          onPressed: () {
                            Fluttertoast.showToast(
                              msg: "Description Updated",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                            );
                            setState(() {
                              descriptionEditing = false;
                            });
                          }) :
                      IconButton(icon: Icon(Icons.edit),
                          onPressed: () {
                        print("editing description");
                        setState(() {
                          descriptionEditing = true;
                        });
                      }),

                    ],
                  ),

                  // allow user to edit right here
                  TextField(
                    minLines: 1,
                    maxLines: 10,
                    controller: descriptionTextFieldController,
                    enabled: descriptionEditing,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      widget.plan.planDescription = value;
                    },
                    decoration: InputDecoration(hintText: " ",
                      border: descriptionEditing ?
                      OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.red,
                            width: 5.0),
                      )
                     : InputBorder.none,
                      ),
                  ),
                ],
              )
          ),

          Padding(
              padding: const EdgeInsets.all(20.0),
              child:
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Price",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17,
                          foreground: Paint()
                            ..color = Colors.teal[600]!,
                        ),
                      ),
                      priceEditing ? IconButton(icon: Icon(Icons.check),
                          onPressed: () {
                            Fluttertoast.showToast(
                              msg: "Price Updated",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                            );
                            setState(() {
                              priceEditing = false;
                            });
                          }) :
                      IconButton(icon: Icon(Icons.edit),
                          onPressed: () {
                            setState(() {
                              priceEditing = true;
                            });
                          }),
                    ],
                  ),
                  // allow user to edit right here
                  TextField(
                    minLines: 1,
                    maxLines: 1,
                    controller: priceTextFieldController,
                    enabled: priceEditing,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      widget.plan.planPrice = value;
                    },
                    decoration: InputDecoration(hintText: " ",
                      border: priceEditing ?
                      OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.red,
                            width: 5.0),
                      )
                          : InputBorder.none,
                    ),
                  ),
                ],
              )
          ),

          Padding(
              padding: const EdgeInsets.all(20.0),
              child:
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "People: " + widget.plan.planInternalUsers.length.toString(),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17,
                          foreground: Paint()
                            ..color = Colors.teal[600]!,
                        ),
                      ),
                      // if user want to edit people data, redirect them to people page
                      IconButton(icon: Icon(Icons.edit),
                          onPressed: () async {
                            Navigator.pop(context);
                            // Navigator.pushNamed(context, 'AddPeople');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddPeopleScreen(plan: widget.plan),
                                )
                            );
                            widget.plan.cameFromViewItineraryPage = true;
                      }),
                    ],
                  ),
                  listUsers(widget.plan.planInternalUsers)
                ],
              )
          ),

          Padding(
              padding: const EdgeInsets.all(20.0),
              child:
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Invited: " + widget.plan.planExternalUsers.length.toString() ,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17,
                          foreground: Paint()
                            ..color = Colors.teal[600]!,
                        ),
                      ),
                      // if user want to edit people data, redirect them to people page
                      IconButton(icon: Icon(Icons.edit),
                          onPressed: () {
                            widget.plan.cameFromViewItineraryPage = true;
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddPeopleScreen(plan: widget.plan),
                                )
                            );

                      }),
                    ],
                  ),
                  listUsers(widget.plan.planExternalUsers)
                ],
              )
          ),

          Padding(
              padding: const EdgeInsets.all(20.0),
              child:
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Places: " +  widget.plan.planPlacesWithTime.length.toString() + " locations" ,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17,
                          foreground: Paint()
                            ..color = Colors.teal[600]!,
                        ),
                      ),
                      // if user want to edit location data, redirect them to location page
                      IconButton(icon: Icon(Icons.edit),
                          onPressed: () async {
                            widget.plan.cameFromViewItineraryPage = true;
                            Navigator.pop(context);
                            // Navigator.pushNamed(context, 'AddLocation');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddLocationScreen(plan: widget.plan),
                                )
                            );
                          }),
                    ],
                  ),
                  listPlaces(widget.plan.planPlacesWithTime)
                ],
              )
          ),

          // Timeline
          Padding(
              padding: const EdgeInsets.all(20.0),
              child:
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        widget.plan.planTitle == null ? "Timeline: " :
                        widget.plan.planTitle + " Timeline: ",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17,
                          foreground: Paint()
                            ..color = Colors.teal[600]!,
                        ),
                      ),
                    ],
                  ),
                  listPlacesDetails(widget.plan.planPlacesWithTime)
                ],
              )
          ),

          Padding(
              padding: const EdgeInsets.all(20.0),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DropdownButton<String>(
                    // value: dropdownValue,
                    value: widget.plan.planStatus,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        // dropdownValue = newValue;
                        widget.plan.planStatus = newValue;
                      });
                    },
                    items: <String>['Planning', 'Not Started', 'Canceled', 'Archived', 'Postponed']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
          ),

          widget.plan.planId == "" ? SizedBox(width: 10,) :

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 60,
                child: RaisedButton(
                  onPressed: () {

                    UniversalMethods.deletePlan(widget.plan.planId);


                    Navigator.pop(context, true);

                  },
                  color: Colors.grey,
                  child: Text(
                    'Delete Plan',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 60,
                child: RaisedButton(
                  onPressed: () {
                    UniversalMethods.savePlanDataToDatabase(widget.plan);
                    Navigator.pop(context, true);
                  },
                  color: Color(0xFF00a79B),
                  child: Text(
                    'SAVE',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/planzapp_xl.jpg'))),
      child: Positioned(
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 5,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Text(
                        'Back',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
            ],
          )),
    );
  }
}
