import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:search_map_place/search_map_place.dart';
//import 'package:geolocator/geolocator.dart';
//import 'package:planzapp/Views/Plans/MapSuggestionsScreen.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';

class GetCurrentFriendStatus{
  //User loggedInUser = await GetUserController().run();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  // print("LOOK HERE");
  //
  // QuerySnapshot snapshot =
  //     await Firestore.instance.collection('User').getDocuments();
  // snapshot.documents.forEach(
  // (element) {
  //
  // var f = element.get('friends');
  // // print("element: " + element.get('user_id'));
  // if (element.get('user_id') == currentUser.currentUser.uid) {
  // for (var i in f){
  // if( i == profileID ){
  // setState(() {
  // addRemoveText = "REMOVE";
  // });
  // }else {
  // setState(() {
  // addRemoveText = "ADD";
  // });
  // }
  // }
  // }
  //
  // },
  // );
}