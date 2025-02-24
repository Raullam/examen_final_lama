import 'package:examen_final_lama/providers/usuariApi_provider.dart';
import 'package:examen_final_lama/screens/login_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/usuari.dart';
import '../providers/usuari_provider.dart';
import 'pagina_detall.dart';
// Autor : Raül Lama Martorell

// Pantalla principal de l'aplicació un cop iniciada la sessió
class HomePage extends StatelessWidget {
  final UsuariApp usuari;

  HomePage({Key? key, required this.usuari}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuariProvider = Provider.of<UsuariAPIProvider>(context);

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
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage())),
              child: Text('Login')),
          // ara carregare tots el usuaris de el provider de la api
          Text('Usuaris Api'),
          // Si usuariProvider està carregant mostra un cercle de carrega si no mostra la llista d'usuaris carregats de l'api.
          usuariProvider.isLoading
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  // Si no hi ha usuaris mostra un text, si no mostra la llista d'usuaris de l'api.
                  // Si es fa clic en un usuari es mostra la pantalla de detall d'usuari de l'api.
                  child: ListView.builder(
                    itemCount: usuariProvider.usuaris.length,
                    itemBuilder: (context, index) {
                      final usuari = usuariProvider.usuaris[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(usuari.foto),
                        ),
                        title: Text(usuari.nom),
                        tileColor: const Color.fromARGB(255, 163, 40, 40),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetallUsuari(usuari: usuari),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
