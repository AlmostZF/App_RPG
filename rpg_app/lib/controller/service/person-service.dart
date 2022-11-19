import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rpg_app/model/person_model.dart';

class PersonService {
  Future<Person> fetchPerson(Person person) async {
    var uri = Uri.parse(
        'https://stdrpg-default-rtdb.firebaseio.com/person/${person.id}.json');
    final response = await http.get(uri);

    return Person.fromJson(json.decode(response.body));
  }

  Future<List<Person>> fetchPersons() async {
    var uri =
        Uri.parse('https://stdrpg-default-rtdb.firebaseio.com/person/.json');
    final response = await http.get(uri);
    Map<String, dynamic> _list = json.decode(response.body);

    List<Person> _listJogos = [];

    _list.forEach((id, data) {
      _listJogos.add(
        Person(
          avatarUrl: data["avatarUrl"],
          carisma: data["carisma"],
          classe: data["classe"],
          constituicao: data["constituicao"],
          destreza: data["destreza"],
          forca: data["forca"],
          historia: data["historia"],
          id: data["id"],
          ideais: data["ideais"],
          inteligencia: data["inteligencia"],
          jogador: data["jogador"],
          mana: data["mana"],
          nivel: data["nivel"],
          nome: data["nome"],
          raca: data["raca"],
          sabedoria: data["sabedoria"],
          vida: data["vida"],
        ),
      );
    });

    return _listJogos;
  }
}
