import 'package:flutter/material.dart';

import '../models/usuari.dart';

class UsuarisAppProvider extends ChangeNotifier {
  List<UsuariApp> _usuarisApp = [];
  UsuariApp? _usuariActual =
      UsuariApp(email: 'raul@gmail.com', contrasenya1: "123456");

  // Constructor
  UsuarisAppProvider() {
    _usuarisApp.add(_usuariActual!);
  }

  // Getters
  List<UsuariApp> get usuarisApp => _usuarisApp;
  // Setters
  set usuarisApp(List<UsuariApp> usuarisApp) {
    _usuarisApp = usuarisApp;
    notifyListeners();
  }

  void carregarUsuaris() {
    //
    notifyListeners();
  }
}
