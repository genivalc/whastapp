import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/login.dart';

import 'home.dart';

void main() {
  runApp(
    MaterialApp(
      home: Login(),
      theme: ThemeData(
        primaryColor: Color(0xff075E54),
        accentColor: Color(0xff25D366),
      ),
    ),
  );
}
