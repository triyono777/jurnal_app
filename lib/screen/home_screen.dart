import 'package:flutter/material.dart';
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
      body: ListView.builder(
        itemCount: listJurnal.length,
        itemBuilder: (context, index) => ItemJurnalWidget(
          onTap: () async {
            var hasil = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditFormScreen(
                  id: listJurnal[index]["id"],
                  nama: listJurnal[index]["nama_jurnal"],
                  deskripsi: listJurnal[index]["deskripsi_jurnal"],
                  waktu: listJurnal[index]["waktu"],
                ),
              ),
            );
            if (hasil == true) {
              setState(() {});
            }
          },
          namaJurnal: listJurnal[index]["nama_jurnal"],
          deskripsiJurnal: listJurnal[index]["deskripsi_jurnal"],
          waktuJurnal: listJurnal[index]["waktu"],
        ),
      ),
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
}
