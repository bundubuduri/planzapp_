//import 'dart:html';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:planzapp/util/Plan.dart';
import 'package:planzapp/util/universalVariables.dart';

class UniversalMethods {
  static void deletePlan(String planId) {
    FirebaseFirestore.instance.collection("Plans").doc(planId).delete();

    // delete plan image
    String filename = 'plan_images/' + planId + '.png';
    Reference storageReference = FirebaseStorage.instance.ref();
    storageReference
        .child(filename)
        .delete()
        .then((_) => print('Successfully deleted $filename storage item'));
  }

  static void savePlanDataToDatabase(Plan plan) {
    var uuid = Uuid();
    // Generate a v1 (time-based) id
    var planId = uuid.v1();

    final _auth = FirebaseAuth.instance;

    // we are creating new plan
    if (plan.planId == "") {
      FirebaseFirestore.instance.collection("Plans").doc(planId).set({
        'planExternalUsers': plan.planExternalUsers,
        'planInternalUsers': plan.planInternalUsers,
        'planDescription': plan.planDescription,
        'planPrice': plan.planPrice,
        'planTitle': plan.planTitle,
        'planEventPlanners': plan.planEventPlanners,
        'planPlacesWithTime': plan.planPlacesWithTime,
        'planStatus': plan.planStatus,
        'planFavorite': plan.planFavorite,
        'planFavoriteTime':
            plan.planFavorite ? plan.planFavoriteTime : "not a favorite plan",
        'planId': planId
      }).then((value) {
        print(plan.planId);
        if (plan.planImage != null) {
          final FirebaseStorage _storage = FirebaseStorage.instanceFor(
              bucket: 'gs:///planzapp-2c02d.appspot.com');
          UploadTask _uploadTask;
          String filePath = 'plan_images/${plan.planId}.png';
          _uploadTask = _storage.ref().child(filePath).putFile(plan.planImage);
        }
      });
      FirebaseFirestore.instance
          .collection("Users/")
          .doc(_auth.currentUser!.uid.toString())
          .update({
        'plans': FieldValue.arrayUnion([planId])
      });
      // 'Plans' : 'plan.planCurrentId'});

    } else {
      // we are updating existing plan
      DocumentReference reference = FirebaseFirestore.instance
          .collection("Plans")
          // .document(UniversalVariables.planCurrentId);
          .doc(plan.planId);
      reference.update({
        'planExternalUsers': plan.planExternalUsers,
        'planInternalUsers': plan.planInternalUsers,
        'planDescription': plan.planDescription,
        'planPrice': plan.planPrice,
        'planTitle': plan.planTitle,
        'planEventPlanners': plan.planEventPlanners,
        'planPlacesWithTime': plan.planPlacesWithTime,
        'planStatus': plan.planStatus,
        'planFavorite': plan.planFavorite,
        'planFavoriteTime':
            plan.planFavorite ? plan.planFavoriteTime : "not a favorite plan",
        'planId': plan.planId
      });

      if (plan.planImage != null) {
        final FirebaseStorage _storage = FirebaseStorage.instanceFor(
            bucket: 'gs://planzapp-2c02d.appspot.com');
        UploadTask _uploadTask;
        String filePath = 'plan_images/${plan.planId}.png';
        _uploadTask = _storage.ref().child(filePath).putFile(plan.planImage);
      }
    }
    // resetPlanDataLocal();
  }
}

// Creates popup messages to showusers their preferences are being saved/updated
class UpdatingSnackbar {
  UpdatingSnackbar._();
//ScaffoldState.removeCurrentSnackBar();
  static showMessage(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.removeCurrentSnackBar();
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Changes saved!'),
        duration: Duration(milliseconds: 500),
      ),
    );
  }
}

// Create popup messages to show users any alert like password policy
class AlertPopup {
  AlertPopup._();
  static showMessage(BuildContext context, String m, int ms) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.removeCurrentSnackBar();
    scaffold.showSnackBar(
      SnackBar(
        content: Text(m),
        duration: Duration(milliseconds: ms),
        backgroundColor: Colors.red,
      ),
    );
  }
}

// Checkbox Template
class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
//    this.tristate,
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  // final bool tristate;
  final String? label;
  final EdgeInsets? padding;
  final bool? value;
  final Function? onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged!(!value!);
      },
      child: Padding(
        padding: padding!,
        child: Row(
          children: <Widget>[
            Checkbox(
              value: value,
              onChanged: (bool? newValue) {
                onChanged!(newValue);
              },
            ),
            Expanded(child: Text(label!)),
          ],
        ),
      ),
    );
  }
}
