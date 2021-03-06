// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../widgets/item_form_widget.dart';
import '../data/data_jurnal.dart';

class EditFormScreen extends StatefulWidget {
  const EditFormScreen({
    Key? key,
    required this.nama,
    required this.deskripsi,
    required this.waktu,
    required this.id,
  }) : super(key: key);
  final String nama;
  final String deskripsi;
  final String waktu;
  final int id;

  @override
  State<EditFormScreen> createState() => _EditFormScreenState();
}

class _EditFormScreenState extends State<EditFormScreen> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController waktuController = TextEditingController();

  @override
  void initState() {
    namaController.text = widget.nama;
    deskripsiController.text = widget.deskripsi;
    waktuController.text = widget.waktu;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Form'),
        actions: [
          IconButton(
            onPressed: () async {
              var hasil = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text('delete?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text('Delete'),
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.red),
                      ),
                    ),
                  ],
                ),
              );
              if (hasil == true) {
                listJurnal.removeWhere((element) => element["id"] == widget.id);
                Navigator.of(context).pop(true);
              }
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Column(
        children: [
          ItemFormWidget(
            controller: namaController,
            labelText: 'Nama Jurnal',
          ),
          ItemFormWidget(
            controller: deskripsiController,
            labelText: 'Deskripsi Jurnal',
          ),
          ItemFormWidget(
            controller: waktuController,
            labelText: 'Waktu',
          ),
          ElevatedButton(
            onPressed: () async {
              var data = listJurnal
                  .where((element) => element["id"] == widget.id)
                  .first;
              data["nama_jurnal"] = namaController.text;
              data["deskripsi_jurnal"] = deskripsiController.text;
              data["waktu"] = waktuController.text;
              Navigator.of(context).pop(true);
            },
            child: Text('Simpan'),
          ),
        ],
      ),
    );
  }
}
