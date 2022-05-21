import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planzapp/Views/Plans/AddLocationScreen.dart';
import 'package:planzapp/Views/Plans/CreatePlan.dart';
import 'package:planzapp/Views/Plans/ViewItinerary.dart';
import 'package:planzapp/util/Plan.dart';
import 'package:planzapp/util/universalMethods.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_contact_picker/easy_contact_picker.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';
import 'package:http/http.dart' as http;


class AddPeopleScreen extends StatefulWidget {

  Plan plan;
  AddPeopleScreen({@required this.plan});

  @override
  _AddPeopleScreenState createState() => _AddPeopleScreenState();
}

class _AddPeopleScreenState extends State<AddPeopleScreen> {

  static User loggedInUser;

 // FirebaseFunctions mfunctions;
  //mfunctions = Firebase.getInstance();

  @override
  void initState(){
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    loggedInUser = await GetUserController().run();
    setState(() {});
  }
  var launch = true;
  final databaseReference = FirebaseFirestore.instance;
  String externalUserName = "";
  String externalUser = "";
  final externalUserNameTextFieldController = TextEditingController();
  final externalUserEmailTextFieldController = TextEditingController();
  var allUsers = List<dynamic>();
  String externalEmailOrPhone = "";
  String internalContact = "";
  String email = "";
  String userId = "";
  final internalContactTextFieldController = TextEditingController();


