import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/controller/campaign_controller.dart';
import 'package:rpg_app/controller/persons_controller.dart';
import 'package:rpg_app/controller/service/campaign_service.dart';
import 'package:rpg_app/model/campaign_model.dart';
import 'package:rpg_app/routes/app_routes.dart';
import 'package:rpg_app/model/person_model.dart';
import 'package:rpg_app/style/colors.dart';
import 'package:rpg_app/view/battle_screen.dart';

class ActivePersonCard extends StatelessWidget {
  final Person person;
  const ActivePersonCard(this.person);

  @override
  Widget build(BuildContext context) {
    CampaignService _campaignService = CampaignService();
    late Future<Campaign> _futureCampaign;
    final _form = GlobalKey<FormState>();
    final Map<String, String> _formData = {};

    final avatar = person.avatarUrl.isEmpty
        ? const CircleAvatar(
            child: Icon(
              Icons.person,
              size: 27,
            ),
            radius: 27,
          )
        : CircleAvatar(
            radius: 27,
            backgroundImage: NetworkImage(person.avatarUrl),
          );
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 3),
      child: Card(
        color: colorFist,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: avatar,
            title: Text(
              person.nome,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
            textColor: Colors.white,
            subtitle: Text(
                "Nível: ${person.nivel} | ${person.raca}\n${person.classe}"),
            trailing: Column(
              children: [
                Icon(Icons.favorite),
                Text("${person.vida}"),
              ],
            ),
            iconColor: secondColor,
          ),
        ),
      ),
    );
  }
}
