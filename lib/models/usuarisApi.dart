// Autor : Raül Lama Martorell
// Data: 20 de 02 de 2025
// Versió 1.0

// Classe que defineix el model dels usuaris de l'API
class Usuari {
  String id;
  String nom;
  String descripcio;
  String foto;
  String cognom1;
  String cognom2;

  Usuari({
    required this.id,
    required this.nom,
    required this.descripcio,
    required this.foto,
    required this.cognom1,
    required this.cognom2,
  });

  // Per rebre dades i convertir-les en objectes Usuari

  factory Usuari.fromMap(Map<String, dynamic> json) => Usuari(
        id: json["id"] ?? "Sense id",
        nom: json["nom"] ?? "Sense nom",
        descripcio: json["descripcio"] ?? "sense descripcio",
        foto: json["foto"] ??
            "https://paucasesnovescifp.cat/wp-content/uploads/2021/fotos-fi-curs-21-22/m2t.jpeg", // Imagen por defecto
        cognom1: json["cognom1"] ?? "Sense cognom1",
        cognom2: json["cognom2"] ?? "Sense cognom2",
      );

// Per enviar dades a en format JSON
  Map<String, dynamic> toMap() => {
        "address": id,
        "nom": nom,
        "descripcio": descripcio,
        "photo": foto,
        "cognom1": cognom1,
        "congom2": cognom2,
      };
}
