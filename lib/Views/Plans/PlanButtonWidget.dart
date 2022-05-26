import 'package:flutter/material.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:planzapp/Views/Plans/ViewItinerary.dart';
import 'package:planzapp/util/Plan.dart';
import 'package:planzapp/util/universalMethods.dart';
import 'package:planzapp/util/universalVariables.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';

// These classes create the plan buttons seen on the main screen
class PlanButtonWidget extends StatefulWidget {

  // AddPlan(this.title, this.description, this.price, this.c, this.favorite);
  PlanButtonWidget(this.c, this.favorite);

  String? author;
  DocumentSnapshot? c;
  bool? favorite;

  @override
  _PlanButtonWidgetState createState() => _PlanButtonWidgetState();
}

// class _PlanScreenState extends State<PlanScreen>
class _PlanButtonWidgetState extends State<PlanButtonWidget> {

  List<dynamic>? dbFavoritePlans = [];

  @override
  void initState() {
    super.initState();
    getFavoritePlans();
    setState(() {});
  }

  void getFavoritePlans() async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    try {
      Stream reference = FirebaseFirestore.instance
          .collection('User')
          .doc(loggedInUser.uid.toString())
          .snapshots();
      reference.listen((value){
        dbFavoritePlans = value.data()['favoritePlans'];
      });
    } catch (e) {
      print(e);
    }

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {

    // Creates clickable, dismissible plan button
    DocumentSnapshot c =  widget.c!;
    if (dbFavoritePlans!.contains(c.get('planId'))){widget.favorite = true;}
    return Dismissible(
      key: Key(widget.c!.get("planTitle")),
      direction: DismissDirection.endToStart,

      child:
      GestureDetector(
        onTap: () {

          print("tapped on a plan");
          // UniversalMethods.setCurrentPlanData(c.get('user_id'), c.get('title'), c.get('price'), c.get('description'), c.get('internalUsers'), c.get('externalUsers'), c.get('placesWithTime'), c.get('status'), c.get('favorite'), c.get('favoriteTime'), c.id);
          // Navigator.pushNamed(context, "ViewItinerary");

          Plan plan = Plan(
            planEventPlanners: c.get('planEventPlanners'),
             // planEventPlanners: c.data()['eventPlanners'],
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

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewItinerary(plan: plan),
              )
          );

        },
        child:
        Container(
          // margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          // color: Colors.grey,
          margin: EdgeInsets.all(5),
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                // padding: EdgeInsets.fromLTRB(2, 20, 20, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image(
                                width: 45,
                                image: AssetImage(
                                    'assets/images/planzapp_xl.jpg'),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                                color: Colors.white,
                                // width: 270,
                                child: Text(
                                  // 'NAME OF THE PLAN MAKE IT LOOOOOOOOOONG',
                                  widget.c!.get("planTitle"),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 0,
                              child: Container(
                                /*child: Text(
                              ("\$"+widget.c.get("price")),
                              style: TextStyle(fontSize: 16),
                            ),*/
                              child: Text(
                                widget.c!.get('planPlacesWithTime').length == 0 ? " " :
                                widget.c!.get('planPlacesWithTime')[0].split("&")[0] + " @ " + widget.c!.get('planPlacesWithTime')[0].split("&")[1],
                                textAlign: TextAlign.right,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  foreground: Paint()
                                    ..color = Colors.green[700]!,
                                ),
                              )
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: Container(
                            child:

                            IconButton(icon: widget.favorite! ? Icon(Icons.star) : Icon(Icons.star_border),
                                onPressed: () {
                                  print("favorite plan star");
                                  setState(() {
                                    widget.favorite = !widget.favorite!;

                                  String favoriteTime = DateTime.now().toString();
                                  if (widget.favorite!) {
                                    DocumentReference reference = FirebaseFirestore.instance
                                        .collection("User")
                                        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
                                    ;
                                    reference.update({
                                      'favoritePlans' : FieldValue.arrayUnion([widget.c!.get('planId')]),
                                    });

                                  } else {
                                    favoriteTime = "not a favorite plan";
                                    DocumentReference reference = FirebaseFirestore.instance
                                        .collection("User")
                                        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
                                    ;
                                    reference.update({
                                      'favoritePlans' : FieldValue.arrayRemove([widget.c!.get('planId')]),
                                    });
                                  }
                                  });

                                }),

                              ),
                            ),
                          ],
                        ),

                        // Text('type of activity'),
                        SizedBox(
                          height: 10,
                        ),

                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Container(
                                  // width: 200,
                                  // constraints: BoxConstraints.expand(),
                                  child: Text(
                                    // 'DESCRIPTION: fetch description here,'
                                    //     ' make sure there is a limit on line, and ellipsis,'
                                    //     'LOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOo'
                                    //     'oooooooooooooooooooooooooooooooooooo',
                                    widget.c!.get("planDescription"),
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                      Expanded(
                      flex: 1,
                            child: IconButton(
                                icon: widget.favorite!
                                    ? Icon(Icons.favorite, color: Colors.red,)
                                    : Icon(Icons.favorite_border),
                                onPressed: () {
                                  print("favorite plan heart");
                                  setState(() {
                                    widget.favorite = !widget.favorite!;

                                    String favoriteTime = DateTime.now().toString();
                                    if (widget.favorite!) {
                                      DocumentReference reference = FirebaseFirestore.instance
                                          .collection("User")
                                          .doc(FirebaseAuth.instance.currentUser!.uid.toString())
                                      ;
                                      reference.update({
                                        'favoritePlans' : FieldValue.arrayUnion([widget.c!.get('planId')]),
                                      });

                                    } else {
                                      favoriteTime = "not a favorite plan";
                                      DocumentReference reference = FirebaseFirestore.instance
                                          .collection("User")
                                          .doc(FirebaseAuth.instance.currentUser!.uid.toString())
                                      ;
                                      reference.update({
                                        'favoritePlans' : FieldValue.arrayRemove([widget.c!.get('planId')]),
                                      });
                                    }
                                  });
                                })),
                      Expanded(

                        child: DecoratedBox(
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0),
                              side: BorderSide(color: Colors.black),
                            ),
                            color: Colors.white,
                          ),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              buttonTheme: ButtonTheme.of(context).copyWith(
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                            child: OutlinedButton(
                              style: ButtonStyle(
                              shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
                                  //borderRadius: BorderRadius.circular(3.0),
                                  side: MaterialStateProperty.resolveWith<BorderSide>(
                                      (Set<MaterialState> states){
                                        final Color color = states.contains(MaterialState.pressed)
                                            ?Colors.grey
                                            :Colors.grey.shade500;
                                        return BorderSide(color: color, width: 2);
                                      }
                                  ),
                              ),
                              child: Text('View Itinerary'),
                              onPressed: () {
                                print("tapped on a plan");
                                // UniversalMethods.setCurrentPlanData(c.get('user_id'), c.get('title'), c.get('price'), c.get('description'), c.get('internalUsers'), c.get('externalUsers'), c.get('placesWithTime'), c.get('status'), c.get('favorite'), c.get('favoriteTime'), c.id);
                                // Navigator.pushNamed(context, "ViewItinerary");
                                Plan plan = Plan(
                                    planEventPlanners: c.get('planEventPlanners'),
                                    // planEventPlanners: c.data()['eventPlanners'],
                                    planTitle: c.get('planTitle'),
                                    planPrice: c.get('planPrice'),
                                    planDescription: c.get('planDescription'),
                                    planInternalUsers: c.get('planInternalUsers'),
                                    planExternalUsers: c.get('planExternalUsers'),
                                    planPlacesWithTime: c.get('planPlacesWithTime'),
                                    planStatus: c.get('planStatus'),
                                    planFavorite: c.get('planFavorite'),
                                    planFavoriteTime: c.get('planFavoriteTime'),
                                    planId: c.get('planId'));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ViewItinerary(plan: plan),
                                    ));
                              },
                        ),
                            ),
                          ),
                        ),
                      ],
                    ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
      ),
        );
   // ));
  }
}
