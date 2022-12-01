import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rpg_app/controller/fake_power_controller.dart';
import 'package:rpg_app/model/power_model.dart';

class Powers with ChangeNotifier {
  Powers() {
    getPowers();
  }

  Map<String, Power> _itemsPower = {...FAKE_POWER};

  List<Power> get all {
    return [..._itemsPower.values];
  }

  int get count {
    return _itemsPower.length;
  }

  Power byIndex(int i) {
    return _itemsPower.values.elementAt(i);
  }

  //Inclui/altera
  void put(Power power) {
    if (power == null) {
      return;
    }

    if (power.id != null &&
        power.id.trim().isNotEmpty &&
        _itemsPower.containsKey(power.id)) {
      postSinglePower(power, power.id);

      _itemsPower.update(
        power.id,
        (_) => Power(
          nome: power.nome,
          tempoconjuracao: power.tempoconjuracao,
          alcance: power.alcance,
          duracao: power.duracao,
          mana: power.mana,
          dano: power.dano,
          componente: power.componente,
          id: power.id,
          nivel: power.nivel,
          poderUrl: power.poderUrl,
        ),
      );
    } else {
      final id = Random().nextInt(33333333).toString();

      final finalp = Power(
        nome: power.nome,
        tempoconjuracao: power.tempoconjuracao,
        alcance: power.alcance,
        duracao: power.duracao,
        mana: power.mana,
        dano: power.dano,
        componente: power.componente,
        id: id,
        nivel: power.nivel,
        poderUrl: power.poderUrl
      );

      postSinglePower(finalp, id);

      _itemsPower.putIfAbsent(id, () => finalp);
    }
    notifyListeners();
  }

  void remove(Power power) {
    if (power == null && power.id == "") {
      return;
    }
    removeSinglePower(power, power.id);

    _itemsPower.remove(power.id);

    notifyListeners();
  }

  //Adiciona no banco ou atualiza
  Future<String> postSinglePower(Power power, String id) async {
    var uri =
        Uri.parse('https://stdrpg-default-rtdb.firebaseio.com/power/$id.json');
    final response = await http.put(uri, body: json.encode(power));

    return response.body;
  }

  //Remove do banco
  Future<String> removeSinglePower(Power power, String id) async {
    var uri =
        Uri.parse('https://stdrpg-default-rtdb.firebaseio.com/power/$id.json');
    final response = await http.delete(uri, body: json.encode(power));

    return response.body;
  }

  //Pega o objeto Person inteiro do banco
  Future<Power> getSinglePower(String id) async {
    var uri =
        Uri.parse('https://stdrpg-default-rtdb.firebaseio.com/power/$id.json');
    final response = await http.get(uri);

    return Power.fromJson(json.decode(response.body));
  }

  //Printa os valores do banco
  //Na tela inicial
  Future<void> getPowers() async {
    var uri =
        Uri.parse('https://stdrpg-default-rtdb.firebaseio.com/power.json');
    try {
      final response = await http.get(uri);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((id, data) {
        _itemsPower.putIfAbsent(
          id,
          () => Power(
            nome: data["nome"],
            tempoconjuracao: data["tempoconjuracao"],
            alcance: data["alcance"],
            duracao: data["duracao"],
            mana: data["mana"],
            dano: data["dano"],
            componente: data["componente"],
            id: data["id"],
            nivel: data["nivel"],
            poderUrl: data["poderUrl"]
          ),
        );
        notifyListeners();
      });
    } catch (error) {
      throw error;
    }
  }
}
