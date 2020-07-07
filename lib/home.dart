import 'package:flutter/material.dart';
import 'package:whatsapp/pages/contatos.dart';
import 'package:whatsapp/pages/conversas.dart';
import 'package:whatsapp/pages/status.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WhatsApp",
          textAlign: TextAlign.center,
        ),
        bottom: TabBar(
          indicatorWeight: 4,
          indicatorColor: Colors.white,
          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          controller: _tabcontroller,
          tabs: [
            Tab(
              text: "Conversas",
            ),
            Tab(
              text: "Status",
            ),
            Tab(
              text: "Contatos",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabcontroller,
        children: [
          Conversas(),
          Status(),
          Contatos(),
        ],
      ),
    );
  }
}
