import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planzapp/Controllers/Home/GetSideProfileImageController.dart';
import 'package:planzapp/Views/Plans/PlanScreen.dart';
import 'package:provider/provider.dart';
import 'ProfileSideMenu.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  static User loggedInUser;
  // it's not used. Maybe Delete it out?
  static String messageText;


  // int _currentIndex = 0;

  // final tabs = [
  //   Center(
  //     child: Text('home'),
  //   ),
  //   Center(
  //     child: new PlanScreen(),
  //   ),
  //   // Center(
  //   //   child: Text('search'),
  //   // ),
  // ];

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }


  void getCurrentUser() async {
    loggedInUser = await GetUserController().run();
    setState(() {});

/*    try {
      final user = await auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new ProfileSideMenu(auth: auth,),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal[400],
        title: Text(
          'planzApp',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(context, "FavoritePlans");
              //Navigator.pushNamed(context, 'MessageHome');
            },
          ),

          IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            Navigator.pushNamed(context, "Notifications");
          },
        ),
          Visibility(
            visible: false,
          child : IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, 'SearchPeople');
            },
          ),
          ),
          Visibility(
            visible: false,
              child:IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  Navigator.pushNamed(context, 'MessageHome');
                  },
              )
          ),
        ],
      ),
      body: Container(
        child: new PlanScreen()
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.teal,
      //   currentIndex: _currentIndex,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.home,
      //         color: (_currentIndex == 0) ? (Colors.red) : (Colors.white),
      //         // color: Colors.white,
      //       ),
      //       title: Text(
      //         'Home',
      //         style: TextStyle(
      //           // color: Colors.white,
      //           color: (_currentIndex == 0) ? (Colors.red) : (Colors.white),
      //         ),
      //       ),
      //       // backgroundColor: Colors.teal,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.add,
      //         color: (_currentIndex == 1) ? (Colors.red) : (Colors.white),
      //         // color: Colors.white
      //       ),
      //       title: Text(
      //         'Planzapp',
      //         style: TextStyle(
      //           color: (_currentIndex == 1) ? (Colors.red) : (Colors.white),
      //           // color: Colors.white
      //         ),
      //       ),
      //       // backgroundColor: Colors.teal,
      //     ),
      //     // BottomNavigationBarItem(
      //     //   icon: Icon(
      //     //     Icons.search,
      //     //     color: (_currentIndex == 2) ? (Colors.red) : (Colors.white),
      //     //     // color: Colors.white,
      //     //   ),
      //     //   title: Text(
      //     //     'Search',
      //     //     style: TextStyle(
      //     //       color: (_currentIndex == 2) ? (Colors.red) : (Colors.white),
      //     //       // color: Colors.white
      //     //     ),
      //     //   ),
      //     //   // backgroundColor: Colors.teal,
      //     // ),
      //   ],
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //
      //     // if (index == 1) {
      //     //   Navigator.pushNamed(context, 'AddPeople');
      //     // }
      //   },
      // ),
    );
  }
}
