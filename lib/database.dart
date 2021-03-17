import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseApp secondaryApp = Firebase.app('OrganicStore');
FirebaseFirestore firestore = FirebaseFirestore.instanceFor(app: secondaryApp);

final CollectionReference vegetables = FirebaseFirestore.instance.collection('Vegetables');

void getVegetables() {
  vegetables.get().then((value) => {
    print(value)
  });
}
