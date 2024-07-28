import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/user.dart';

class UserApi {
  //Fonction permettant d'avoir des API et asynchrone car il faut un certain temps avant que le serveur me repondre
  //static signifie que cette fonction n'a pas bésoin d'être instancier si on l'appel
  static Future<List<User>> fetchUsers() async {
    // Recupère les données des utilisateurs
    const url = 'https://randomuser.me/api/?results=100';
    // Convertit l'URL en un objet Uri
    final uri = Uri.parse(url);
    // Envoie une requête HTTP GET à l'URL spécifiée et attend la réponse
    final response = await http.get(uri);
    // Récupère le corps de la réponse sous forme de chaîne de caractères
    final body = response.body;
    // Décode la chaîne de caractères JSON en un objet dynamique
    final json = jsonDecode(body);
    //results est la clé de cette API
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      return User.fromMap(e);
    }).toList();
    return users;
  }
}