import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  String uid;

  DatabaseService({this.uid});

  final CollectionReference _coffeeCollection =
      Firestore.instance.collection("coffees");

  Future updateUserData({String name, String sugars, int strength}) {
    return _coffeeCollection.document(uid).setData({
      'name': name,
      'sugars': sugars,
      'strength': strength,
    });
  }

  Stream<QuerySnapshot> get coffees{
    return _coffeeCollection.snapshots();
  }
}
