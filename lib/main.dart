import 'package:examen_final_lama/providers/usuariApi_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/usuari.dart';
import 'preferencies/preferencies.dart';
import 'providers/usuari_provider.dart';
import 'screens/home_screen.dart';
import 'screens/login_screens.dart';
// Autor : Raül Lama Martorell

// Aqui inicialitzem tota l'aplicació

// Inicialitzem els Widgets i SharedPreferences
// Inicialitzem els providers
// Inicialitzem el tema i la pàgina d'inici en aquest mateix ordre.

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Inicialitzem els Widgets
  await Preferencies.init(); // Inicialitzem SharedPreferences
  runApp(MultiProvider(
    providers: [
      // Inicialitzem els providers

      ChangeNotifierProvider(create: (context) => UsuarisAppProvider()),
      ChangeNotifierProvider(create: (context) => UsuariAPIProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recordarCredencials =
        Preferencies.correu.isNotEmpty && Preferencies.contrasenya.isNotEmpty;
    final usuri1 = UsuariApp(
      email: Preferencies.correu,
      contrasenya1: Preferencies.contrasenya,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exemen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: recordarCredencials ? HomePage(usuari: usuri1) : LoginPage(),
    );
  }
}
