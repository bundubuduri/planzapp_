import 'package:cloud_firestore/cloud_firestore.dart';

class GetDataService {
  Future<String> getData(String id) async {
    QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection('User').get();

    snapshot.docs.forEach(
          (element) {
        // print("element: " + element.get('user_name'));
        if (element.get('user_id') == id) {

        }
      },
    );

    return id;
  }

}