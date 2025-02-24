import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/usuari.dart';
import '../providers/usuari_provider.dart';
// Autor : Raül Lama Martorell

// Pantalla principal de l'aplicació un cop iniciada la sessió
class HomePage extends StatelessWidget {
  final UsuariApp usuari;

  HomePage({Key? key, required this.usuari}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Usuaris'),
          leading: IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () => Navigator.pop(context), child: Text('Logout'))
        ],
      ),
    );
  }
}
