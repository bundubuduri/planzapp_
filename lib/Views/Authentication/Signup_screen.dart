
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:planzapp/util/universalMethods.dart';
//import 'package:search_map_place/search_map_place.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController dobTextFieldController = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  String? planzID;
  String? email;
  String? password;
  String? phone;
  String? firstName;
  String? lastName;
  String? location;
  String? dob;
  //String profilePicture;
  Image? profilePicture;

  bool showSpinner = false;
  bool planzIDinUse = true;

  // File imageFile;
  // final imagePicker = ImagePicker();

  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();



  // void addUser() async {
  //   print("start addUser");
  //   // var db = await mongo.Db.create("mongodb+srv://planzapp:planzapp@cluster0.qmeiq.gcp.mongodb.net/planzapp?retryWrites=true&w=majority");
  //   var db = await mongo.Db.create("mongodb+srv://william:C%40nada2014@planzappdb.rbthm.mongodb.net/User?retryWrites=true&w=majority");
  //
  //   // mongo.Db db = mongo.Db("mongodb+srv://william:C%40nada2014@planzappdb.rbthm.mongodb.net/User?retryWrites=true&w=majority");
  //
  //   await db.open();
  //   var collection = db.collection('users');
  //   await collection.insertAll([
  //     {
  //       'name': username,
  //       'email': email,
  //       'password': password
  //     },
  //   ]);
  //   await db.close();
  //   print("end addUser");
  // }

  //DateTime dob = DateTime.now();

  //checking if planzID is in use or not
  Future<void> checkDuplicatePlanzID(String? nameTocheck) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('User')
        .where('planzID', isEqualTo: nameTocheck)
        .get();
    var documents = querySnapshot.docs;
    if (documents.isEmpty){
      print("there is no duplicate");
      planzIDinUse =false;
    }else{
      print("there are/is "+(documents.length).toString()+" planzIDs");
      planzIDinUse =true;
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 8),
        lastDate: DateTime.now());
    if (picked != null)
      setState(() {
        dob = picked.toString().substring(0, 10);
        dobTextFieldController.text = dob!;
      });
  }

  // Future getImageFromCamera() async {
  //   final pickedFile = await imagePicker.getImage(source: ImageSource.camera);
  //   setState(() {
  //     imageFile = File(pickedFile.path);
  //     profilePicture = Image.file(imageFile);
  //   });
  // }

  Widget profileImage() {
    return Center(
        child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child:
                Image(
                  width: 150,
                  height: 150,
                  image: (_imageFile == null
                      ? AssetImage("assets/plus.png")
                      : FileImage(File(_imageFile!.path))) as ImageProvider<Object>,
                ) ,
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child:
                InkWell(
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
            ]
        )
    );

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
      child:
      Column(
        children: <Widget>[
          Text(
            'Choose a plan Image:',
            style: TextStyle(
              fontSize:20,
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
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile as PickedFile?;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: ListView(
          children: <Widget>[
            BackButtonWidget(),
            SizedBox(
              height: 20,
            ),

            Container(
                margin: EdgeInsets.all(10),
                child:
                profileImage()
            ),

            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Row(
            //     children: <Widget>[
            //       IconButton(icon: Icon(imageFile == null ? Icons.photo : Icons.add_photo_alternate),
            //           onPressed: imageFile == null ? null : () {
            //         // give options
            //         getImageFromCamera();
            //           }),
            //       Expanded(
            //         child: Container(
            //           margin: EdgeInsets.only(right: 20, left: 10),
            //           child: imageFile == null ?
            //           IconButton(icon: Icon(Icons.add_a_photo), onPressed: () {
            //             // give options
            //             getImageFromCamera();
            //           })
            //               :
            //           Image.file(imageFile),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),


            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.person), onPressed: null),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 20, left: 10),
                      child: TextField(
                        onChanged: (value) {
                          planzID = value;
                          checkDuplicatePlanzID(planzID);
                        },
                        decoration: InputDecoration(hintText: 'Username*'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.lock), onPressed: null),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 20, left: 10),
                      child: TextField(
                        obscureText: true,
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: InputDecoration(hintText: 'Password*'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.mail), onPressed: null),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 20, left: 10),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: InputDecoration(hintText: 'Email*'),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.phone), onPressed: null),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 20, left: 10),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          phone = value;
                        },
                        decoration: InputDecoration(hintText: 'Phone'),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.text_fields), onPressed: null),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 20, left: 10),
                      child: TextField(
                        onChanged: (value) {
                          firstName = value;
                        },
                        decoration: InputDecoration(hintText: 'Fist name*'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.text_fields), onPressed: null),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 20, left: 10),
                      child: TextField(
                        onChanged: (value) {
                          lastName = value;
                        },
                        decoration: InputDecoration(hintText: 'Last name*'),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Row(
            //     children: <Widget>[
            //       IconButton(icon: Icon(Icons.location_city), onPressed: null),
            //       Expanded(
            //         child: Container(
            //           margin: EdgeInsets.only(right: 20, left: 10),
            //           child: TextField(
            //             onChanged: (value) {
            //               location = value;
            //             },
            //             decoration: InputDecoration(hintText: 'Location'),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),


            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.date_range), onPressed: null),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 20, left: 10),
                      child:
                      TextField(
                        controller: dobTextFieldController,
                        onTap: () {
                          FocusScope.of(context).requestFocus(new FocusNode()); // do not show keyboard
                          selectDate(context);
                        },
                        decoration: InputDecoration(hintText: 'Date of birth'),
                      ),


                    ),
                  ),
                ],
              ),
            ),


            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // IconButton(icon: Icon(Icons.location_city), onPressed: null),
                    Text("Set your Location"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: SearchMapPlaceWidget(
                        apiKey: "AIzaSyDKTg3_AnAxkRT1587Ps4T_xzjoxSlXTtc",// GOOGLE MAPS API KEY
                        // The language of the autocompletion
                        language: 'en',

                        onSelected: (Place place) async {
                          location = place.description;

                        })
                ),

              ],
            ),

            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Radio(value: null, groupValue: null, onChanged: null),
                  RichText(
                      text: TextSpan(
                          text: 'I have accepted the',
                          style: TextStyle(color: Colors.black),
                          children: [
                        TextSpan(
                            text: 'Terms & Condition',
                            style: TextStyle(
                                color: Colors.teal, fontWeight: FontWeight.bold))
                      ]))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),


            // Uploader(file: imageFile),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: 60,
                  child: RaisedButton(
                    onPressed: () async {
                      print("email is: " + email.toString());
                      print("planzID is: " + planzID.toString());
                      print("password is: " + password.toString());
                      print("phone is: " + phone.toString());
                      print("firstName is: " + firstName.toString());
                      print("lastName is: " + lastName.toString());
                      print("location is: " + location.toString());
                      print("dob is: " + dob.toString());
                      print("have profilePicture: " + (profilePicture == null).toString());


                      if (email == null || password == null || planzID == null || firstName == null || lastName ==null) {
                        AlertPopup.showMessage(context, "Please enter all required fields:\nemail, password, planzID, first&last name", 1500);
                        // Fluttertoast.showToast(
                        //     msg: "Please enter all required fields",
                        //     backgroundColor: Colors.teal,
                        //     toastLength: Toast.LENGTH_SHORT,
                        //     gravity: ToastGravity.TOP,
                        //     timeInSecForIosWeb: 1
                        // );
                      } else if(password!.length<8){
                        AlertPopup.showMessage(context, "The password must be of length at least 8", 1500);
                      } else if(!password!.contains(new RegExp(r'[a-z+ | A-Z+ ]'))){
                        AlertPopup.showMessage(context, "The password must contain at least 1 lower or upper letter", 1500);
                      } else if(!password!.contains(new RegExp(r'[!@#\$%^&*.+]'))){
                        AlertPopup.showMessage(context, "Password must contain a special character: !,@,#,\$,%,^,&,.,*,+", 1500);
                      } else if(!password!.contains(new RegExp(r'[0-9+]'))){
                        AlertPopup.showMessage(context, "Password must contain at least one number", 1500);
                      } else if(password!.toLowerCase().contains(planzID!.toLowerCase()) || password!.toLowerCase().contains(firstName!.toLowerCase()) || password!.toLowerCase().contains(lastName!.toLowerCase())){
                        AlertPopup.showMessage(context, "Password must exclude : username, first name, or last name", 1500);
                      } else if(planzIDinUse){
                        AlertPopup.showMessage(context, "Username(planzID) is already in use", 1500);
                        
                      }
                      else {
                        setState(() {
                          showSpinner = true;
                        });

                        try {


                          var newUser = await _auth.createUserWithEmailAndPassword(email: email!, password: password!);
                          
                          // FirebaseAuth.instance.currentUser.updatePhoneNumber(phoneCredential);

                          // FirebaseAuth.instance.currentUser.linkWithPhoneNumber(phone);

                          if (newUser != null){
                            Navigator.pushNamed(context, "Main");

                            // save user profile
                            DocumentReference reference = FirebaseFirestore.instance
                                .doc("User/" + _auth.currentUser!.uid.toString());

                            reference.set({
                              'user_id': _auth.currentUser!.uid,
                              'email' : email,
                              'planzID' : planzID,
                              'friends': [],
                              'phone': phone,
                              'first_name': firstName,
                              'last_name': lastName,
                              'location': location,
                              'dob': dob,
                              'favoritePlans': [],
                            });


                            if (_imageFile != null){
                              final FirebaseStorage _storage = FirebaseStorage.instanceFor(bucket: 'gs://planzapp-2c02d.appspot.com');
                              UploadTask _uploadTask;
                              String filePath = 'profile_images/$email.png';
                              setState(() {
                                _uploadTask = _storage.ref().child(filePath).putFile(File(_imageFile!.path));
                              });
                            }



                            // Create user's preferences document in database
                            reference.collection("Preferences").doc("Preferences")
                            .set({
                                'AnyCuisine': false
                            });
                            // Create user's Friends document in database
                            reference.collection("Friends").doc("Friends")
                            .set({
                                'user_id': _auth.currentUser!.uid
                            });
                            // Create user's Notifications document in database
                            reference.collection("Notifications").doc("Welcome")
                                .set({
                              'planTitle': 'Welcome to planzApp',
                              'planId': "",
                              'timestamp': FieldValue.serverTimestamp(),
                              'planInternalUsers' : [],
                              'planEventPlanners' : [],
                              'planPrice' : "0",
                              'planDescription' : "",
                              'planExternalUsers' : [],
                              'planPlaces' : [],
                              'planStatus' : "Not Started",
                              'planFavorite' : false,
                              'planFavoriteTime' : "",
                              'userViewed' : false,
                              'notificationId' : '00000000000',
                            });

                          }
                          setState(() {
                            showSpinner = false;
                          });
                        } catch (e) {
                          print(e);
                          if (e.toString() == "[firebase_auth/invalid-email] The email address is badly formatted.") {
                            Fluttertoast.showToast(
                              msg: "The email address is badly formatted",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                            );
                          } else if (e.toString() == "[firebase_auth/weak-password] Password should be at least 6 characters") {
                            Fluttertoast.showToast(
                              msg: "Password must be at least 6 characters",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                            );
                          } else if (e.toString() == "[firebase_auth/email-already-in-use] The email address is already in use by another account.") {
                            Fluttertoast.showToast(
                              msg: "The email address is already in use by another account",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                            );
                          }


                      setState(() {
                        showSpinner = false;
                      });
                        }
                      }



                      // Navigator.pushNamed(context, 'Home');
                    },
                    color: Color(0xFF00a79B),
                    child: Text(
                      'SIGN UP',
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
      height: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/planzapp_xl.jpg'))),
      child: Positioned(
          child: Stack(
        children: <Widget>[
          Positioned(
              top: 20,
              child: Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  Text(
                    'Back',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              )),
          Positioned(
            bottom: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Create New Account',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          )
        ],
      )),
    );
  }
}

