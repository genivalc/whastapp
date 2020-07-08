import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/login.dart';
import 'package:whatsapp/pages/contatos.dart';
import 'package:whatsapp/pages/conversas.dart';
import 'package:whatsapp/pages/status.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabcontroller;
  List<String> itensMenu = ["Configurações", "Deslogar"];

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

  _escolhaMenuItem(String itemEscolhido) {
    switch (itemEscolhido) {
      case "Configurações":
        Navigator.pushNamed(context, "/configuracoes");
        break;
      case "Deslogar":
        _deslogarUsuario();
        break;
    }

    print(itemEscolhido);
  }

  _deslogarUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();

    Navigator.pushReplacementNamed(context, "/login");
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
        actions: [
          PopupMenuButton<String>(
            onSelected: _escolhaMenuItem,
            itemBuilder: (context) {
              return itensMenu.map((String item) {
                return PopupMenuItem<String>(value: item, child: Text(item));
              }).toList();
            },
          ),
        ],
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
