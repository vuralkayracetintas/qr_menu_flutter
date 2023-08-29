import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  category,
  dessert,
  drinks,
  foods,
  mainCategory,
  yemek;

  CollectionReference get reference =>
      FirebaseFirestore.instance.collection(name);
}
