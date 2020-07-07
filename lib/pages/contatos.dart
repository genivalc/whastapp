import 'package:flutter/material.dart';
import 'package:whatsapp/model/conversa.dart';

class Contatos extends StatefulWidget {
  @override
  _ContatosState createState() => _ContatosState();
}

class _ContatosState extends State<Contatos> {

   List<Conversa> listaConversas = [
    Conversa("Genival Neto", "Olá tudo bem",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-828da.appspot.com/o/perfil%2FWhatsApp%20Image%202020-05-10%20at%208.12.37%20PM.jpeg?alt=media&token=deddedca-4152-4709-8345-59d30407c2b6"),
    Conversa("Genival", "Olá tudo bem",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-828da.appspot.com/o/perfil%2FWhatsApp%20Image%202020-05-10%20at%208.07.59%20PM.jpeg?alt=media&token=a6613645-d12f-4c16-ab9f-50af233995f4"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listaConversas.length,
        itemBuilder: (context, indice){

          Conversa conversa = listaConversas[indice];

          return ListTile(
            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            leading: CircleAvatar(
              
              maxRadius: 30,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage( conversa.caminhoFoto ),
            ),
            title: Text(
              conversa.nome,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),

          );

        }
    );
  }
}