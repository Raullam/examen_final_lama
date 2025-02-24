import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../models/usuari.dart';
import '../preferencies/preferencies.dart';
import '../providers/usuari_provider.dart';
import 'home_screen.dart';
// Autor : Raül Lama Martorell

// Aquesta és la pàgina de login de l'aplicació
// Aquesta pàgina permet als usuaris iniciar sessió amb les seves credencials
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controladors per als camps de text del correu electrònic i la contrasenya
  late final TextEditingController _correuController = TextEditingController();
  late final TextEditingController _contrasenyaController =
      TextEditingController();
  bool _recordarCredencials = false;
  late UsuariApp usuri1;

// Aquesta funció s'executa al iniciar la pàgina i fa executar _carregarCredencials
  @override
  void initState() {
    super.initState();
    _carregarCredencials();
  }

// Aquesta funció s'executa al iniciar gracies al initState carregarem les credencials guardades a Preferencies i les mostram als camps de text.
// Si no hi ha cap credencial guardada, els camps de text estaran buits i recordar credencials estara sera false
//
  _carregarCredencials() async {
    setState(() {
      _correuController.text = Preferencies.correu;
      _contrasenyaController.text = Preferencies.contrasenya;
      // Si hi ha credencials guardades, el checkbox "Recordar" estarà marcat
      _recordarCredencials =
          Preferencies.correu.isNotEmpty && Preferencies.contrasenya.isNotEmpty;
      if (_recordarCredencials) {
        if (_recordarCredencials) {
          usuri1 = UsuariApp(
            email: Preferencies.correu,
            contrasenya1: Preferencies.contrasenya,
          );
        }
      }
    });
  }

// Aquesta funcio s per alliberar memòria quan ja no s'utilitzen els controllers
// Dispose es crida quan es treu la pàgina de la pila de navegació.
// per exemple quan es tanca la pàgina pero no l'utilitzare ja que al retornar a la pagina pot donar error, podriem solventar-ho tancant la pagina i obrintla de nou enlloc de retornar
  @override
  void dispose() {
    _correuController.dispose();
    _contrasenyaController.dispose();
    super.dispose();
  }

  void _guardarCredencials() async {
    Preferencies.correu = _correuController.text;
    Preferencies.contrasenya = _contrasenyaController.text;
  }
  // Aquesta funció comprova si el correu i contrasenya coincidixen amb algun usuari ja registrat al provider de usuarisAppProvider
  // si coincideixen vol dir que hi ha un usuari registrat i navega a la pàgina Home pasant aquest usuari
  // Si les credencials no són correctes, mostra un SnackBar.
  // I si el checkbox "Recordar" està marcat, les credencials es guardaran de nou a Preferencies.

  void _iniciarSessio() async {
    if (_recordarCredencials) {
      _guardarCredencials();
    } else {
      await Preferencies
          .clear(); // 🧹 Borrem les credencials si "Recordar" no esta actiu osiga false
    }

    final usuarisAppProvider =
        Provider.of<UsuarisAppProvider>(context, listen: false);
    // Descomentar aixo si tens una base de dades anomenada examenpmm amb una taula usuaris com la que he proporcionat a la carpeta bd i al port 3000
    // amb un usuari amb drets de lectura anomenat test i contrasenya test

    // await DatabaseService().connect(); // Conectar a la BD antes de consultar

    final usuari = usuarisAppProvider.usuarisApp.firstWhere(
        (usuari) =>
            usuari.email == _correuController.text &&
            usuari.contrasenya1 == _contrasenyaController.text,
        orElse: () => UsuariApp(email: '', contrasenya1: ''));
    if (usuari.email.isNotEmpty) {
      // Navegar a la pàgina Home pasant l'usuari que coincideix amb les credencials de correu electrònic i contrasenya
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(usuari: usuari),
        ),
      );
      // dispose(); // 📌 Per alliberar memòria quan ja no s'utilitzen els controllers
    } else {
      // Mostrar un SnackBar si el usuari no existeix
      // ⚠️ Important si refrescam l'app les credencials es guardaran pero t'hauras de registrar de nou ⚠️
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Usuari o contrasenya incorrectes, registrat de nou si tenies les credencials guardades')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pàgina de login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // icona per fer guapo
            Icon(Icons.account_circle, color: Colors.red, size: 100),
            // TextFields per a introduir les credencials de l'usuari
            TextField(
              controller: _correuController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(hintText: 'Correu electrònic'),
            ),
            TextField(
              controller: _contrasenyaController,
              style: TextStyle(color: Colors.black),
              obscureText: true,
              decoration: InputDecoration(hintText: 'Contrasenya'),
            ),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Aquest checkbox permet recordar les credencials de l'usuari per a que no hagi de tornar a escriure-les cada vegada que obri l'aplicació
                // Si el checkbox està marcat, les credencials es guardaran a Preferencies i es carregaran al iniciar la pàgina de login la propera vegada.
                // Si el checkbox no està marcat, les credencials es netejaran de Preferencies.
                // Això ho fem cridant el mètode clear de Preferencies.
                Checkbox(
                  value: _recordarCredencials,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _recordarCredencials = newValue ?? false;
                      if (!_recordarCredencials) {
                        Preferencies
                            .clear(); // Netejem les credencials si es desmarca "Recordar"
                      } else {
                        _guardarCredencials();
                      }
                    });
                  },
                ),
                Text(
                  'Recordar',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 30),
            // Switch per canviar entre mode clar i fosc de l'aplicació en temps real sense haver de reiniciar l'aplicació per veure els canvis.
            // Si el Switch està activat, el tema de l'aplicació canviarà a fosc i es guardarà l'estat del tema a Preferencies.
            // Si el Switch està desactivat, el tema de l'aplicació canviarà a clar i es guardarà l'estat del tema a Preferencies.
            // Això ho fem cridant el mètode setDarkMode o setLightMode del provider ThemeProvier i cridant el mètode isDarkMode de Preferencies
            //per guardar l'estat del tema i finalment cridant el mètode notifyListeners() per notificar als widgets que depenen d'aquesta classe
            //que el tema ha canviat.

            // SwitchListTile(
            //     value: Preferencies.isDarkMode,
            //     title: const Text('Dark Mode'),
            //     onChanged: (value) {
            //       Preferencies.isDarkMode = value;
            //       if (value) {
            //         themeProvider.setDarkMode();
            //       } else {
            //         themeProvider.setLightMode();
            //       }
            //     }),

            // Botons per a iniciar sessió o registrar-se
            ElevatedButton(
              onPressed: _iniciarSessio,
              child: Text('Iniciar sessió'),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => Register()));
            //   },
            //   child: Text('Registrar-se'),
            // ),
          ],
        ),
      ),
    );
  }
}
