
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:search_map_place/search_map_place.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';


class UpdateProfileScreen extends StatefulWidget {
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

  TextEditingController dobTextFieldController = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  String phone;
  String firstName;
  String lastName;
  String location;
  String dob;
  //String profilePicture;
  Image profilePicture;

  bool showSpinner = false;

  // File imageFile;
  // final imagePicker = ImagePicker();


  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();




  Future<void> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 8),
        lastDate: DateTime.now());
    if (picked != null)
      setState(() {
        dob = picked.toString().substring(0, 10);
        dobTextFieldController.text = dob;
      });
  }

  // Future getImage() async {
  //   final pickedFile = await imagePicker.getImage(source: ImageSource.camera);
  //
  //   setState(() {
  //     imageFile = File(pickedFile.path);
  //     profilePicture = Image.file(imageFile);
  //   });
  // }
  //


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
                  image: _imageFile == null
                      ? AssetImage("assets/plus.png")
                      : FileImage(File(_imageFile.path)),
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
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
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
            //             getImage();
            //           }),
            //       Expanded(
            //         child: Container(
            //           margin: EdgeInsets.only(right: 20, left: 10),
            //           child: imageFile == null ?
            //           IconButton(icon: Icon(Icons.add_a_photo), onPressed: () {
            //             getImage();
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
                        decoration: InputDecoration(hintText: 'Fist name'),
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
                        decoration: InputDecoration(hintText: 'Last name'),
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
                        apiKey: "AIzaSyA1raSrtTQbDS_URBmS9d2uRVIHweC7qic",// GOOGLE MAPS API KEY
                        // The language of the autocompletion
                        language: 'en',

                        onSelected: (Place place) async {
                          location = place.description;

                        })
                ),

              ],
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
                      print("phone is: " + phone.toString());
                      print("firstName is: " + firstName.toString());
                      print("lastName is: " + lastName.toString());
                      print("location is: " + location.toString());
                      print("dob is: " + dob.toString());
                      print("have profilePicture: " + (profilePicture == null).toString());

                      var userEmail = _auth.currentUser.email;
                          // save user profile

                      DocumentReference reference =  FirebaseFirestore.instance
                          .doc("User/" + userEmail.toString());

                      // reference.updateData({
                      //   'phone': phone,
                      //   'first_name': firstName,
                      //   'last_name': lastName,
                      //   'location': location,
                      //   'dob': dob,
                      //   // File imageFile;
                      // });

                      if(phone != null) {reference.update({'phone': phone,});}
                      if(firstName != null){reference.update({'first_name': firstName,});}
                      if(lastName != null){reference.update({'last_name': lastName,});}
                      if(location != null){reference.update({'location': location,});}
                      if(dob != null){reference.update({'dob': dob,});}



                      if (_imageFile != null) {
                        final FirebaseStorage _storage = FirebaseStorage.instanceFor(bucket: 'gs://planzapp-2c02d.appspot.com');
                        UploadTask _uploadTask;
                        String filePath = 'profile_images/$userEmail.png';
                        setState(() {
                          _uploadTask = _storage.ref().child(filePath).putFile(File(_imageFile.path));
                        });
                      }

                      if (phone == null &&
                          firstName == null &&
                          lastName == null &&
                          location == null &&
                          dob == null &&
                          _imageFile == null
                      ){
                        Fluttertoast.showToast(
                          msg: "Nothing has been updated",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: "Your profile has been updated",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                        );
                      }




                      Navigator.pop(context);
                    },
                    color: Color(0xFF00a79B),
                    child: Text(
                      'Update',
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
    Key key,
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
              Positioned(
                bottom: 20,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Update Your Account',
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
