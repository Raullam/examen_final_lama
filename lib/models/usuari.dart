// Autor : Raül Lama Martorell

// Aquesta classe defineix el model dels usuaris de l'aplicació
class UsuariApp {
  String _email;
  String _contrasenya1;

// Constructor
  UsuariApp({required String email, required String contrasenya1})
      : _email = email,
        _contrasenya1 = contrasenya1;

  // getters
  String get email => _email;
  String get contrasenya1 => _contrasenya1;

  // setters
  set setEmail(String email) => _email = email;
  set setContrasenya1(String contrasenya1) => _contrasenya1 = contrasenya1;

  // Mètode per a convertir un objecte UsuariApp a un Map

  factory UsuariApp.fromJson(Map<dynamic, dynamic> json) {
    return UsuariApp(
      email: json['email'],
      contrasenya1: json['contrasenya1'],
    );
  }

  // Mètode per a convertir un Map a un objecte UsuariApp no l'utilitzem
  // to json
  Map<String, dynamic> toJson() {
    return {
      'email': _email,
      'contrasenya1': _contrasenya1,
    };
  }

  // Aixo no se que fa 😂 jaja 🤪
  @override
  String toString() {
    return 'UsuariApp{ email: $_email, contrasenya1: $_contrasenya1}';
  }
}
