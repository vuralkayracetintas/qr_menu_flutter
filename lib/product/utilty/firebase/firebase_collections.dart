import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  Category,
  category,
  dessert,
  drinks,
  foods,
  mainCategory,
  yemek;

  CollectionReference get reference =>
      FirebaseFirestore.instance.collection(name);
  DocumentReference get reference2 => FirebaseFirestore.instance.doc(name);
}
