import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planzapp/Views/Home/MainScreen.dart';
import 'package:planzapp/Views/Plans/PlanScreen.dart';
import 'package:planzapp/util/Plan.dart';
import 'package:planzapp/util/universalVariables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:planzapp/util/universalMethods.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planzapp/Views/Plans/AddPeopleScreen.dart';

class CreatePlan extends StatefulWidget {
  Plan plan;
  CreatePlan({@required this.plan});

  @override
  _CreatePlanState createState() => _CreatePlanState();
}

/*
MY APPBAR CLASS SETS UP AN APP BAR FOR THE TOP OF THE CREATE PLAN PAGE
IT IS LATER CALLED IN THE CREATE PLAN CLASS
*/
class MyAppBar extends StatelessWidget {
  Plan plan;

  MyAppBar({this.title, this.plan});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      decoration: BoxDecoration(color: Colors.grey[350]),
      child: Row(
        children: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              /*
              if (context == AddPeopleScreen) {}{

              }
              
               */
              showModalBottomSheet(
                  context: context,
                  builder: ((builder) => ExitSheet(
                        plan: plan,
                      )));
            },
            label: Text("Back"),
          ),
          Expanded(
            child: title,
            //centerTitle: true,
          ),
          /*
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Menu',
            onPressed: null,
          ),
          */
        ],
      ),
    );
  }
}

class ExitSheet extends StatefulWidget {
  Plan plan;
  ExitSheet({@required this.plan});

  @override
  _ExitSheetState createState() => _ExitSheetState();
}

class _ExitSheetState extends State<ExitSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Are you sure you want to leave?',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.clear),
                onPressed: () {
                  Navigator.pop(context);
                },
                label: Text("Cancel"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.check),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(),
                      ));
                  // Navigator.pop(context);
                  // Navigator.pushNamed(context, 'MainScreen');
                },
                label: Text("Yes"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CreatePlanState extends State<CreatePlan> {
  // final _auth = FirebaseAuth.instance;

  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  String planTitle;
  //String price;
  String description;

  bool showSpinner = false;

  TextEditingController textEditingControllerTitle =
      new TextEditingController();
  TextEditingController textEditingControllerDescription =
      new TextEditingController();

  // void createNewPlanDoc() async {
  //   String uniqueCode = "plan of " + _auth.currentUser.email.toString();
  //   DocumentReference reference = Firestore.instance
  //       .document("Itinerary_Plan/" + uniqueCode);
  //   reference.setData({
  //       'description': description,
  //       //'price': price,
  //       'title': planTitle,
  //       'user_id': _auth.currentUser.uid,
  //       'status': "Planning",
  //
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    textEditingControllerTitle.text = widget.plan.planTitle;
    textEditingControllerDescription.text = widget.plan.planDescription;

    return Scaffold(
        body: ListView(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 30),
          child: MyAppBar(
            title: Center(
              child: Text(
                'What are you Planning?',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            plan: widget.plan,
          ),
        ),
        Container(margin: EdgeInsets.all(10), child: planImage()),
        Container(
          margin: EdgeInsets.only(right: 20, left: 10),
          child: Text(
            'Plan Title',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 20, left: 10, bottom: 30),
          child: TextField(
            controller: textEditingControllerTitle,
            onChanged: (value) {
              // planTitle = value;
              widget.plan.planTitle = value;
            },
            decoration: InputDecoration(
              hintText: 'Give your plan a Title',
              hintStyle: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // Container(
        //   margin: EdgeInsets.only(right: 20, left: 10),
        //   child: TextField(
        //     onChanged: (value) {
        //       price = value;
        //     },
        //     decoration: InputDecoration(hintText: 'price'),
        //   ),
        // ),
        Container(
          margin: EdgeInsets.only(right: 20, left: 10),
          child: Text(
            'Plan Description',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 20, left: 10, bottom: 30),
          child: TextField(
            controller: textEditingControllerDescription,
            onChanged: (value) {
              widget.plan.planDescription = value;
            },
            decoration: InputDecoration(
              hintText: 'Add some details about your plan',
              hintStyle: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
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

                    onPressed: () async {
                         if (widget.plan.planTitle == null ||
                             widget.plan.planTitle == "" ||
                            widget.plan.planDescription == null ||
                             widget.plan.planDescription == "") {
                         Fluttertoast.showToast(
                          msg: "Please enter both plan title and description",
                          toastLength: Toast.LENGTH_SHORT,
                           gravity: ToastGravity.BOTTOM,
                           timeInSecForIosWeb: 1,
                          );
                       } else {
                             Navigator.pop(context);
                            Navigator.push(
                            context,
                           MaterialPageRoute(
                             builder: (context) => AddPeopleScreen(plan: widget.plan),
                            ));
                            // go to add people.
            }
          },
          color: Color(0xFF00a79B),

          child: Text(
            'NEXT',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),

          ),

                 ),
              ),
            ),
          ),

          // space between NEXT and SAVE button
          Column(
            children: <Widget>[
              SizedBox(height: 15,),
            ],
          ),


    Padding(
         padding: const EdgeInsets.all(20.0),
             child: ClipRRect(
                 borderRadius: BorderRadius.circular(5),
                    child: Container(
                     height: 60,
                       child:RaisedButton(
                        onPressed: () async {
                        print(widget.plan.show());
                        if (widget.plan.planTitle == null ||
                            widget.plan.planTitle == "" ||
                            widget.plan.planDescription == null ||
                            widget.plan.planDescription == "") {
                          Fluttertoast.showToast(
                            msg: "Please enter both plan title and description",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                          );
                        } else {
                          UniversalMethods.savePlanDataToDatabase(widget.plan);
                          Navigator.pop(context);
                        }
                      },
                        color: Color(0xFF00a79B),
                         child: Text(
                        'SAVE',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
                      ),

                    ),
                  ),
                ),
              ),

      ],
    ));
  }

  /*
THIS HANDLES THE IMAGE AT THE TOP OF THE PAGE AND THE ADD IMAGE ICON THAT ALLOWS
THE USER TO GET THERE IMAGE FROM THEIR CAMERA OR THEIR GALLERY
 */

  Widget planImage() {
    return Center(
        child: Stack(children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image(
          width: 150,
          height: 150,
          image: _imageFile == null
              ? AssetImage("assets/plus.png")
              : FileImage(File(_imageFile.path)),
        ),
      ),
      Positioned(
        bottom: 20,
        right: 20,
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: ((builder) => bottomSheet()),
            );
          },
          child: Icon(
            Icons.camera_alt,
            color: Color(0xFF00a79B),
            size: 30,
          ),
        ),
      ),
    ]));
  }

  //THIS BRINGS UP THE BOTTOM SHEET THAT CONTAINS THE GALLERY AND CAMERA BUTTONS
  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Choose a plan Image:',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
      widget.plan.planImage = File(_imageFile.path);
    });
  }
}
