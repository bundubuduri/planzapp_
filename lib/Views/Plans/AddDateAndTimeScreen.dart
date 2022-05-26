import 'package:flutter/material.dart';
import 'package:planzapp/Views/Plans/AddLocationScreen.dart';
import 'package:planzapp/Views/Plans/CreatePlan.dart';
import 'package:planzapp/Views/Plans/ViewItinerary.dart';
import 'package:planzapp/util/Plan.dart';
import 'package:planzapp/util/universalMethods.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddDateAndTimeScreen extends StatefulWidget {
  Plan? plan;
  AddDateAndTimeScreen({required this.plan});

  @override
  _AddDateAndTimeScreenState createState() => _AddDateAndTimeScreenState();
}

var launch = true;

class _AddDateAndTimeScreenState extends State<AddDateAndTimeScreen> {
  // list place name with date and time cells so that user can set time for each location
  Widget listPlacesToAddTime(List<dynamic> strings) {
    List<Widget> list = new List<Widget>();
    if (strings != null) {
      for (var i = strings.length - 1; i > -1; i--) {
        var date;
        var time;
        var weekday;

        //format place display
        String placeName = strings[i].split("&")[2].split("|")[0].split(",")[0];
        String? placeInfo = strings[i].split("&")[2];

        date = strings[i].split("&")[0];
        time = strings[i].split("&")[1];

        list.add(
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  placeName,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        //color: Colors.blueAccent,
                        margin: EdgeInsets.only(right: 20, left: 10),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black26)),
                          child: Text(date),
                          onPressed: () async {
                            var result = await (showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(DateTime.now().year),
                                lastDate: DateTime(3000)) as FutureOr<DateTime>);
                            setState(() {
                              date = '$result'.substring(0, 10);
                              weekday = '${result.weekday}';
                              widget.plan!.planPlacesWithTime[i] =
                                  date + " & " + time + "&" + placeInfo;
                              widget.plan!.planPlacesWithTime.sort();
                            });
                            print(date);
                            print('${result.weekday}');
                          },
                          disabledTextColor: Colors.black54,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 20, left: 10),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black26)),
                          child: Text(time),
                          onPressed: () async {
                            TimeOfDay? timePicked = await showTimePicker(
                                context: context, initialTime: TimeOfDay.now());
                            setState(() {
                              time = timePicked!.format(context);
                              widget.plan!.planPlacesWithTime[i] =
                                  date + " & " + time + "&" + placeInfo;
                              widget.plan!.planPlacesWithTime.sort();
                            });
                            //print(time);
                          },
                          disabledTextColor: Colors.black54,
                        ),
                      ),
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
          ),
        );
      }
    }
    return new Column(children: list.reversed.toList());
  }

  @override
  Widget build(BuildContext context) {
    if (launch) {
      launch = false;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          MyAppBar(
            title: Center(
              child: Text(
                'When and where?',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Add Date and Time",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  foreground: Paint()..color = Colors.black54,
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "Places for this plan: " +
                        (widget.plan!.planPlacesWithTime != null
                            ? widget.plan!.planPlacesWithTime.length.toString()
                            : '') +
                        " locations",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      foreground: Paint()..color = Colors.green[700]!,
                    ),
                  ),
                  listPlacesToAddTime(widget.plan!.planPlacesWithTime),
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 60,
                child: RaisedButton(
                  onPressed: () async {
                    Navigator.pop(context);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ViewItinerary(plan: widget.plan),
                        ));

                    // print(widget.plan.show());

                    if (widget.plan!.cameFromViewItineraryPage) {
                      Fluttertoast.showToast(
                        msg: "Time Data Updated",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                      );
                    }
                  },
                  color: Color(0xFF00a79B),
                  child: Text(
                    widget.plan!.cameFromViewItineraryPage ? 'Update' : 'NEXT',
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5, left: 20, right: 20, bottom: 20),
                  child: SizedBox(
                    width: 100.0,
                    height: 50.0,
                    child: new RaisedButton(
                      child: new Text('Cancel'),
                      onPressed: () async {
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, 'Main');

                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  "Save Progress?",
                                  style: TextStyle(fontStyle: FontStyle.normal),
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("Yes"),
                                    onPressed: () {
                                      UniversalMethods.savePlanDataToDatabase(
                                          widget.plan!);
                                      Navigator.pop(context, true);
                                    },
                                  ),
                                  FlatButton(
                                    child: Text("No"),
                                    onPressed: () {
                                      Navigator.pop(context, true);
                                    },
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
        ],
      ),
    );
  }
}
