import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rpg_app/data/fakePersonagens.dart';
import 'package:rpg_app/view/models/personagem.dart';

class Personagens with ChangeNotifier {
  Map<String, Personagem> _items = {...FAKE_PERSONAGENS};

  List<Personagem> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Personagem byIndex(int i) {
    return _items.values.elementAt(i);
  }

  //Inclui/altera
  void put(Personagem personagem) {
    if (personagem == null) {
      return;
    }

    if (personagem.id != null &&
        personagem.id.trim().isNotEmpty &&
        _items.containsKey(personagem.id)) {
      _items.update(
        personagem.id,
        (_) => Personagem(
            avatarUrl: personagem.avatarUrl,
            carisma: personagem.carisma,
            classe: personagem.classe,
            constituicao: personagem.constituicao,
            destreza: personagem.destreza,
            forca: personagem.forca,
            historia: personagem.historia,
            id: personagem.id,
            ideais: personagem.ideais,
            inteligencia: personagem.inteligencia,
            jogador: personagem.jogador,
            mana: personagem.mana,
            nivel: personagem.nivel,
            nome: personagem.nome,
            raca: personagem.raca,
            sabedoria: personagem.sabedoria,
            vida: personagem.vida),
      );
    } else {
      final id = Random().nextDouble().toString();

      _items.putIfAbsent(
          id,
          () => Personagem(
              avatarUrl: personagem.avatarUrl,
              carisma: personagem.carisma,
              classe: personagem.classe,
              constituicao: personagem.constituicao,
              destreza: personagem.destreza,
              forca: personagem.forca,
              historia: personagem.historia,
              id: id,
              ideais: personagem.ideais,
              inteligencia: personagem.inteligencia,
              jogador: personagem.jogador,
              mana: personagem.mana,
              nivel: personagem.nivel,
              nome: personagem.nome,
              raca: personagem.raca,
              sabedoria: personagem.sabedoria,
              vida: personagem.vida));
    }
    notifyListeners();
  }

  void remove(Personagem personagem) {
    if (personagem != null && personagem.id != null) {
      _items.remove(personagem.id);
      notifyListeners();
    }
  }
}
