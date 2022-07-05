import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jurnal_app/controller/firebase_controller.dart';
import 'package:jurnal_app/screen/edit_form_screen.dart';

import '../widgets/item_jurnal_widget.dart';
import 'package:jurnal_app/data/data_jurnal.dart';
import 'add_form_screen.dart';

class HomeScreenSenin extends StatefulWidget {
  const HomeScreenSenin({Key? key}) : super(key: key);

  @override
  State<HomeScreenSenin> createState() => _HomeScreenSeninState();
}

class _HomeScreenSeninState extends State<HomeScreenSenin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                var dataPengeluaran = snapshot.data?.docs;
                var totalPengeluaran = 0;
                dataPengeluaran?.forEach((data) {
                  totalPengeluaran += int.parse(data['pengeluaran']);
                });
                print(totalPengeluaran.toString());
                return Column(
                  children: [
                    Expanded(child: bodyWidget(snapshot)),
                    Text('$totalPengeluaran'),
                  ],
                );
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
    // allData = allData?.where((element) {
    //   return element['waktu'] == 'senin';
    // }).toList();

    return ListView.builder(
      itemCount: allData?.length,
      itemBuilder: (context, index) => ItemJurnalWidget(
        onTap: () async {
          var hasil = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditFormScreen(
                id: allData?[index].id ?? '',
                nama: allData?[index]["nama_jurnal"],
                deskripsi: allData?[index]["pengeluaran"],
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
        deskripsiJurnal: allData?[index]["pengeluaran"],
        waktuJurnal: allData?[index]["waktu"],
      ),
    );
  }
}
