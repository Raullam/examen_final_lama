import 'package:shared_preferences/shared_preferences.dart';
// Autor : Raül Lama Martorell

/// Aquesta classe gestiona les preferències de l'usuari utilitzant SharedPreferences.
/// Permet guardar i recuperar el correu electrònic, la contrasenya i l'estat del mode fosc.
/// També permet netejar les preferències guardades.

class Preferencies {
  static late SharedPreferences _prefs;

  static String _correu = '';
  static String _contrasenya = '';

  // Inicialitza SharedPreferences
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Getter i Setter per al correu electrònic
  static String get correu {
    return _prefs.getString('correu') ?? _correu;
  }

  static set correu(String value) {
    _correu = value;
    _prefs.setString('correu', value);
  }

  // Getter i Setter per a la contrasenya
  static String get contrasenya {
    return _prefs.getString('contrasenya') ?? _contrasenya;
  }

  static set contrasenya(String value) {
    _contrasenya = value;
    _prefs.setString('contrasenya', value);
  }

  // Mètode per netejar les preferències (esborrar correu i contrasenya)
  static Future<void> clear() async {
    await _prefs.remove('correu');
    await _prefs.remove('contrasenya');
  }
}
