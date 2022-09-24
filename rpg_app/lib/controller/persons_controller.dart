import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rpg_app/model/person_model.dart';

class Persons with ChangeNotifier {
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
      final id = Random().nextDouble().toString();

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
              vida: person.vida));
    }
    notifyListeners();
  }

  void remove(Person person) {
    if (person != null && person.id != null) {
      _items.remove(person.id);
      notifyListeners();
    }
  }
}
