import 'package:flutter/material.dart';

import '../models/usuarisApi.dart';

// Autor: Raül Lama Martorell
// Data: 20 de 02 de 2025
// Versió 1.0

// Pantalla per a mostrar els detalls d'un usuari de l'API
class DetallUsuari extends StatelessWidget {
  final Usuari usuari;

  DetallUsuari({required this.usuari});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(usuari.nom)),
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20), // Marges laterals
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centrat verticalment
            crossAxisAlignment:
                CrossAxisAlignment.center, // Centrat horitzontalment
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width *
                    0.3, // Escalat segons la pantalla
                backgroundImage: NetworkImage(usuari.foto),
                onBackgroundImageError:
                    (_, __) {}, // Evita errors si la imatge no es carrega
              ),
              SizedBox(height: 20),
              Text(
                usuari.id,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center, // Text centrat
              ),
              SizedBox(height: 10),
              Text(
                usuari.nom,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center, // Text centrat
              ),
              Text(
                usuari.cognom1,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center, // Text centrat
              ),
              Text(
                usuari.cognom2,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center, // Text centrat
              ),
              Text(
                usuari.descripcio,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center, // Text centrat
              ),
            ],
          ),
        ),
      ),
    );
  }
}
