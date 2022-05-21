import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:planzapp/util/Plan.dart';
import 'package:planzapp/Models/Notifications/NotificationsModel.dart';
import 'package:planzapp/Views/Plans/ViewItinerary.dart';
import 'package:planzapp/Views/Plans/PlanButtonWidget.dart';
import 'package:planzapp/Controllers/Notifications/NotificationUpdateController.dart';

// These classes create the notification buttons seen on the notifications screen.
class NotificationsButtonWidget extends StatefulWidget {

  NotificationsButtonWidget(this.c);

  DocumentSnapshot c;

  @override
  _NotificationsButtonWidget createState() => _NotificationsButtonWidget();
}

class _NotificationsButtonWidget extends State<NotificationsButtonWidget>{
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {

    // Creates clickable, dismissible notifications button
    DocumentSnapshot c = widget.c;
    return Dismissible(
      key: Key(widget.c.get('planId')),
       // direction: DismissDirection.endToStart,

        //onDismissed: ,
        child:
        GestureDetector(

            onTap: () {
              print("tapped on a notification");
              NotificationUpdateController().run(widget.c.get('notificationId'));

              Plan plan = Plan(
                  planEventPlanners: c.get('planEventPlanners'),
                  planTitle: c.get('planTitle'),
                  planPrice: c.get('planPrice'),
                  planDescription: c.get('planDescription'),
                  planInternalUsers: c.get('planInternalUsers'),
                  planExternalUsers: c.get('planExternalUsers'),
                  planPlacesWithTime:  c.get('planPlacesWithTime'),
                  planStatus:  c.get('planStatus'),
                  planFavorite:  c.get('planFavorite'),
                  planFavoriteTime: c.get('planFavoriteTime'),
                  planId: c.get('planId')
              );

              Notifications notificaton = Notifications(
                  notificationType: c.get('type'),
                  planId: c.get('planId'),
                  timeStamp: c.get('timestamp').toString(),
                  userViewed: c.get('userViewed'),
                  notificationId: c.get('notificationId')
              );


              if (notificaton.notificationType != 'delete'){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewItinerary(plan: plan),
                    ));}

            },
          child:
          Container(
            margin: EdgeInsets.all(5),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                        color: Colors.blue,
                        child: Text((() {
                         if(widget.c.get("type") == 'invite'){
                           return "You have been invited to plan: " + widget.c.get("planTitle");
                        } else if (widget.c.get("type") == 'delete'){
                           return "Plan: " + widget.c.get("planTitle") +" had been deleted.";
                         } else if (widget.c.get("type") == 'change'){
                           return "Plan: " + widget.c.get("planTitle") +" has been changed.";
                         }
                        })() ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Container(
                        child:

                        IconButton(icon: widget.c.get("userViewed") ? Icon(Icons.brightness_1_rounded, size: 18,) : Icon(Icons.notifications_active_sharp, color: Colors.red,),
                            ),

                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),

    );
  }
  }
