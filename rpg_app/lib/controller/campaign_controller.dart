import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rpg_app/model/campaign_model.dart';

class Campaigns with ChangeNotifier {
  Campaigns() {
    getCampaign();
  }

  final Map<String, Campaign> _itemsCampaign = {};

  List<Campaign> get all {
    return [..._itemsCampaign.values];
  }

  int get count {
    return _itemsCampaign.length;
  }

  Campaign byIndex(int i) {
    return _itemsCampaign.values.elementAt(i);
  }

  //Inclui/altera
  void put(Campaign campaign) {
    getCampaign().then(
      (value) {
        if (campaign.id.trim().isNotEmpty &&
            _itemsCampaign.containsKey(campaign.id)) {
          postSingleCampaing(campaign, campaign.id)
              .then((value) => _itemsCampaign.update(
                    campaign.id,
                    (_) => Campaign(
                        id: campaign.id,
                        nome: campaign.nome,
                        descricao: campaign.descricao,
                        pAtivos: campaign.pAtivos),
                  ));
        } else {
          print("A");
          final id = Random().nextInt(33333333).toString();
          final finalp = Campaign(
              id: id,
              nome: campaign.nome,
              descricao: campaign.descricao,
              pAtivos: campaign.pAtivos);

          postSingleCampaing(finalp, id)
              .then((value) => _itemsCampaign.putIfAbsent(id, () => finalp));
        }
        notifyListeners();
      },
    );
  }

  void remove(Campaign campaign) {
    getCampaign().then((value) {
      if (campaign.id == "") {
        return;
      }
      removeSingleCampaign(campaign, campaign.id);

      _itemsCampaign.remove(campaign.id);

      notifyListeners();
    });
  }

  //Adiciona no banco ou atualiza
  Future<String> postSingleCampaing(Campaign campaign, String id) async {
    var uri = Uri.parse(
        'https://stdrpg-default-rtdb.firebaseio.com/campaign/$id.json');
    final response = await http.put(uri, body: json.encode(campaign));

    return response.body;
  }

  //Remove do banco
  Future<String> removeSingleCampaign(Campaign campaign, String id) async {
    var uri = Uri.parse(
        'https://stdrpg-default-rtdb.firebaseio.com/campaign/$id.json');
    final response = await http.delete(uri, body: json.encode(campaign));

    return response.body;
  }

  Future<void> getCampaign() async {
    var uri =
        Uri.parse('https://stdrpg-default-rtdb.firebaseio.com/campaign.json');
    try {
      final response = await http.get(uri);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      extractedData.forEach((id, data) {
        _itemsCampaign.putIfAbsent(
          id,
          () => Campaign(
            id: data["id"],
            nome: data["nome"],
            descricao: data["descricao"],
            pAtivos: data['pAtivos'],
          ),
        );
        notifyListeners();
      });
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }
}
