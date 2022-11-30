import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rpg_app/model/campaign_model.dart';

class CampaignService {
  Future<Campaign> fetchCampaign(String id) async {
    var uri = Uri.parse(
        'https://stdrpg-default-rtdb.firebaseio.com/campaign/${id}.json');
    final response = await http.get(uri);

    return Campaign.fromJson(json.decode(response.body));
  }

  Future<List<Campaign>> fetchCampaignList(String id) async {
    var uri = Uri.parse(
        'https://stdrpg-default-rtdb.firebaseio.com/campaign/${id}.json');
    final response = await http.get(uri);
    Map<String, dynamic> _list = json.decode(response.body);
    List<Campaign> _listCampaign = [];

    _list.forEach((id, data) {
      _listCampaign.add(
        Campaign(
          descricao: data["descricao"],
          id: data["id"],
          nome: data["nome"],
          pAtivos: data["pAtivos"],
        ),
      );
    });

    return _listCampaign;
  }

  Future<List<Campaign>> fetchCampaigns() async {
    var uri =
        Uri.parse('https://stdrpg-default-rtdb.firebaseio.com/campaign/.json');
    final response = await http.get(uri);
    Map<String, dynamic> _list = json.decode(response.body);

    List<Campaign> _listCampaigns = [];

    _list.forEach((id, data) {
      _listCampaigns.add(
        Campaign(
            id: data["id"],
            nome: data["nome"],
            descricao: data["descricao"],
            pAtivos: data["pAtivos"]),
      );
    });

    return _listCampaigns;
  }
}
