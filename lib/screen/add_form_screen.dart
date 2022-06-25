import 'package:flutter/material.dart';

import '../widgets/item_form_widget.dart';
import '../data/data_jurnal.dart';

class AddFormScreen extends StatefulWidget {
  const AddFormScreen({Key? key}) : super(key: key);

  @override
  State<AddFormScreen> createState() => _AddFormScreenState();
}

class _AddFormScreenState extends State<AddFormScreen> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController waktuController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Form'),
      ),
      body: Column(
        children: [
          ItemFormWidget(controller: namaController, labelText: 'Nama Jurnal'),
          ItemFormWidget(
            controller: deskripsiController,
            labelText: 'Deskripsi Jurnal',
          ),
          ItemFormWidget(
            controller: waktuController,
            labelText: 'Waktu',
          ),
          ElevatedButton(
            onPressed: () {
              listJurnal.add(
                {
                  "id": listJurnal.length + 1,
                  "nama_jurnal": namaController.text,
                  "deskripsi_jurnal": deskripsiController.text,
                  "waktu": waktuController.text
                },
              );
              Navigator.of(context).pop(true);
            },
            child: Text('Simpan'),
          ),
        ],
      ),
    );
  }
}
