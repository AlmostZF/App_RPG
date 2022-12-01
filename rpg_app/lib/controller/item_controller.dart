import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rpg_app/controller/fake_Item_controller%20.dart';

import '../model/Item_model.dart';

class Items with ChangeNotifier {
  Items() {
    getItems();
  }

  Map<String, Item> _itemsItem = {...FAKE_ITEM};

  List<Item> get all {
    return [..._itemsItem.values];
  }

  int get count {
    return _itemsItem.length;
  }

  Item byIndex(int i) {
    return _itemsItem.values.elementAt(i);
  }

  //Inclui/altera
  void put(Item item) {
    getItems().then(
      (value) {
        print("TENM}? ${_itemsItem.containsKey(item.id)}");
        if (item.id.trim().isNotEmpty && _itemsItem.containsKey(item.id)) {
          postSingleItem(item, item.id).then((value) => _itemsItem.update(
              item.id,
              (_) => Item(
                    id: item.id,
                    nome: item.nome,
                    peso: item.peso,
                    alcance: item.alcance,
                    dano: item.dano,
                    resistencia: item.resistencia,
                    preco: item.preco,
                    itemUrl: item.itemUrl,
                  )));
        } else {
          final id = Random().nextInt(33333333).toString();
          final finalp = Item(
            nome: item.nome,
            peso: item.peso,
            alcance: item.alcance,
            dano: item.dano,
            resistencia: item.resistencia,
            id: item.id,
            preco: item.preco,
            itemUrl: item.itemUrl,
          );

          postSingleItem(finalp, id)
              .then((value) => _itemsItem.putIfAbsent(id, () => finalp));
        }
        notifyListeners();
      },
    );
    if (item == null) {
      return;
    }

    if (item.id != null &&
        item.id.trim().isNotEmpty &&
        _itemsItem.containsKey(item.id)) {
      postSingleItem(item, item.id);

      _itemsItem.update(
        item.id,
        (_) => Item(
          nome: item.nome,
          peso: item.peso,
          alcance: item.alcance,
          dano: item.dano,
          resistencia: item.resistencia,
          id: item.id,
          preco: item.preco,
          itemUrl: item.itemUrl,
        ),
      );
    } else {
      final id = Random().nextInt(33333333).toString();

      final finalp = Item(
          nome: item.nome,
          peso: item.peso,
          alcance: item.alcance,
          dano: item.dano,
          resistencia: item.resistencia,
          id: id,
          preco: item.preco,
          itemUrl: item.itemUrl);

      postSingleItem(finalp, id);

      _itemsItem.putIfAbsent(id, () => finalp);
    }
    notifyListeners();
  }

  void remove(Item item) {
    if (item == null && item.id == "") {
      return;
    }
    removeSingleItem(item, item.id);

    _itemsItem.remove(item.id);

    notifyListeners();
  }

  //Adiciona no banco ou atualiza
  Future<String> postSingleItem(Item item, String id) async {
    var uri =
        Uri.parse('https://stdrpg-default-rtdb.firebaseio.com/item/$id.json');
    final response = await http.put(uri, body: json.encode(item));

    return response.body;
  }

  //Remove do banco
  Future<String> removeSingleItem(Item item, String id) async {
    var uri =
        Uri.parse('https://stdrpg-default-rtdb.firebaseio.com/item/$id.json');
    final response = await http.delete(uri, body: json.encode(item));

    return response.body;
  }

  //Pega o objeto Person inteiro do banco
  Future<Item> getSingleItem(String id) async {
    var uri =
        Uri.parse('https://stdrpg-default-rtdb.firebaseio.com/item/$id.json');
    final response = await http.get(uri);

    return Item.fromJson(json.decode(response.body));
  }

  //Printa os valores do banco
  //Na tela inicial
  Future<void> getItems() async {
    var uri = Uri.parse('https://stdrpg-default-rtdb.firebaseio.com/item.json');
    try {
      final response = await http.get(uri);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((id, data) {
        _itemsItem.putIfAbsent(
          id,
          () => Item(
              nome: data["nome"],
              peso: data["peso"],
              alcance: data["alcance"],
              dano: data["dano"],
              resistencia: data["resistencia"],
              id: data["id"],
              preco: data["preco"],
              itemUrl: data["itemUrl"]),
        );
        notifyListeners();
      });
    } catch (error) {
      throw error;
    }
  }
}
