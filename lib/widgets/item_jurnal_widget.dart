import 'package:flutter/material.dart';

class ItemJurnalWidget extends StatelessWidget {
  const ItemJurnalWidget({
    Key? key,
    this.namaJurnal,
    this.deskripsiJurnal,
    this.waktuJurnal,
    this.onTap,
  }) : super(key: key);
  final String? namaJurnal;
  final String? deskripsiJurnal;
  final String? waktuJurnal;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text('$namaJurnal'),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$deskripsiJurnal'),
            Text('$waktuJurnal'),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}
