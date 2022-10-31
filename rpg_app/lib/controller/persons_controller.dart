import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rpg_app/model/person_model.dart';

class Persons with ChangeNotifier {
  Persons() {
    getPersons();
    //_person = getSinglePerson("28112208");
    //_person.then((value) => print("bbb${value.nome}"));
  }

  Map<String, Person> _items = {};

  List<Person> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Person byIndex(int i) {
    return _items.values.elementAt(i);
  }

  //Inclui/altera
  void put(Person person) {
    if (person == null) {
      return;
    }

    if (person.id != null &&
        person.id.trim().isNotEmpty &&
        _items.containsKey(person.id)) {
      _items.update(
        person.id,
        (_) => Person(
            avatarUrl: person.avatarUrl,
            carisma: person.carisma,
            classe: person.classe,
            constituicao: person.constituicao,
            destreza: person.destreza,
            forca: person.forca,
            historia: person.historia,
            id: person.id,
            ideais: person.ideais,
            inteligencia: person.inteligencia,
            jogador: person.jogador,
            mana: person.mana,
            nivel: person.nivel,
            nome: person.nome,
            raca: person.raca,
            sabedoria: person.sabedoria,
            vida: person.vida),
      );
    } else {
      final id = Random().nextInt(33333333).toString();

      _items.putIfAbsent(
        id,
        () => Person(
            avatarUrl: person.avatarUrl,
            carisma: person.carisma,
            classe: person.classe,
            constituicao: person.constituicao,
            destreza: person.destreza,
            forca: person.forca,
            historia: person.historia,
            id: id,
            ideais: person.ideais,
            inteligencia: person.inteligencia,
            jogador: person.jogador,
            mana: person.mana,
            nivel: person.nivel,
            nome: person.nome,
            raca: person.raca,
            sabedoria: person.sabedoria,
            vida: person.vida),
      );
      postSinglePerson(_items.values.last, _items.keys.last);
    }
    notifyListeners();
  }

  void remove(Person person) {
    if (person != null && person.id != null) {
      _items.remove(person.id);
      notifyListeners();
    }
  }

  String title = "";
  Future<String> postSinglePerson(Person person, String id) async {
    var uri =
        Uri.parse('https://stdrpg-default-rtdb.firebaseio.com/person/$id.json');
    final response = await http.put(uri, body: json.encode(person));

    return response.body;
  }

  Future<Person> getSinglePerson(String id) async {
    var uri =
        Uri.parse('https://stdrpg-default-rtdb.firebaseio.com/person/$id.json');
    final response = await http.get(uri);

    return Person.fromJson(json.decode(response.body));
  }

  Future<void> getPersons() async {
    var uri =
        Uri.parse('https://stdrpg-default-rtdb.firebaseio.com/person.json');
    try {
      final response = await http.get(uri);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((id, data) {
        _items.putIfAbsent(
          id,
          () => Person(
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
        notifyListeners();
      });
    } catch (error) {
      throw error;
    }
  }
}
