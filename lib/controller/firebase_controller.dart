import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  getJurnal() {
    CollectionReference jurnal = firestore.collection('jurnal');

    return jurnal.get();
  }

  addJurnal(Map<String, Object> data) {
    CollectionReference jurnal = firestore.collection('jurnal');
    jurnal.add(data);
  }

  updateJurnal({required String id, Map<String, Object>? data}) {
    CollectionReference jurnal = firestore.collection('jurnal');
    jurnal.doc(id).update(data ?? {});
  }

  deleteJurnal(String id) {
    CollectionReference jurnal = firestore.collection('jurnal');
    jurnal.doc(id).delete();
  }
}
