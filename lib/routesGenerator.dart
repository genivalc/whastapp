import 'dart:js';

import 'package:flutter/material.dart';
import 'package:whatsapp/cadastro.dart';
import 'package:whatsapp/login.dart';

import 'home.dart';

class RouteGenerator {
  static Route<dynamic> generaRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => Login());
      case "/login":
        return MaterialPageRoute(builder: (context) => Login());
      case "/cadastro":
        return MaterialPageRoute(builder: (context) => Cadastro());
      case "/home":
        return MaterialPageRoute(builder: (context) => Home());
      default:
        _erroRota();
    }
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Tela não encontrada!"),
        ),
        body: Center(
          child: Text("Tela não encontrada!"),
        ),
      );
    });
  }
}
