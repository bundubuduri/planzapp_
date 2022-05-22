import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:search_map_place/search_map_place.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:planzapp/Views/Plans/MapSuggestionsScreen.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';

class PeopleUpdateService{

}
void addFriendData() async {
  User? loggedInUser = await GetUserController().run();

  // code below needs to be converted to adding friend

  // try{
  //   DocumentReference reference = Firestore.instance
  //       .doc("User/" + loggedInUser.email.toString() + "/friends/Friends_lists");
  //   reference.update({
  //     pID : pNAME
  //   });
  // }catch(e){
  //   print(e);
  // }
  //
  // DocumentReference docRef =
  // await Firestore.instance.collection('User').document(email);
  //
  // DocumentSnapshot doc = await docRef.get();
  //
  // // List friends = doc.get('friends');
  //
  // docRef.update(
  //   {
  //     'friends': FieldValue.arrayUnion([id])
  //   },
  // );

}
void removeFriendData() async {
  User? loggedInUser = await GetUserController().run();

  // code below needs to be converted to removing friend

  // save user AboveBudgetPercent preferences
  // try{
  //     DocumentReference reference = Firestore.instance
  //         .doc("User/" + loggedInUser.email.toString() + "/friends/Friends_lists");
  //     reference.update({
  //       pID : FieldValue.arrayRemove([pNAME])
  //     });
  //   }catch(e){
  //     print(e);
  //   }
  //
  //   DocumentReference docRef =
  //   await Firestore.instance.collection('User').document(email);
  //
  //   DocumentSnapshot doc = await docRef.get();
  //
  //   // List friends = doc.data['friends'];
  //
  //   docRef.update(
  //     {
  //       'friends': FieldValue.arrayRemove([id])
  //     },
  //   );
}