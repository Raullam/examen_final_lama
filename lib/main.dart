import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/usuari_provider.dart';
import 'screens/login_screens.dart';
// Autor : Raül Lama Martorell

// Aqui inicialitzem tota l'aplicació

// Inicialitzem els Widgets i SharedPreferences
// Inicialitzem els providers
// Inicialitzem el tema i la pàgina d'inici en aquest mateix ordre.

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Inicialitzem els Widgets
  runApp(MultiProvider(
    providers: [
      // Inicialitzem els providers

      ChangeNotifierProvider(create: (context) => UsuarisAppProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exemen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Página d'inici
    );
  }
}
