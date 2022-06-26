import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  getJurnal() {
    CollectionReference jurnal = firestore.collection('jurnal');

    return jurnal.get();
  }
}
