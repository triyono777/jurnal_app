import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jurnal_app/controller/firebase_controller.dart';
import 'package:jurnal_app/screen/edit_form_screen.dart';
import 'package:jurnal_app/screen/home_screen_selasa.dart';
import 'package:jurnal_app/screen/home_screen_senin.dart';

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
    return DefaultTabController(
      length: 2, // This is the number of tabs.
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Sample'),
          bottom: TabBar(
            // These are the widgets to put in each tab in the tab bar.
            tabs: [
              Tab(text: 'Senin'),
              Tab(text: 'Selasa'),
            ],
          ),
        ),
        body: TabBarView(
          // These are the contents of the tab views, below the tabs.
          children: [
            HomeScreenSenin(),
            HomeScreenSelasa(),
          ],
        ),
      ),
    );
  }
}
