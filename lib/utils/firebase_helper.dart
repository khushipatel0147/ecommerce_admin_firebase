import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  static final helper = FirebaseHelper._();

  FirebaseHelper._();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addNotes(
      {required String title,
      required String des,
      required String price,
      required String cate,
      required String image}) async {
    await firestore.collection("product").add({
      "title": title,
      "description": des,
      "category": cate,
      "price": price,
      "image": image
    });
  }
}
