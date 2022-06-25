import 'package:flutter/material.dart';

class ItemFormWidget extends StatelessWidget {
  const ItemFormWidget({
    Key? key,
    this.labelText,
    required this.controller,
  }) : super(key: key);
  final String? labelText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: "$labelText",
          hintText: "Silakan masukkan $labelText",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
