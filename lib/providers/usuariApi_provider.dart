import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/usuarisApi.dart';
// Autor : Raül Lama Martorell

// Provider avançat per a gestionar els usuaris de la API
class UsuariAPIProvider extends ChangeNotifier {
  List<Usuari> _usuaris = [];
  bool _isLoading = false;

  List<Usuari> get usuaris => _usuaris;
  bool get isLoading => _isLoading;

  // Metodo per a obtenir usuarios des d'una API GET / READ / SELECT
  Future<void> carregarUsuaris() async {
    _isLoading = true;
    notifyListeners();

    try {
      // aqui posam la ruta de els usuaris de la api
      final response = await http.get(Uri.parse(
          'https://examenfinallama.free.beeceptor.com/users')); // URL de ejemplo

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<Usuari> usuarisCarregats = [];

        data.forEach((key, value) {
          usuarisCarregats.add(Usuari.fromMap(value));
        });

        _usuaris = usuarisCarregats;
      } else {
        throw Exception('Error en la càrrega d\'usuaris');
      }
    } catch (e) {
      print('Error: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

//   // Método para añadir un usuario a la API INSERT / POST

//   Future<void> afegirUsuari(Usuari usuari) async {
//     try {
//       final response = await http.post(
//         Uri.parse(
//             'https://examen-practic-sim-default-rtdb.europe-west1.firebasedatabase.app/users.json'),
//         body: json.encode(usuari.toMap()),
//         headers: {'Content-Type': 'application/json'},
//       );

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         // Agregamos el nuevo usuario a la lista local para actualizar la UI
//         _usuaris.add(usuari);
//         notifyListeners();
//       } else {
//         throw Exception('Error en afegir l\'usuari');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

// // Método para actualizar un usuario en la API UPDATE / PUT

//   Future<void> actualitzarUsuari(String id, Usuari usuari) async {
//     try {
//       final response = await http.put(
//         Uri.parse(
//             'https://examen-practic-sim-default-rtdb.europe-west1.firebasedatabase.app/users/$id.json'), // ID en la URL
//         body: json.encode(usuari.toMap()), // Convertimos el usuario a JSON
//         headers: {'Content-Type': 'application/json'},
//       );

//       if (response.statusCode == 200) {
//         // Encontrar y actualizar el usuario en la lista local
//         int index = _usuaris.indexWhere((u) =>
//             u.email == usuari.email); // Busca por email u otro identificador
//         if (index != -1) {
//           _usuaris[index] = usuari;
//           notifyListeners();
//         }
//       } else {
//         throw Exception('Error en actualitzar l\'usuari');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
// // Método para eliminar un usuario de la API DELETE

//   Future<void> eliminarUsuari(String id, String email) async {
//     try {
//       final response = await http.delete(
//         Uri.parse(
//             'https://examen-practic-sim-default-rtdb.europe-west1.firebasedatabase.app/users/$id.json'), // ID en la URL
//       );

//       if (response.statusCode == 200) {
//         // Remover usuario de la lista local
//         _usuaris.removeWhere(
//             (u) => u.email == email); // Cambiar según el identificador real
//         notifyListeners();
//       } else {
//         throw Exception('Error en eliminar l\'usuari');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
}