// class Uploader extends StatefulWidget {
//   final File file;
//   Uploader({Key key, this.file}) : super(key: key);
//
//   createState() => _UploaderState();
// }
//
// class _UploaderState extends State<Uploader> {
//
//   final FirebaseStorage _storage =
//       FirebaseStorage(storageBucket: 'gs://planzapp-2c02d.appspot.com');
//   StorageUploadTask _uploadTask;
//
//   void _startUpload() {
//     String filePath = 'image/${DateTime.now()}.png';
//     setState(() {
//       _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (_uploadTask != null) {
//       return StreamBuilder<StorageTaskEvent>(
//         stream: _uploadTask.events,
//         builder: (context, snapshot) {
//           var event = snapshot?.data?.snapshot;
//           double progressPercent = event !=  null
//               ? event.bytesTransferred / event.totalByteCount
//               : 0;
//           return Column(
//             children: [
//               if(_uploadTask.isComplete)
//                 Text("Uploaded"),
//               if(_uploadTask.isPaused)
//                 FlatButton(
//                   child: Icon(Icons.play_arrow),
//                   onPressed: _uploadTask.resume,
//                 ),
//               if (_uploadTask.isInProgress)
//                 FlatButton(
//                   child: Icon(Icons.pause),
//                   onPressed: _uploadTask.pause,
//                 ),
//
//               LinearProgressIndicator(value: progressPercent),
//
//               Text('${(progressPercent*100).toStringAsFixed(2)} %'),
//             ],
//           );
//         },
//       );
//
//     } else {
//       return FlatButton.icon(
//         label: Text("Upload"),
//         icon: Icon(Icons.cloud_upload),
//         onPressed: _startUpload,
//       );
//     }
//
//   }
//
// }
