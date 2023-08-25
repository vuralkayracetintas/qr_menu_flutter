import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  category,
  dessert,
  drinks,
  foods,
  mainCategory;

  CollectionReference get reference =>
      FirebaseFirestore.instance.collection(name);
}
