import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jurnal_app/controller/firebase_controller.dart';
import 'package:jurnal_app/screen/edit_form_screen.dart';

import '../widgets/item_jurnal_widget.dart';
import 'package:jurnal_app/data/data_jurnal.dart';
import 'add_form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: FirebaseController().getJurnal(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                // TODO: Handle this case.
                break;
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                return bodyWidget(snapshot);
              default:
                return SizedBox();
            }
            return SizedBox();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var hasil = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddFormScreen(),
            ),
          );
          if (hasil == true) {
            setState(() {});
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget bodyWidget(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    var allData = snapshot.data?.docs;
    return ListView.builder(
      itemCount: allData?.length,
      itemBuilder: (context, index) => ItemJurnalWidget(
        onTap: () async {
          var hasil = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditFormScreen(
                id: allData?[index].id ?? '',
                nama: allData?[index]["nama_jurnal"],
                deskripsi: allData?[index]["deskripsi_jurnal"],
                waktu: allData?[index]["waktu"],
              ),
            ),
          );
          print(hasil);
          if (hasil == true) {
            setState(() {});
          }
        },
        namaJurnal: allData?[index]["nama_jurnal"],
        deskripsiJurnal: allData?[index]["deskripsi_jurnal"],
        waktuJurnal: allData?[index]["waktu"],
      ),
    );
  }
}
