import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_break/models/coffee.dart';

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

// Create list of coffees
  List<Coffee> _createCoffeeList(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Coffee(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '0',
      );
    }).toList();
  }

// Return Stream of coffees
  Stream<List<Coffee>> get coffees {
    return _coffeeCollection.snapshots().map(_createCoffeeList);
  }
}
