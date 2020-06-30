import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_break/models/coffee.dart';
import 'package:coffee_break/models/user.dart';

class DatabaseService {
  String uid;

  DatabaseService({this.uid});

// Refer to Coffees collection
  final CollectionReference _coffeeCollection =
      Firestore.instance.collection("coffees");

// Create user coffee preferences
  Future updateUserData({String name, String sugars, int strength}) {
    return _coffeeCollection.document(uid).setData({
      'name': name,
      'sugars': sugars,
      'strength': strength,
    });
  }

// Create list of coffees from QuerySnapShot
  List<Coffee> _createCoffeeList(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Coffee(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '0',
      );
    }).toList();
  }
  // Create a UserData from Documen snapshot

  UserData _createUserData(DocumentSnapshot snapshot) {
    return UserData(
        name: snapshot.data['name'] ?? '',
        strength: snapshot.data['strength'] ?? 0,
        sugars: snapshot.data['sugars'] ?? '0',
        uid: uid);
  }

// Return Stream of coffees
  Stream<List<Coffee>> get coffees {
    return _coffeeCollection.snapshots().map(_createCoffeeList);
  }

// Stream of UserData
  Stream<UserData> get userData {
    return _coffeeCollection.document(uid).snapshots().map(_createUserData);
  }
}