  // widget to be used to list all selected users, parameter is selected users list
  Widget listSelectedUsers(List<dynamic> strings)
  {
    List<Widget> list = new List<Widget>();
    for(var i = strings.length - 1; i > -1; i--){
      var temp = strings[i];
      String temp1 = temp.split(":")[0]  +  " : " +temp.split(":")[1];
    list.add(
    Padding(
          padding:const EdgeInsets.only(left:20.0,right:20,top:5,bottom:5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(temp),
              SizedBox(width: 20,),
              // button to remove each added user
              FlatButton(
                color: Colors.grey[300],
                textColor: Colors.black,
                onPressed: () {
                  setState(() {
                    widget.plan.planExternalUsers.remove(temp);
                    widget.plan.planInternalUsers.remove(temp);
                  });
                  Fluttertoast.showToast(
                    msg: temp.split(" : ")[0] + " Deleted",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 1,
                  );
                },
                child: Text(
                  "Remove",
                  //temp,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return new Column(children: list);
  }


   Widget imageDisplay (List<dynamic>strings)
  {
    List<Widget>list= new List<Widget>();
    var users = FirebaseFirestore.instance.collection('User');
    for(var i = strings.length-1;i>0;i--){
      String userID = strings[i];
      String userNameEmail = "";
      //FirebaseFirestore.instance.collection('User').where('user_id', isEqualTo: temp).get().then(
        //(DocumentSnapshot doc) =>
          //temp = doc.data()['user_name'];

      //);
      for(var i = allUsers.length - 1; i > -1; i--){
        if (allUsers[i].toString().contains(userID)) {
          userNameEmail = allUsers[i].split(" : ")[0];// + " : " + allUsers[i].split(" : ")[1];
        }
      }


      list.add(
        Padding(
          padding:const EdgeInsets.only(left:20.0,right:20,top:5,bottom:5),
          child:Row(
            mainAxisAlignment:MainAxisAlignment.start,
            children:<Widget>[
              Expanded(
                child:Container(
                  margin:EdgeInsets.all(5),
                  child:FutureBuilder(
                    future: getProfileImage(),
                    builder:(context, AsyncSnapshot<String> url){
                      if(url.hasData){
                        return Container(
                          height:100,
                          width:100,
                          child:Center(
                            child:ClipRRect(
                              borderRadius:BorderRadius.circular(15),
                              child:Image.network(url.data,
                                fit:BoxFit.cover,
                              ),
                            ),),
                        );

                      }
                      return Icon(Icons.person);
                    },
                  ),
                ),
              ),

              Text(userNameEmail,
                textAlign:TextAlign.start,
              ),
              SizedBox(width:50,),
//buttontoremoveeachaddeduser
              FlatButton(
                color:Colors.grey[300],
                textColor:Colors.black,
                onPressed:(){
                  setState((){
                    widget.plan.planExternalUsers.remove(userID);
                    widget.plan.planInternalUsers.remove(userID);
                  });
                  /*Fluttertoast.showToast(
                    msg:temp.split(":")[0]+ "Deleted",
                    toastLength:Toast.LENGTH_SHORT,
                    gravity:ToastGravity.TOP,
                    timeInSecForIosWeb:1,
                  );*/
                },
                child:Text(
                  "Remove",
//temp,
                ),
              ),
            ],
          ),
        ),
      );


    }
    return new Column(children:list);
  }


  // widget to list prematched users, parameter is search term - what has user typed in
  Widget listPreMatchedUsers(String enteredString)
  {
    List<dynamic> filteredUsers = new List<dynamic>();
    setState(() {
      filteredUsers.add(enteredString);
      filteredUsers.clear();
      for(var i = allUsers.length - 1; i > -1; i--){
         if (allUsers[i].toString().contains(enteredString)) {
           if (!widget.plan.planInternalUsers.contains(allUsers[i].toString())) {
             filteredUsers.add(allUsers[i].toString());
           }
         }
      }
    });

    List<Widget> list = new List<Widget>();
    if (enteredString != "") {
      for(var i = filteredUsers.length - 1; i > -1; i--){
        //list.add(new Text(strings[i]));
        String temp = filteredUsers[i];
        String dbInternalUserList = temp.split(" : ")[2];//
        String userNameEmail = temp.split(" : ")[0] + " : " + temp.split(" : ")[1];
        //InternalUser internalUser = new InternalUser(temp.split(" : ")[0], temp.split(" : ")[1], temp.split(" : ")[2]);
        list.add(
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  textColor: Colors.blueAccent,
                  onPressed: () {
                    setState(() {
                      widget.plan.planInternalUsers.add(dbInternalUserList);
                      //print(internalUser.userId);
                      //print(internalUser.userEmail);
                      //widget.plan.planInternalUser.toMap(userId, userName, userEmail);
                    });
                    Fluttertoast.showToast(
                      msg: temp + " Added",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 1,
                    );

                  },
                  child: Text(
                    userNameEmail,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }
    return new Column(children: list);
  }

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  //validation phone numbers
  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  Contact contact = new Contact(fullName: "", phoneNumber: "");
  final EasyContactPicker contactPicker = new EasyContactPicker();
  // open phone book to select a contact
  getContactData() async{
    Contact contactT = await contactPicker.selectContactWithNative();
    setState(() {
      contact = contactT;
    });

    if (!widget.plan.planExternalUsers.contains(contact.fullName + " : " + contact.phoneNumber)) {
      setState(() {
        widget.plan.planExternalUsers.add(contact.fullName + " : " + contact.phoneNumber);
      });

      Fluttertoast.showToast(
        msg: contact.fullName + " Added",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
      );

    } else {
      Fluttertoast.showToast(
        msg: "Contact Already Added",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
      );
    }

  }

  // get all users from the data base, so that we can give user recommendations
  // we can change this to ger user's friend later when friend feature implemented
  Future<dynamic> getAllUsers() async {
    final QuerySnapshot result = await FirebaseFirestore.instance.collection('User').get();
    final List<DocumentSnapshot> docs = result.docs;

    print("getting all users");
    docs.forEach((data) => allUsers.contains(data.id) ? print("duplicate") : allUsers.add(data.id));

    for (int i = 0; i < allUsers.length; i ++) {
      DocumentSnapshot<Map<String, dynamic>> variable = await FirebaseFirestore.instance.collection('User').doc(allUsers[i]).get();

      var tempUserName = variable.data()['planzID'];
      var tempUserId = variable.data()['user_id'];
      var tempEmail = variable.data()['email'];
      allUsers[i] = tempUserName + ' : ' + tempEmail + ' : ' + tempUserId;

    }
    setState(() {

    });
    // print(allUsers.length);
    //print(allUsers);
  }


  //helps get access to profileimage
  Future<String> getProfileImage() async {
    final ref = FirebaseStorage.instance.ref().child('profile_images/'+ email +".png");
    // no need of the file extension, the name will do fine.
    var profileImageUrl = await ref.getDownloadURL();
    print(profileImageUrl);
    return profileImageUrl;
  }

  Future sendEmail() async{

    Uri url = Uri.parse('https://us-central1-planzapp-2c02d.cloudfunctions.net/sendMail?dest=' + externalEmailOrPhone);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return response;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to send message');
    }


  }

  @override
  Widget build(BuildContext context) {

    if (launch) {
      // get all users from the data base once when this page is created
      getAllUsers();
      launch = false;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
          children: <Widget>[

            MyAppBar(
              title: Center(
                child: Text(
                  'Who would you like to add?',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),


          SizedBox(
            height: 20,
          ),

          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Add People",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  foreground: Paint()
                    ..color = Colors.black54,
                ),
              )
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10, left: 10),
                    child: TextField(
                      controller: internalContactTextFieldController,
                      onChanged: (value) {
                        setState(() {
                          internalContact = value;
                        });
                      },
                      decoration: InputDecoration(hintText: 'Search for People...',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.search_rounded), onPressed: null),

              ],
            ),
          ),


          listPreMatchedUsers(internalContact),
   imageDisplay(widget.plan.planInternalUsers),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Invite People",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  foreground: Paint()
                    ..color = Colors.black54,
                ),
              )
          ),


          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 20, left: 10),
                    child: TextField(
                      controller: externalUserNameTextFieldController,
                      onChanged: (value) {
                        externalUserName = value;
                        externalUser = externalUserName + " : " + externalEmailOrPhone;
                      },
                      decoration: InputDecoration(hintText: 'Name',
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.person), onPressed: null),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 20, left: 10),
                    child: TextField(
                      controller: externalUserEmailTextFieldController,
                      onChanged: (value) {
                        externalEmailOrPhone = value;
                        externalUser = externalUserName + " : " + externalEmailOrPhone;
                      },
                      decoration: InputDecoration(hintText: 'Email or Phone Number',
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.email), onPressed: null),
              ],
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

                      print("you are creating this plan: ");
                      print(widget.plan.show());


                      if (externalUserName != "" && externalEmailOrPhone != "") {
                        if (validateEmail(externalEmailOrPhone) || isNumeric(externalEmailOrPhone)) {

                          if (widget.plan.planExternalUsers.contains(externalUser)) {
                            Fluttertoast.showToast(
                              msg: "Friend Already Added",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                            );
                          } else {
                            setState(() {
                              widget.plan.planExternalUsers.add(externalUser);
                            });
                            externalUserNameTextFieldController.clear();
                            externalUserEmailTextFieldController.clear();
                            externalUser = "";
                            externalUserName = "";
                            Fluttertoast.showToast(
                              msg: externalUserName + " Added",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                            );
                            sendEmail();
                          }
                        } else {

                        Fluttertoast.showToast(
                          msg: "Not Valid Email or Phone Numbers",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                        );
                      }
                    } else {
                      Fluttertoast.showToast(
                        msg: "Please Enter Both Fields",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                      );
                    }
                  },
                  color: Color(0xFF00a79B),
                  child: Text(
                    'Invite',
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
            padding: const EdgeInsets.only(bottom: 20, top: 10, left: 20, right: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 60,
                child: RaisedButton(
                  onPressed: () async {
                    getContactData();
                  }
                  ,
                  color: Color(0xFF00a79B),
                  child: Text(
                    'Invite from Phone Book',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),

            listSelectedUsers(widget.plan.planExternalUsers),


            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: 60,
                  child: RaisedButton(
                    onPressed: () async {
                      if (widget.plan.cameFromViewItineraryPage) {
                        Navigator.pop(context);
                        print(widget.plan.show());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewItinerary(plan: widget.plan),
                            )
                        );
                      } else {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddLocationScreen(plan: widget.plan),
                            )
                        );
                      }

                      if (widget.plan.cameFromViewItineraryPage) {
                        Fluttertoast.showToast(
                          msg: "People Data Updated",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                        );
                      }


                    },
                    color: Color(0xFF00a79B),
                    child: Text(
                      widget.plan.cameFromViewItineraryPage ? 'Update' : 'NEXT',
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
            padding: const EdgeInsets.only(bottom: 20, top: 5, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[


                Padding (
                  padding: const EdgeInsets.all(20.0),
                  child:   SizedBox(
                    width: 100.0,
                    height: 50.0,
                    child: new RaisedButton(
                      child: new Text('Cancel'),
                      onPressed: () async {
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, 'Main');

                        showDialog(context: context, barrierDismissible: false, builder: (BuildContext context) {

                          return AlertDialog(
                            title: Text(
                              "Save Progress?",
                              style: TextStyle(fontStyle: FontStyle.normal),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("Yes"),
                                onPressed: () {

                                    UniversalMethods.savePlanDataToDatabase(widget.plan);

                                  Navigator.pop(context, true);

                                },
                              ),
                              FlatButton(
                                  child: Text("No"),
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                  }
                              )
                            ],
                          );
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),


          SizedBox(
            height: 10,
          ),

        ],
      ),

    );
  }
}


